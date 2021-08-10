<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너마이페이지 - 스케쥴 관리</title>
<body>
<div class="content-wrapper">
        <div class="container-fluid overflow-hidden">
            <div class="row margin-tb-90px margin-lr-10px sm-mrl-0px">
                <!-- Page Title -->
                <div id="page-title" class="padding-30px background-white full-width">
                    <div class="container">
                        <ol class="breadcrumb opacity-5">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">Bookings</li>
                        </ol>
                        <h1 class="font-weight-300">예약내역</h1>
                    </div>
                </div>
                <!-- // Page Title -->
                <div class="row margin-top-45px">
                    <!-- Booking item -->
                            <!-- 예약내역 -->
                           <c:forEach items="${sche }" var="vo">
                    <div class="col-lg-6 margin-bottom-45px full-width">
                        <div class="background-white thum-hover box-shadow  hvr-float">
                            
                            <div class="padding-30px full-width">
                                <img src="http://placehold.it/60x60" class="float-left margin-right-20px border-radius-60 margin-bottom-20px" alt="">
                                <div class="margin-left-85px">
                                    <a class="d-block text-dark text-medium margin-bottom-5px" href="#">${vo.title } </a>
                                    <div class="d-block padding-tb-5px">예약날짜 :  <a href="#" class="text-main-color">${vo.day } </a></div>
                                    <div class="d-block padding-tb-5px">예약시간 :  <a href="#" class="text-main-color"> ${vo.time }</a></div>
                                    <div class="d-block padding-tb-5px">신청날짜 :  <a href="#" class="text-main-color"> ${vo.laststDate }</a></div>
                                    <div class="d-block padding-tb-5px">예약자  :  <a href="#" class="text-main-color"></a></div>
                                    <p class="margin-top-15px text-grey-2"> <a><예약자 코멘트></a> ${vo.memComment } </p>
                                    <a href="#" class="d-inline-block text-grey-2 text-up-small"><i class="far fa-file-alt"></i> 예약승인 </a>
                                    <a href="#" class="d-inline-block margin-lr-20px text-grey-2 text-up-small"><i class="far fa-window-close"></i> 예약거부 </a>
                                </div>
                            </div>
                        </div>
                    </div>
                           </c:forEach>
                    <!-- // Booking item -->
                </div>
            </div>
        </div>
        <!-- /.container-fluid-->
        <!-- /.content-wrapper-->
      
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
          <i class="fa fa-angle-up"></i>
        </a>
    </div>
</body>
</html>