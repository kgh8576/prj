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
    	function topHairDesChange(keyword){
    		// 헤어디자이너 top3 이름, 평점, 이미지 경로 가져오는 ajax
        	$.ajax({
        		url:'ajaxTopHairDesChange.do',
        		data:{ keyword:keyword },
        		success:function(result){
        			console.log(result);
        			for(var i = 0; i < result.length; i++){
        				$('#targetHairName'+(i+1)).text(result[i].name);
        				$('#targetHairStar'+(i+1)).html(''); // 별 칸 다 지우고 ajax로 평점만큼 별 채워넣기
        				for(var j = 0; j < result[i].rate; j++){
        					console.log(result[i].rate);
        					$('#targetHairStar'+(i+1)).append('<li class="active"></li>');	
        				}
        				//$('#targetHairImage'+(i+1)).html(''); // 이미지 칸 지우고 ajax로 경로 채워넣기
        				//$('#targetHairImage'+(i+1)).append('<a href="reviewList.do?name="'+result[i].name+'><img src="'+result[i].filePath+'" alt=""></a>');
        				$('#targetHairImage'+(i+1)).append('<a href="reviewList.do?name="'+result[i].name+'</a>');
        			}
        		},
        		error:function(err){
        			console.log(err);
        		}
        	});
        	// 총 리뷰 수 가져오는 ajax
        	$.ajax({
        		url:'ajaxTopHairDesCount.do',
        		data:{ keyword:keyword },
        		success:function(ratingResult){
        			for(var i = 0; i < ratingResult.length; i++){
        				$('#targetHairRating'+(i+1)).text('총 리뷰 수 '+ratingResult[i].count+'건');
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
            
            <div class="row justify-content-center margin-tb-60px">
                <div class="col-lg-8">
                    <div class="listing-search">
                        <form class="row no-gutters">
                            <div class="col-md-3">
                                <div class="keywords">
                                    <input class="listing-form first" type="text" placeholder="검색할 키워드를 입력하세요" value="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <a class="listing-bottom background-second-color box-shadow" href="#">Search Now</a> <br>
								<div>
									<a href="#" class="text-primary">#호일펌</a>
									<a href="#" class="text-primary">#구자혁</a>
									<a href="#" class="text-primary">#병지컷</a>
									<a href="reviewList.do?desId=des04">테스트테스트</a>
								</div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="row">
                        <div class="col-md-3 col-6 sm-mb-30px wow fadeInUp">
                            <a href="#" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-1.png" alt="">
                                    </div>
                                    Doctors
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 sm-mb-30px wow fadeInUp" data-wow-delay="0.2s">
                            <a href="#" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-2.png" alt="">
                                    </div>
                                    Clinics
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.4s">
                            <a href="#" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-3.png" alt="">
                                    </div>
                                    Labs
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.6s">
                            <a href="#" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-4.png" alt="">
                                    </div>
                                    Pharmacies
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
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
							<button type="button" class="btn btn-info" onclick="topHairDesChange('cut')">컷</button>
                            <button type="button" class="btn btn-info" onclick="topHairDesChange('perm')">펌</button>
                            <button type="button" class="btn btn-info" onclick="topHairDesChange('dye')">염색</button>
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
                        <div class="thum" id="targetHairImage1">
                            <a href="#"><img src="http://placehold.it/400x400" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-tb-15px"><a class="text-dark" href="#" id="targetHairName1">이름 자리</a></h5>
                            <div class="rating clearfix">
                                <ul class="float-left" id="targetHairStar1">
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li></li>
                                </ul>
                                <small class="float-right text-grey-2" id="targetHairRating1">레이팅</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
                    <div class="background-white box-shadow wow fadeInUp" data-wow-delay="0.2s">
                        <div class="thum" id="targetHairImage2">
                            <a href="#"><img src="http://placehold.it/400x400" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-tb-15px"><a class="text-dark" href="#" id="targetHairName2">이름 자리</a></h5>
                            <div class="rating clearfix">
                                <ul class="float-left" id="targetHairStar2">
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li></li>
                                </ul>
                                <small class="float-right text-grey-2" id="targetHairRating2">리뷰수, 레이팅 자리</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
                    <div class="background-white box-shadow wow fadeInUp" data-wow-delay="0.2s">
                        <div class="thum" id="targetHairImage3">
                            <a href="#"><img src="http://placehold.it/400x400" alt=""></a>
                        </div>
                        <div class="padding-30px">
                            <h5 class="margin-tb-15px"><a class="text-dark" href="#" id="targetHairName3">이름 자리</a></h5>
                            <div class="rating clearfix">
                                <ul class="float-left" id="targetHairStar3">
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li></li>
                                    
                                </ul>
                                <small class="float-right text-grey-2" id="targetHairRating3">리뷰수, 레이팅 자리</small>
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
                            <button type="button" class="btn btn-info">cate1</button>
                            <button type="button" class="btn btn-info">cate2</button>
                            <button type="button" class="btn btn-info">cate3</button>
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


    <footer class="padding-tb-100px background-main-color wow fadeInUp">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <a class="d-inline-block margin-tb-15px"><img src="assets/img/logo-2.png" alt=""></a>
                </div>
                <div class="col-lg-4">
                    <p class="text-white opacity-7">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
                </div>
                <div class="col-lg-6">
                    <ul class="footer-menu margin-tb-15px margin-lr-0px padding-0px list-unstyled float-lg-right">
                        <li><a href="#" class="text-white">Featured</a></li>
                        <li><a href="#" class="text-white">Feedback</a></li>
                        <li><a href="#" class="text-white">Ask a Question</a></li>
                        <li><a href="#" class="text-white">Team</a></li>
                    </ul>
                </div>
            </div>
            <hr class="border-white opacity-4 margin-tb-45px">
            <div class="row">
                <div class="col-lg-6">
                    <p class="margin-0px text-white opacity-7 sm-mb-15px">© 2018 tabib Health Directory | All Right Reserved. </p>
                </div>
                <div class="col-lg-6">
                    <ul class="social-icon style-2 float-lg-right">
                        <li class="list-inline-item"><a class="facebook" href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li class="list-inline-item"><a class="youtube" href="#"><i class="fab fa-youtube"></i></a></li>
                        <li class="list-inline-item"><a class="linkedin" href="#"><i class="fab fa-linkedin"></i></a></li>
                        <li class="list-inline-item"><a class="google" href="#"><i class="fab fa-google-plus"></i></a></li>
                        <li class="list-inline-item"><a class="twitter" href="#"><i class="fab fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a class="rss" href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
