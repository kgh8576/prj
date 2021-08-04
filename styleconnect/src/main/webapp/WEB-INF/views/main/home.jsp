<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Tabib HTML5 Health Directory Template</title>
    <style>
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
                <div class="col-lg-8">
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
                        </form>
                    </div>
                </div>
            </div>
            <!-- 검색창 끝 -->
            <div class="row justify-content-center">
                
                <!-- 디자이너 추천 영역 -->
				<c:if test="${empty memDetail }">
	               	<!-- modal Btn -->
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#preferenceFrmModal">
					  더 나은 서비스 제공을 위해서 시간을 내주세요!
					</button>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        ...
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Save changes</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					
					
				</c:if>
				<c:if test="${not empty memDetail }">
					<div>다른 회원들이 많이 찾은 디자이너입니다</div>
					<div>평가가 좋은 디자이너입니다</div>
				</c:if>
				

                
            </div>
        </div>
    </section>


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
