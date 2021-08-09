<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>StyleConnect에 방문해주셔서 감사합니다.</title>
</head>

<body>
    <header>
        <div id="fixed-header-dark" class="header-output fixed-header">
            <div class="container header-in">
                <div class="row">
                    <div class="col-lg-2 col-md-12">
                    	<a href="main.do">
	                    	<img alt="" src="${pageContext.request.contextPath}/resources/img/logo.jpg">
                    	</a>
                    </div>
                    <div class="col-lg-7 col-md-12 position-inherit">
                        <ul id="menu-main" class="nav-menu float-lg-right link-padding-tb-20px">
                        	<li><a href="consulting.do">상담하기</a></li>
                        	<li><a href="category.do">디자이너 찾기</a></li>
                        	<li><a href="#">설문조사</a></li>           	
                        	<!-- 
                            <li class="has-dropdown"><a href="#">Listings</a>
                                <ul class="sub-menu">
                                    <li><a href="map-grid-layout.html">Map - Grid Layout </a></li>
                                    <li><a href="map-list-layout.html">Map - List Layout</a></li>
                                    <li><a href="doctor-layout-1.html">Doctor - Layout (1)</a></li>
                                    <li><a href="doctor-layout-2.html">Doctor - Layout (2)</a></li>
                                    <li><a href="single-listings.html">Single Listings</a></li>
                                </ul>
                            </li>
                             -->
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-12">
                        <hr class="margin-bottom-0px d-block d-sm-none">
                        	<c:if test="${empty id && empty did }">
                        	<a href="loginpage.do" class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right"><i class="far fa-user"></i>로그인</a>
                       		<a href="Insertchoice.do" class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right"><i class="far fa-user"></i>회원가입</a>
                        	</c:if>
                   	 <hr class="margin-bottom-0px d-block d-sm-none">
                    	<c:if test="${not empty id }">
                    		<a href="membermypage.do">마이페이지</a>
							<a href="logout.do">로그아웃</a>
                        </c:if> 
                        <!-- 디자이너 마이페이지 -->
                         <hr class="margin-bottom-0px d-block d-sm-none">
                        <c:if test="${not empty did }">
							<input type="hidden" id="did" name="did" value="${did }">
							<a href="mypage.do">마이페이지</a>
							<a href="logout.do">로그아웃</a>
                        </c:if>
                        <!-- 디자이너 마이페이지 -->
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- // Header  -->

</body>

</html>
