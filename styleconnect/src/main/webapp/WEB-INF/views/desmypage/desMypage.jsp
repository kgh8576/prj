<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 마이페이지</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark z-index-9  fixed-top" id="mainNav">
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav navbar-sidenav background-main-color admin-nav" id="admin-nav">
                <li class="nav-item">
                    <span class="nav-title-text">디자이너 기본정보</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                    <a href="desInfo.do" class="nav-link" href="dashboard-home.html">
                        <i class="fa fa-fw fa-user-circle"></i><span class="nav-link-text">내정보관리</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My items">
                    <a href="desMajor.do" class="nav-link" href="dashboard-my-listings.html">
                <i class="fa fa-fw fa-table"></i>
                <span class="nav-link-text">전문분야설정</span>
              </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My Favorites">
                    <a href="desStyle.do" class="nav-link" href="dashboard-my-favorites.html">
                <i class="fa fa-fw fa-table"></i>
                <span class="nav-link-text">스타일링사진 관리</span>
              </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
                    <a class="nav-link" href="desWorkOpen.do?id=${my.id }l">
                <i class="fa fa-fw fa-star"></i>
                <span class="nav-link-text">스케쥴관리</span>
              </a>
                </li>
                <li class="nav-item">
                    <span class="nav-title-text">상담관련</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookings">
                    <a href="desCourse.do?id=${my.id }" class="nav-link" href="dashboard-bookings.html">
                        <i class="far fa-fw fa-bookmark"></i>
                        <span class="nav-link-text">내상담관리</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Listing">
                	<!-- 구자혁이 수정한거임~~~~~~~~~~~~~~~~~~~~ -->
                    <a href="desSchedule.do" class="nav-link" href="dashboard-add-listing.html">
                    <!-- ~~~~~~~~~~~~~~~~~~~~여기까지 수정한거임 -->
                        <i class="fa fa-fw fa-plus-circle"></i>
                        <span class="nav-link-text">예약관리</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Listing">
                    <a href="desexitpage.do" class="nav-link" href="dashboard-add-listing.html">
                        <i class="fa fa-fw fa-plus-circle"></i>
                        <span class="nav-link-text">회원탈퇴하기</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
<div align="center">
${my.id }
</div>
<input type="hidden" id="did" name="did" value="${did }">
<div class="row justify-content-center">
	              <div class="col-lg-7">
                    <div class="row">
                        <div class="col-md-3 col-6 sm-mb-30px wow fadeInUp">
                            <a href="desInfo.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-1.png" alt="">
                                    </div>
                                    내정보관리
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 sm-mb-30px wow fadeInUp" data-wow-delay="0.2s">
                            <a href="desSchedule.do?state=ccode001" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-2.png" alt="">
                                    </div>
                                    예약관리
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.4s">
                            <a href="desStyle.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-3.png" alt="">
                                    </div>
                                    스타일링사진 관리
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.6s">
                            <a href="desMajor.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-4.png" alt="">
                                    </div>
                                    전문분야 설정
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.6s">
                            <a href="desCourse.do?id=${my.id }" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-4.png" alt="">
                                    </div>
                                    내상담관리
                                </div>
                            </a>
                        </div>
                         <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.6s">
                            <a href="desWorkOpen.do?id=${my.id }" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-4.png" alt="">
                                    </div>
                                    스케쥴관리
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>