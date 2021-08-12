<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>


	// 페이지 로드 시 크롤링 중인지 검사
	$(function() {
	    $.ajax({
	    	url:'isCrawlRunning.do',
	    	method:'post',
	    	success:function(result){
	    		if(result == 1){
	    			$('#hiddenProgressRun').val('true');
	    			var getCrawlProgress = setInterval(function(){
	    				$('#progressDiv').css('display', 'block'); // 숨겼던 진행률 div show
	    				$.ajax({
	    					url : 'getCrawlProgress.do',
	    					method:'post',
	    					success : function(result) {
	    						console.log(result);
	    						$('#progressBar').attr('width', result);
	    						$('#progressBar').text(result+'% 완료됨');
	    					},
	    					error : function(err) {
	    						console.log(err);
	    					}
	    				});
	    			}, 5000);
	    			
	    			if()
	    			
	    		}
	    	},
	    	error:function(err){
	    		console.log(err);
	    	}
	    })
	});

	// 버튼 누르면 크롤링
	function crawl(gender) {
		$.ajax({
			url : 'crawl.do',
			method:'post',
			data : {gender : gender},
			success : function(result) {
				$('#progressBar').text('완료!');
				$('#hiddenProgressRun').val('false');
			},
			error : function(err) {
				console.log(err);
			}
		});
		setInterval(getCrawlProgress, 5000); // ajax 안에 넣으면 크롤링 전부 다 끝나고 진행률을 보여주므로 바깥으로 빼야함
	}
	
	
</script>
</head>
<body>
	<br><br><br><br><br><br><br><br><br><br><br>
	<button onclick="crawl('MALE')">남자 헤어 크롤링</button>
	<div class="progress" id="progressDiv" style="height:15px; width:200px; display:none;">
		<input type="hidden" id="hiddenProgressRun" value="false">
  		<div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" id="progressBar" style="width: 100%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">준비됨!</div>
	</div>
</body>
</html>