<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
	
	var isRun = false;
	
	// 1. 작업 시켜놓고 나갔다가 들어오는 경우 페이지 로드 시 크롤링 중인지 검사
	// 2. 버튼 눌러놓고 기다리는 경우
	
	// 페이지 로드 시 크롤링 중인지 검사, 
	$(function() {
	    $.ajax({
	    	url:'isCrawlRunning.do',
	    	method:'post',
	    	success:function(isCrawl){ // 크롤링 중이면 java에서 1 리턴
	    		if(isCrawl == 1){
	    			isRun = true; // 돌아가는 중이다
	    			btnToggle('disable'); // 실행중이므로 버튼 잠금
    				$('#progressDiv').css('display', 'block'); // 숨겨놨던 진행률 div show
    				var getCrawlProgress = setInterval(function(){ // 4초마다 진행률 가져오는 ajax 실행
    					if (isRun){
		    				$.ajax({
		    					url : 'getCrawlProgress.do',
		    					method:'post',
		    					success : function(progress) {
		    						if ( progress == 100 ) { // 0에서 시작한 진행률이 100이면
		    							clearInterval(getCrawlProgress); // 인터벌 걸린 함수 삭제
		    							afterCrawl('done');
		    						} else { // 진행률이 0~98이면
		    							$('#progressBar').text(progress+'% 완료됨');
		    						}
		    					},
		    					error : function(err) {
		    						console.log(err);
		    						clearInterval(getCrawlProgress);
		    						afterCrawl('error');
		    					}
		    				});
    					} else {
    						clearInterval(getCrawlProgress);
    						isRun = false;
    					}
	    			}, 4000);
	    		}
	    	},
	    	error:function(err){
	    		console.log(err);
	    		clearInterval(getCrawlProgress);
	    		afterCrawl('error');
	    	}
	    })
	});

	// 버튼 누르면 크롤링
	function crawl(gender) {
		if ($('#id').val() == ''){
			alert('아이디를 입력하세요');
			return false;
		}
		if ($('#pw').val() == ''){
			alert('비밀번호를 입력하세요');
			return false;
		}
		if (isRun == false){ // 돌아가는 중이 아니면
			$('#progressBar').removeClass('bg-danger');
			isRun = true; // 버튼 눌러서 크롤링 시작했으니까 true
			btnToggle('disable'); // 버튼 잠그기
			$('#progressDiv').css('display', 'block'); // 숨겼던 진행률 div show
			$.ajax({
				url : 'crawl.do',
				method:'post',
				data : {gender : gender, id : $('#id').val(), pw : $('#pw').val() },
				success : function(result) {
					console.log(result);
					if(result == 'success') {
						afterCrawl('done');
					} else {
						afterCrawl('error');
					}
				},
				error : function(err) {
					clearInterval(getCrawlProgress);
					afterCrawl('error');
					btnToggle('able');
				}
			});
			
			var getCrawlProgress = setInterval(function(){ // ajax 안에 넣으면 크롤링 전부 다 끝나고 진행률을 보여주므로 바깥으로 빼야함
				if (isRun){
					$.ajax({
						url : 'getCrawlProgress.do',
						method:'post',
						success : function(progress) {
							if ( progress == 100 ) {
								clearInterval(getCrawlProgress); // 인터벌 걸린 함수 삭제
								afterCrawl('done');
							} else {
								$('#progressBar').text(progress+'% 완료됨');
							}
						},
						error : function(err) {
							clearInterval(getCrawlProgress);
							afterCrawl('error');
						}
					});
				} else {
					clearInterval(getCrawlProgress);
					isRun = false;
				}
			}, 4000);
		}
	}
	function afterCrawl(state){ // 크롤링 끝난 다음에 실행되는 후처리용 fnc
		isRun == false;
		resetCrawlData();
		btnToggle('able'); // 버튼 잠금 해제
		if (state == ('done')){
			$('#progressBar').text('완료!');
		} else {
			$('#progressBar').text('에러!');
			$('#progressBar').addClass('bg-danger');
		}
		
	}
	//setInterval 끝난 다음에 먹어야 하는데 추후 개선 필요... 귀찮으면 새로고침 하라 하면 됨
	function resetCrawlData(){ // 크롤링 내역 다시 가져오는 fnc
		$.ajax({
			method:'post',
			url:'resetCrawlData.do',
			success:function(result){
				$('#crawlData').html('남자 : '+result[0].stringDate+'<br>여자 : '+result[1].stringDate);
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	function btnToggle(state){ // 버튼 잠그는 fnc
		if (state == 'able'){
			$('#crawlBtnMale').attr('disabled', false);
			$('#crawlBtnFemale').attr('disabled', false);	
		} else if (state == 'disable') {
			$('#crawlBtnMale').attr('disabled', true);
			$('#crawlBtnFemale').attr('disabled', true);
		}
	}
	
</script>
</head>
<body>


<div class="container margin-tb-200px">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6" style="margin:auto;">
			<div class="btnGroup" align="center">
				<div class="form-group label-floating">
					인스타그램 ID : <input id="id"
						class="form-control" placeholder="internet2dot02021"
						type="text" style="width: 50%; display:inline-block;">
				</div>
				<div class="form-group label-floating">
					비밀번호 : <input
						class="form-control" placeholder="비밀번호를 입력해주세요." type="password"
						id="pw" style="width: 50%; display:inline-block;">
				</div>
				<button class="btn btn-primary" onclick="crawl('MALE')" id="crawlBtnMale">남자 헤어 크롤링</button>
				<button class="btn btn-primary" onclick="crawl('FEMALE')" id="crawlBtnFemale">여자 헤어 크롤링</button>
			</div>
			<br>
				<div class="alert alert-primary alert-dismissible fade show" role="alert" style="display:inline-block; width:100%;">
				  완료까지는 <strong>약 7~8분의 시간이 소요</strong>됩니다. <br> 다른 작업을 하시다 오시는 것을 추천합니다.
				</div>
			<div class="progress" id="progressDiv" style="height:25px; width:100%; display:none;">
				<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" id="progressBar" style="width: 100%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">준비됨!</div>
			</div>
			<div>
				<br>
				가장 마지막으로 크롤링 한 시점
				<div id="crawlData">
					남자 : ${crawlDatas[0].stringDate } <br> 여자 : ${crawlDatas[1].stringDate } 
				</div>
			</div>
		
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>



	
	
</body>
</html>