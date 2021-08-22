<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 상담목록 리스트 (blog-grid.html)</title>
</head>
<style>
.nocourse{
	align: center;
	margin: 100px;
}
#cbtn{
	    margin-left: 35%;
	    margin-top: 40px;
}
#courseline{
padding: 15px;
box-sizing: border-box;
border: 1px solid #fff;
box-shadow: 0px 6px 15px 0px rgb(0 0 0 / 10%);
transition: 0.6s;
}
#courseline:hover{
transform: translateY(-5px);}
.mtitle {
	font-size: 30px;
	text-decoration: underline;
	margin-left: 50px;
	margin-top: 50px;
}
.col-lg-7{position: relative;}
.meta a{
position: absolute;
right: 0;
bottom: 0;}
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-dark z-index-9  fixed-top"
			id="mainNav">
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul	class="navbar-nav navbar-sidenav background-main-color admin-nav" id="admin-nav" style="margin-top:0px">
					<li class="nav-item"><span class="nav-title-text">디자이너	기본정보</span></li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
						<a href="desInfo.do" class="nav-link" href="dashboard-home.html">
							<i class="fa fa-fw fa-user-circle"></i>
							<span class="nav-link-text">내정보관리</span>
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
							<i class="fa fa-fw fa-image"></i>
							<span class="nav-link-text">스타일링사진 관리</span>
						</a>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
						<a class="nav-link" href="desWorkOpen.do?id=${my.id }">
							<i class="fa fa-fw fa-table"></i>
							<span class="nav-link-text">스케쥴관리</span>
						</a>
					</li>
					<li class="nav-item">
						<span class="nav-title-text">상담관련</span>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookings">
						<a href="desCourse.do" class="nav-link active"	href="dashboard-bookings.html">
							<i class="fa fa-fw fa-plus-circle"></i>
							<span class="nav-link-text">내상담관리</span>
						</a>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Listing">
						<a href="desSchedule.do" class="nav-link" href="dashboard-add-listing.html">
							<i class="fa fa-fw fa-bookmark"></i>
								<span class="nav-link-text">예약관리</span>
						</a>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Listing">
						<a href="reviewList.do?desId=${did}" class="nav-link" href="dashboard-add-listing.html">
							<i class="fa fa-fw fa-star"></i>
								<span class="nav-link-text">리뷰관리</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
<div class="content-wrapper">
  <div class="container-fluid overflow-hidden margin-bottom-50px">
	<h1 class="mtitle"> &nbsp;&nbsp;&nbsp; Consulting List</h1>
		</div>
    <div class="margin-tb-30px">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
             <!-- 상담목록 없을경우 -->
             <c:if test="${empty course }">
             <div class="nocourse">
             <h3>상담목록이 없습니다.</h3>
             <button onclick="location.href='desCourseRegister.do'" class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block"> 상담 생성하기 </button>
             </div>
             </c:if>
             <!-- 상담목록 없을경우 //-->
			<!-- 상담목록있을경우(조회,수정,삭제) -->
			<c:if test="${not empty course }">
				<c:if test="${fn:length(course) >= 5}"> 
					<div align="center">
					<h2>상담생성불가</h2><br/><h5>최대5개 생성가능</h5><hr/>
					</div>
				</c:if>
				<c:forEach items="${course}" var="vo">
                    <div class="blog-entry background-white margin-bottom-35px">
                        <div class="row no-gutters" id="courseline" >
                            <div class="img-in col-lg-5">
                            <a href="#"><img src="resources/img/${vo.fileUuid }" alt=""></a>
                            </div>
                            <div class="col-lg-7">
                                <div class="padding-10px padding-bottom-0px">
                                    <a class="d-block h4  text-capitalize margin-bottom-8px" href="#">${vo.title} </a>
                                    <div class="meta">
                                    <div align="right">
                                    ${vo.price }원
                                    </div>                        			
                        			 <hr>
                                        <span> ${vo.detail } </span>
                                        <div align="right" class="margin-top-20px">
                                        <a href="desCourseUpdate.do?courNo=${vo.courNo }" >>수정하기</a>
                                        <input type="hidden" id="courNo" name="courNo" value="${vo.courNo }">
                                    	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
				</c:forEach>
				
				<c:if test="${fn:length(course) < 5}">
					<button id='cbtn'  onclick="location.href='desCourseRegister.do'" class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block"> 상담 추가생성하기 </button><br/><br/><br/><br/><br/><br/>
				</c:if>
			</c:if>
         <!-- 상담목록 끝 //-->
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>