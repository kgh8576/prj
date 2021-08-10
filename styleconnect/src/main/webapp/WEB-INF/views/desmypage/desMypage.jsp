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
                    <span class="nav-title-text">Main</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                    <a class="nav-link" href="dashboard-home.html">
                        <i class="fas fa-fw fa-home"></i><span class="nav-link-text">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My items">
                    <a class="nav-link" href="dashboard-my-listings.html">
                <i class="fa fa-fw fa-table"></i>
                <span class="nav-link-text">My Listings</span>
              </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My Favorites">
                    <a class="nav-link" href="dashboard-my-favorites.html">
                <i class="fa fa-fw fa-heart"></i>
                <span class="nav-link-text">My Favorites</span>
              </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
                    <a class="nav-link" href="dashboard-reviews.html">
                <i class="fa fa-fw fa-star"></i>
                <span class="nav-link-text">Reviews</span>
              </a>
                </li>
                <li class="nav-item">
                    <span class="nav-title-text">Example Pages</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookings">
                    <a class="nav-link active" href="dashboard-bookings.html">
                        <i class="far fa-fw fa-bookmark"></i>
                        <span class="nav-link-text">Bookings</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Listing">
                    <a class="nav-link" href="dashboard-add-listing.html">
                        <i class="fa fa-fw fa-plus-circle"></i>
                        <span class="nav-link-text">Add Listing</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Packages">
                    <a class="nav-link" href="dashboard-packages.html">
                        <i class="far fa-fw fa-list-alt"></i>
                        <span class="nav-link-text">Packages</span>
                    </a>
                </li>

                <li class="nav-item">
                    <span class="nav-title-text">User Area</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My Profile">
                    <a class="nav-link" href="dashboard-my-profile.html">
                        <i class="fa fa-fw fa-user-circle"></i>
                        <span class="nav-link-text">My Profile</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Sing Out">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal">
                        <i class="fa fa-fw fa-sign-out-alt"></i>
                        <span class="nav-link-text">Sing Out</span>
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
                            <a href="desSchedule.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-2.png" alt="">
                                    </div>
                                    상담내역관리
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.4s">
                            <a href="desStyle.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-3.png" alt="">
                                    </div>
                                    스타일링 관리
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
                                    상담목록
                                </div>
                            </a>
                        </div>
                         <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.6s">
                            <a href="" class="d-block border-radius-15 hvr-float hvr-sh2">
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