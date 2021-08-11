<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너마이페이지 - 스케쥴 관리</title>
<script>
function denyfun(conNo){
	if(confirm("예약거절하시겠습니까?") == true){
		location.href="desDeny.do?conNo="+conNo
	}else{
		confirm("ㅇㅇ") 
		return;
	}
}

</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark z-index-9  fixed-top" id="mainNav">
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav navbar-sidenav background-main-color admin-nav" id="admin-nav">
                <li class="nav-item">
                    <span class="nav-title-text">디자이너 기본정보</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                    <a href="desInfo.do" class="nav-link " href="dashboard-home.html">
                        <i class="fa fa-fw fa-user-circle"></i><span class="nav-link-text">내정보관리</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My items">
                    <a href="desMajor.do" class="nav-link " href="dashboard-my-listings.html">
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
                    <a href="desSchedule.do" class="nav-link active" href="dashboard-add-listing.html">
                        <i class="fa fa-fw fa-plus-circle"></i>
                        <span class="nav-link-text">예약관리</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
<div class="content-wrapper">
        <div class="container-fluid overflow-hidden">
            <div class="row margin-tb-90px margin-lr-10px sm-mrl-0px">
                <!-- Page Title -->
                <div id="page-title" class="padding-30px background-white full-width">
                    <div class="container">
                        <ol class="breadcrumb opacity-5">
                         
                        </ol>
                        <h1 class="font-weight-300">예약내역</h1>
                    </div>
                </div>
                <!-- // Page Title -->
                <div class="row margin-top-45px">
                 <c:forEach items="${sche }" var="vo">
                    <!-- Booking item -->
                    <div class="col-lg-6 margin-bottom-45px full-width">
                        <div class="background-white thum-hover box-shadow  hvr-float">
                            <div class="padding-30px full-width">
                                <img src="http://placehold.it/60x60" class="float-left margin-right-20px border-radius-60 margin-bottom-20px" alt="">
                                <div class="margin-left-85px">
                                	<a class="d-block text-dark text-medium margin-bottom-5px" href="#">No. ${vo.conNo }  </a>
                                    <a class="d-block text-dark text-medium margin-bottom-5px" href="#">상담명: ${vo.title }  </a>
                                    <div class="d-block padding-tb-5px">예약날짜 :  <a href="#" class="text-main-color">${vo.day } </a></div>
                                    <div class="d-block padding-tb-5px">예약시간 :  <a href="#" class="text-main-color">${vo.time }</a></div>
                                    <div class="d-block padding-tb-5px">예약자  :  <a href="#" class="text-main-color">${vo.memName}</a></div>
                                     <div class="d-block padding-tb-5px">예약상태  :  <a href="#" class="text-main-color">${vo.codecontent}</a></div>
                                    <p class="margin-top-15px text-grey-2"><a><예약자 코멘트></a> ${vo.memComment }</p>
                                    <!-- 예약중상태 -->
                                    <c:if test="${vo.state eq 'ccode001'}">
                                    	<a href="desApprove.do?conNo=${vo.conNo }" class="d-inline-block text-grey-2 text-up-small"><i class="far fa-file-alt"></i> 예약승인</a>
                                   		<a onclick="denyfun('${vo.conNo}')" class="d-inline-block margin-lr-20px text-grey-2 text-up-small"><i class="far fa-window-close"></i> 예약거부</a>
                                	</c:if>
                                	<!-- 예약확정상태 -->
                                	<c:if test="${vo.state eq 'ccode002'}">
                                    	${vo.codecontent }상태입니다.
                                	</c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- // Booking item -->
					  </c:forEach>

                </div>
            </div>
        </div>
        <!-- /.container-fluid-->
        <!-- /.content-wrapper-->
    </div>
</body>
</html>