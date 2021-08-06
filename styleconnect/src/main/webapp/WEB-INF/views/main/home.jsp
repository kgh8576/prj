<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <title>Tabib HTML5 Health Directory Template</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;1,700&display=swap" rel="stylesheet">
    <style>


body {
 font-family: 'Lato', sans-serif;
}
.wrapper {
padding-top: 120px;
}
.card-body{
    text-align: center;
    box-shadow: 0px 15px 15px -8px rgba(0,0,0,0.5)
}
.card-body h6 {
font-size: 14px;
}
.card-title {
text-transform: uppercase;
font-weight: bold;
font-size: 24px;
}

@media (max-width: 800px){
    .mx-30{
        margin-bottom: 30px;
    }
}

    
    </style>
    <script>
    
    	// 페이지 로드 시 cut 디자이너(디폴트값) 데이터 뿌리기
    	$(function(){
    		topDesChange('cut');
    		topDesChange('makeUp');
    	});
    	
    	function crawl(){
    		$.ajax({
    			url:'crawl.do',
    			success:function(result){
    				console.log(result);
    			},
    			error:function(err){
    				console.log(err);
    			}
    		});
    	}
    	
		// 버튼 클릭 시 디자이너 top3 이름, 평점, 이미지 경로 가져오는 ajax    		
    	function topDesChange(keyword){
        	$.ajax({
        		url:'ajaxTopDesChange.do',
        		data:{ keyword:keyword },
        		success:function(result){
        			console.log(result);
        			if (keyword != 'makeUp'){
        				var targetKeyword = 'Hair';
        			}
       				else{
       					var targetKeyword = 'MakeUp';
       				}
        			for(var i = 0; i < result.length; i++){
        				$('#target'+targetKeyword+'Name'+(i+1)).text(result[i].name); // 이름 변경
        				$('#target'+targetKeyword+'Star'+(i+1)).html(''); // 별점 다 지우기
        				for(var j = 0; j < result[i].rate; j++){ // 별점 변경
        					$('#target'+targetKeyword+'Star'+(i+1)).append('<li class="active"></li>');	
        				}
        				$('#target'+targetKeyword+'Image'+(i+1)).attr('src', '${pageContext.request.contextPath}/resources/img/'+result[i].fileUuid); // 파일 이미지 변경
        				$('#target'+targetKeyword+'ATag'+(i+1)).attr('href', 'desListSelect.do?id='+result[i].id); // A태그 링크 변경
        				var sliced = result[i].major.split(',');
        				$('#target'+targetKeyword+'HashTag'+(i+1)).html('');
        				for(var j = 0; j < sliced.length; j++){ // 해시태그 추가해주고 링크 걸기
        					$('#target'+targetKeyword+'HashTag'+(i+1)).append('<a href="searchList.do?search='+sliced[j]+'"> <span class="text-grey-2">#'+sliced[j]+'</span> </a>');
        				}
            			$('#target'+targetKeyword+'HashTag'+(i+1)).append('');
        			}
        		},
        		error:function(err){
        			console.log(err);
        		}
        	});
        	// 총 리뷰 수 가져오는 ajax
        	$.ajax({
        		url:'ajaxTopDesCount.do',
        		data:{ keyword:keyword },
        		success:function(ratingResult){
        			if (keyword != 'makeUp'){
        				var targetKeyword = 'Hair';
        			}
       				else{
       					var targetKeyword = 'MakeUp';
       				}
        			
        			for(var i = 0; i < ratingResult.length; i++){
        				$('#target'+targetKeyword+'ReviewCnt'+(i+1)).text('총 리뷰 수 '+ratingResult[i].count+'건');
        			}
        			

                    
        			
        		},
        		error:function(err){
        			console.log(err);
        		}
        	});
    	}
		function preFrmSubmit(){
			if( $("input:checkbox[name=YesorNo]:checked").length == 0 ){
				alert("필요한 서비스를 체크하세요");
				return false;
			}
			if( location == 'false' ){
				alert("지역을 입력해주세요");
				return false;
			}
			
			var locations = $('#location option:selected').val();
			var yncheck = document.getElementsByName("YesorNo");
			for (var i = 0; i < yncheck.length; i++) {
				if (yncheck[i].checked) {
					yncheck[i].value = "Y";
				} else {
					yncheck[i].value = "N";
				}
			}
			var permYn = $('#permyn1').val();
			var cutYn = $('#cutyn1').val();
			var dyeYn = $('#dyeyn1').val();
			var makeUpYn = $('#makeupyn1').val();
			
			$.ajax({
				url:'memDetailInsert.do',
				method:'post',
				data:{
						permYn : permYn,
						cutYn : cutYn,
						dyeYn : dyeYn,
						makeupYn : makeUpYn,
						location : locations
					},
				success:function(result){
					alert(result);
					location.reload();
				},
				error:function(err){
					console.log(err);
				}
				
			});
		}
		
    </script>
</head>

<body>





    <section class="banner padding-tb-200px sm-ptb-80px background-overlay" style="background-image: url('http://placehold.it/1600x830');">
        <div class="container z-index-2 position-relative">
            <div class="title text-center">
                <h1 class="text-title-large text-main-color font-weight-300 margin-bottom-15px">Style Connect</h1>
                <h4 class="font-weight-300 text-main-color text-up-small">나에게 맞는 디자이너를 찾아보세요!</h4>
            </div>
            <!-- 검색창 -->
            <div class="row justify-content-center margin-tb-60px">
            	<div class="col-lg-2"></div>
                <div class="col-lg-7">
                    <div class="listing-search">
                        <form id="frm" action="searchList.do" method="post">
 							<div class="margin-bottom-30px">
                        	<div class="padding-30px background-white border-radius-10">
                            <h4><i class="fas fa-search margin-right-10px text-main-color"></i> Search</h4>
                            <hr>
                            <div class="input-group mb-3">
                                <input type="text" name="search" placeholder="${searchkeyword}" class="form-control border-radius-0">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary text-white background-main-color border-radius-0" type="submit">Search</button>
                                </div>
                            </div>
                        	</div>
                    			</div>
						</form>
                           
								<div>
									<a href="#" class="text-primary">#호일펌</a>
									<a href="#" class="text-primary">#구자혁</a>
									<a href="#" class="text-primary">#병지컷</a>
									<a href="reviewList.do?desId=des04">테스트테스트</a>
									<button onclick="crawl()">크롤링테스트</button>
								</div>
                            </div>
                    </div>
                    <div class="col-lg-3">
                         <div class="hashTagList" style="display: inline-block; width: 200px; overflow:auto; "  >
                         	인스타그램 인기 검색 태그
							<div class="list-group">
						  		<a href="#" class="list-group-item list-group-item-action">${hashTag.first }</a>
						  		<a href="#" class="list-group-item list-group-item-action">${hashTag.two }</a>
						  		<a href="#" class="list-group-item list-group-item-action">${hashTag.three }</a>
						  		<a href="#" class="list-group-item list-group-item-action">${hashTag.four }</a>
						  		<a href="#" class="list-group-item list-group-item-action">${hashTag.five }</a>
							</div>
						</div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
            </div>
            <!-- 검색창 끝 -->



    </section>
            <div class="row justify-content-center">
               <!-- 디자이너 추천 영역 -->
				<c:if test="${empty memDetail && not empty id }">
	               	<!-- modal Btn -->
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#preferenceFrmModal">
					  더 나은 서비스 제공을 위해서 시간을 내주세요!
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="preferenceFrmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      	<form id="preferenceFrm" action="memDetailInsert.do" method="post">
						      	<h5>내가 필요한 서비스는...</h5>
						      	<h6 align="right" style="color: grey;">다중 선택 가능</h6>
								<div class="select" style="text-align: center;" id="needService">
									<input class="check" type="checkbox" name="YesorNo" id="makeupyn1" value="Y"><label style="width: 60px;" for="makeupyn1"> 메이크업 </label> <input class="finalcheck" type="hidden" id="makeupyn" name="makeupyn">
									<input class="check" type="checkbox" name="YesorNo" id="cutyn1" value="Y"><label style="width: 60px;" for="cutyn1"> 커트 </label> <input class="finalcheck" type="hidden" id="cutyn" name="cutyn">
									<input class="check" type="checkbox" name="YesorNo" id="permyn1" value="Y"><label style="width: 60px;" for="permyn1"> 펌 </label> <input class="finalcheck" type="hidden" id="permyn" name="permyn">
									<input class="check" type="checkbox" name="YesorNo" id="dyeyn1" value="Y"> <label style="width: 60px;" for="dyeyn1"> 염색 </label> <input class="finalcheck" type="hidden" id="dyeyn" name="dyeyn">
								</div>
								
								<h5>내 거주지는...</h5>
								<div class="input-group mb-3" align="center" >
								  <select class="custom-select" id="location" name="location">
								  	<option disabled="disabled" selected="selected" value="false">거주지 선택</option>
								  	<optgroup label="시">
									    <option value="서울">서울</option>
									    <option value="부산">부산</option>
									    <option value="인천">인천</option>
									    <option value="대구">대구</option>
									    <option value="대전">대전</option>
									    <option value="광주">광주</option>
									    <option value="울산">울산</option>
								  	</optgroup>
								  	<optgroup label="도">
									    <option value="경기도">경기도</option>
									    <option value="충청도">충청도</option>
									    <option value="경상도">경상도</option>
									    <option value="전라도">전라도</option>
									    <option value="제주도">제주도</option>
								    </optgroup>
								  </select>
								</div>
							</form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" onclick="preFrmSubmit()">제출</button>
					      </div>
					    </div>
					  </div>
					</div>
					
				</c:if>
				<c:if test="${not empty memDetail }">
				
				
				<div class="wrapper">
        <div class="container">
        	<h2 class="text-title-large text-main-color font-weight-200 margin-bottom-15px" align="center">당신을 위한 맞춤 디자이너</h2><br><br>
        <div class="row">
            <div class="col-md-6 col-lg-4">
            	<h3 align="center">가장 핫한 디자이너</h3>
            	<a href="desListSelect.do?id=${rcmdDesByConHis.id}">
                <div class="card mx-30">
                  <img src="${pageContext.request.contextPath}/resources/img/${rcmdDesByConHis.fileUuid }" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">${rcmdDesByConHis.name } 디자이너</h5>
<h6>
<c:set var="majors" value="${fn:split(rcmdDesByConHis.major,',')}"></c:set>
<c:forEach var="major" items="${majors}">
    <a href="searchList.do?search=${major }"> <span class="text-secondary">#${major}</span> </a>
</c:forEach>


</h6>
<p class="card-text">
                            <div class="rating clearfix">
                                <strong class="float-center text-grey-2" id="rcmdDesByConHisReviewCnt">
                                총 진행 건수 ${rcmdDesByConHis.count } 건
								</strong>
                            </div>
</p>
</div>
</div></a>
</div>
				<div class="col-md-6 col-lg-4">
                <h3 align="center">호평일색 디자이너</h3>
                <a href="desListSelect.do?id=${rcmdDesByRate.id}">
                <div class="card mx-30">
                  <img src="${pageContext.request.contextPath}/resources/img/${rcmdDesByRate.fileUuid }" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">${rcmdDesByRate.name } 디자이너</h5>
<h6>
<c:set var="majors2" value="${fn:split(rcmdDesByRate.major,',')}"></c:set>
<c:forEach var="major2" items="${majors2}">
    <a href="searchList.do?search=${major2 }"> <span class="text-secondary">#${major2}</span> </a>
</c:forEach>
</h6>
<p class="card-text">
		                            <div class="rating clearfix" style="display: inline-block;">
		                                <ul class="float-left" id="rcmdDesByRateStar">
                       						<c:forEach begin="1" end="${rcmdDesByRate.rate }">
												<li class="active"></li>
											</c:forEach>
											<c:forEach begin="${rcmdDesByRate.rate+1}" end="5">
												<li></li>
											</c:forEach>
		                                </ul>
		                                <small class="float-right text-grey-2" id="rcmdDesByRateReviewCnt"></small>
		                            </div>

</p>
</div>
</div></a>
</div>
</div>
</div>
</div>
				
            
				</c:if>
            </div>

    <section class="padding-tb-100px">
        <div class="container">

            <div class="row">

                <div class="col-lg-3 col-md-6 sm-mb-30px wow fadeInUp">
                    <div class="service text-center opacity-hover-7 hvr-bob">
                        <div class="icon margin-bottom-10px">
                            <img src="assets/img/icon/service-1.png" alt="">
                        </div>
                        <h3 class="text-second-color">Reliable Places</h3>
                        <p class="text-grey-2">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 sm-mb-30px wow fadeInUp" data-wow-delay="0.2s">
                    <div class="service text-center opacity-hover-7 hvr-bob">
                        <div class="icon margin-bottom-10px">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/icon/service-2.png" alt="">
                        </div>
                        <h3 class="text-second-color">High Credibility</h3>
                        <p class="text-grey-2">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 sm-mb-30px wow fadeInUp" data-wow-delay="0.4s">
                    <div class="service text-center opacity-hover-7 hvr-bob">
                        <div class="icon margin-bottom-10px">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/icon/service-3.png" alt="">
                        </div>
                        <h3 class="text-second-color">Quick search</h3>
                        <p class="text-grey-2">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 sm-mb-30px wow fadeInUp" data-wow-delay="0.6s">
                    <div class="service text-center opacity-hover-7 hvr-bob">
                        <div class="icon margin-bottom-10px">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/icon/service-4.png" alt="">
                        </div>
                        <h3 class="text-second-color">Know better</h3>
                        <p class="text-grey-2">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy</p>
                    </div>
                </div>

            </div>

        </div>
    </section>


    <section class="padding-tb-100px background-grey-1">
        <div class="container">
            <!-- Title -->
            <div class="row justify-content-center margin-bottom-45px">
                <div class="col-lg-10">
                    <div class="row">
                        <div class="col-md-4 wow fadeInUp">
                            <h1 class="text-second-color font-weight-300 text-sm-center text-lg-right margin-tb-15px">헤어 디자이너 TOP3</h1>
							<button type="button" class="btn btn-info" onclick="topDesChange('cut')">컷</button>
                            <button type="button" class="btn btn-info" onclick="topDesChange('perm')">펌</button>
                            <button type="button" class="btn btn-info" onclick="topDesChange('dye')">염색</button>
                        </div>
                        <div class="col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                            <p class="text-grey-2"></p>
                        </div>
                        <div class="col-md-2 wow fadeInUp" data-wow-delay="0.4s">
                            <a href="#" class="text-main-color margin-tb-15px d-inline-block"><span class="d-block float-left margin-right-10px margin-top-5px">모두 보기</span> <i class="far fa-arrow-alt-circle-right text-large margin-top-7px"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            
             <div class="row">

                <div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
                    <div class="background-white box-shadow wow fadeInUp" data-wow-delay="0.2s">
                        <div class="thum">
                            <a href="#" id="targetHairATag1"><img id="targetHairImage1" src="http://placehold.it/400x400" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-tb-15px"><a class="text-dark" href="#" id="targetHairName1">이름 자리</a></h5>
  		                          	<div id="targetHairHashTag1">
									</div>
                            
                            
                            
                            <div class="rating clearfix">
                                <ul class="float-left" id="targetHairStar1">
                                </ul>
                                <small class="float-right text-grey-2" id="targetHairReviewCnt1">리뷰수</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
                    <div class="background-white box-shadow wow fadeInUp" data-wow-delay="0.2s">
                        <div class="thum">
                            <a href="#" id="targetHairATag2"><img id="targetHairImage2" src="http://placehold.it/400x400" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-tb-15px"><a class="text-dark" href="#" id="targetHairName2">이름 자리</a></h5>
                            <div id="targetHairHashTag2">
                            </div>
                            <div class="rating clearfix">
                                <ul class="float-left" id="targetHairStar2">
                                </ul>
                                <small class="float-right text-grey-2" id="targetHairReviewCnt2">리뷰수</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
                    <div class="background-white box-shadow wow fadeInUp" data-wow-delay="0.2s">
                        <div class="thum">
                            <a href="#" id="targetHairATag3"><img id="targetHairImage3" src="http://placehold.it/400x400" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-tb-15px"><a class="text-dark" href="#" id="targetHairName3">이름 자리</a></h5>
                            <div id="targetHairHashTag3">
                            </div>
                            <div class="rating clearfix">
                                <ul class="float-left" id="targetHairStar3">
                                </ul>
                                <small class="float-right text-grey-2" id="targetHairReviewCnt3">리뷰수</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                

            </div>
            
            <!-- // Title -->
            
           <div class="row justify-content-center margin-bottom-45px">
                <div class="col-lg-10">
                    <div class="row">
                        <div class="col-md-4 wow fadeInUp">
                            <h1 class="text-second-color font-weight-300 text-sm-center text-lg-right margin-tb-8px">메이크업 디자이너 TOP3</h1>
                        </div>
                        <div class="col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                            <p class="text-grey-2"></p>
                        </div>
                        <div class="col-md-2 wow fadeInUp" data-wow-delay="0.4s">
                            <a href="#" class="text-main-color margin-tb-15px d-inline-block"><span class="d-block float-left margin-right-10px margin-top-5px">모두 보기</span> <i class="far fa-arrow-alt-circle-right text-large margin-top-7px"></i></a>
                        </div>
                    </div>
                </div>
            </div>

			<div class="row">

                <div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
                    <div class="background-white box-shadow wow fadeInUp" data-wow-delay="0.2s">
                        <div class="thum">
                            <a href="#" id="targetMakeUpATag1"><img id="targetMakeUpImage1" src="http://placehold.it/400x400" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-tb-15px"><a class="text-dark" href="#" id="targetMakeUpName1">이름 자리</a></h5>
                            <div id="targetMakeUpHashTag1">
                            </div>
                            <div class="rating clearfix">
                                <ul class="float-left" id="targetMakeUpStar1">
                                </ul>
                                <small class="float-right text-grey-2" id="targetMakeUpReviewCnt1">리뷰수</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
                    <div class="background-white box-shadow wow fadeInUp" data-wow-delay="0.2s">
                        <div class="thum">
                            <a href="#" id="targetMakeUpATag2"><img id="targetMakeUpImage2" src="http://placehold.it/400x400" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-tb-15px"><a class="text-dark" href="#" id="targetMakeUpName2">이름 자리</a></h5>
                            <div id="targetMakeUpHashTag2">
                            </div>
                            <div class="rating clearfix">
                                <ul class="float-left" id="targetMakeUpStar2">
                                </ul>
                                <small class="float-right text-grey-2" id="targetMakeUpReviewCnt2">리뷰수</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
                    <div class="background-white box-shadow wow fadeInUp" data-wow-delay="0.2s">
                        <div class="thum">
                            <a href="#" id="targetMakeUpATag3"><img id="targetMakeUpImage3" src="http://placehold.it/400x400" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-tb-15px"><a class="text-dark" href="#" id="targetMakeUpName3">이름 자리</a></h5>
                            <div id="targetMakeUpHashTag3">
                            </div>
                            <div class="rating clearfix">
                                <ul class="float-left" id="targetMakeUpStar3">
                                </ul>
                                <small class="float-right text-grey-2" id="targetMakeUpReviewCnt3">리뷰수</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                

            </div>
           
        </div>
    </section>



    <section class="padding-tb-100px">
        <div class="container">
            <!-- Title -->
            <div class="row justify-content-center margin-bottom-45px">
                <div class="col-lg-10">
                    <div class="row">
                        <div class="col-md-4 wow fadeInUp">
                            <h1 class="text-second-color font-weight-300 text-sm-center text-lg-right margin-tb-15px">Popular Clinic</h1>
                        </div>
                        <div class="col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                            <p class="text-grey-2">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
                        </div>
                        <div class="col-md-2 wow fadeInUp" data-wow-delay="0.4s">
                            <a href="#" class="text-main-color margin-tb-15px d-inline-block"><span class="d-block float-left margin-right-10px margin-top-5px">Show All</span> <i class="far fa-arrow-alt-circle-right text-large margin-top-7px"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // Title -->


			<!-- <div class="row">
                <div class="col-lg-4 col-md-6 sm-mb-45px">
                    <div class="background-white full-width thum-hover box-shadow hvr-float wow fadeInUp" data-wow-delay="0.2s">
                        <div class="item-thumbnail thum background-white">
                            <a href="#"><img src="http://placehold.it/450x245" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-bottom-20px"><a class="text-dark" href="#">Alrayan Eye Clinic</a></h5>
                            <div class="rating clearfix">
                                <span class="float-left text-grey-2"><i class="far fa-map"></i>  California</span>
                                <ul class="float-right">
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li></li>
                                </ul>
                            </div>
                        </div>
                        <div class="padding-lr-30px padding-tb-15px background-light-grey">
                            <div class="row no-gutters">
                                <div class="col-4"><a href="#" class="text-lime"><i class="far fa-bookmark"></i> Open Now!</a></div>
                                <div class="col-4 text-center"><a href="#" class="text-red"><i class="far fa-heart"></i> Save</a></div>
                                <div class="col-4 text-right"><a href="#" class="text-blue"><i class="far fa-hospital"></i> Hospital</a></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div> -->

        </div>
    </section>


    <section class="padding-tb-100px background-grey-1">
        <div class="container">
            <!-- Title -->
            <div class="row justify-content-center margin-bottom-45px">
                <div class="col-lg-10">
                    <div class="row">
                        <div class="col-md-3 wow fadeInUp">
                            <h1 class="text-second-color font-weight-300 text-sm-center text-lg-right margin-tb-15px">Our Blog</h1>
                        </div>
                        <div class="col-md-7 wow fadeInUp" data-wow-delay="0.2s">
                            <p class="text-grey-2">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
                        </div>
                        <div class="col-md-2 wow fadeInUp" data-wow-delay="0.4s">
                            <a href="#" class="text-main-color margin-tb-15px d-inline-block"><span class="d-block float-left margin-right-10px margin-top-5px">Show All</span> <i class="far fa-arrow-alt-circle-right text-large margin-top-7px"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // Title -->

            <div class="row">
                <div class="col-lg-6 sm-mb-45px">
                    <div class="background-white thum-hover box-shadow hvr-float full-width wow fadeInUp">
                        <div class="float-md-left margin-right-30px thum-xs">
                            <img src="assets/img/http://placehold.it/200x200" alt="">
                        </div>
                        <div class="padding-25px">
                            <i class="far fa-folder-open text-main-color"></i>
                            <a href="#" class="text-main-color">News </a> ,
                            <a href="#" class="text-main-color">Articles </a>
                            <h3><a href="#" class="d-block text-dark text-capitalize text-medium margin-tb-15px">Long Don’t Spend Time Beating On a Wall, Hoping To Trans ... </a></h3>
                            <span class="margin-right-20px text-extra-small"><i class="far fa-user text-grey-2"></i> By : <a href="#"> Rabie Elkheir</a></span>
                            <span class="text-extra-small d-block d-sm-none"><i class="far fa-clock text-grey-2"></i> Date :  <a href="#"> July 15, 2016</a></span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-lg-6 sm-mb-45px">
                    <div class="background-white thum-hover box-shadow hvr-float full-width wow fadeInUp">
                        <div class="float-md-left margin-right-30px thum-xs">
                            <img src="http://placehold.it/200x200" alt="">
                        </div>
                        <div class="padding-25px">
                            <i class="far fa-folder-open text-main-color"></i>
                            <a href="#" class="text-main-color">News </a> ,
                            <a href="#" class="text-main-color">Articles </a>
                            <h3><a href="#" class="d-block text-dark text-capitalize text-medium margin-tb-15px">Long Don’t Spend Time Beating On a Wall, Hoping To Trans ... </a></h3>
                            <span class="margin-right-20px text-extra-small"><i class="far fa-user text-grey-2"></i> By : <a href="#"> Rabie Elkheir</a></span>
                            <span class="text-extra-small d-block d-sm-none"><i class="far fa-clock text-grey-2"></i> Date :  <a href="#"> July 15, 2016</a></span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    
</body>
</html>
