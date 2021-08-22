<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.background-white{
			height: 100%;
}

span:hover{
	color:white;
   background-color: #8279d8;;
}
#imgsize {
    width: 200px;
    height: 200px;
}
</style>

</head>
<body>
	<br><br>
	<!--  
	<div id="page-title" class="padding-tb-30px gradient-white">
		<div class="container">
			<h1 class="font-weight-300">Designer List</h1>
		</div>
	</div>
	-->
	<!-- 검색창 -->
<form id="frm" action="searchList.do" method="post">
	<div class="margin-bottom-30px">
    	<div class="padding-30px background-white border-radius-10">
        	<h4><i class="fas fa-search margin-right-10px text-main-color"></i> Search</h4>
			<hr>
			<div class="input-group mb-3">
				<input type="text" name="search" placeholder="키워드를 입력하세요" class="form-control border-radius-0">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary text-white background-main-color border-radius-0" type="submit">Search</button>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- 검색창 끝 -->
	<div class="margin-tb-30px">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
					<c:if test="${empty designer }">
					<div align="center">
					<h2>등록된 디자이너가 없습니다.</h2>
					</div>
					</c:if>
						<!-- Designer -->
								<c:forEach items="${designer}" var="vo">
								<input type="hidden" id="id" name="id" value="${vo.id }">
								<input type="hidden" id="career" name="career" value="${vo.career }">
							<div class="col-lg-4 col-md-6 hvr-bob margin-bottom-45px">
								<div class="background-white box-shadow">
								 <!-- 디자이너 프로필 이미지 -->
									<div class="thum">
										<a href="desListSelect.do?id=${vo.id}">
											<img id="imgsize" src="resources/img/${vo.fileUuid }" alt="">
										</a>
									</div>
								<!-- 디자이너 프로필 이미지 -->
									<div class="padding-30px">
									<div>
										<c:set var="majors" value="${fn:split(vo.major,',')}"></c:set>
											<c:forEach var="major" items="${majors}">
											    <a href="searchList.do?search=${major }"> <span># ${major} </span> </a>
											</c:forEach>
									</div>
										<h5 class="margin-tb-15px">
											<a class="text-dark" href="desListSelect.do?id=${vo.id }">${vo.name }디자이너</a>
										</h5>
										<div class="rating clearfix">
											<ul class="float-left">
										 <c:if test="${vo.rate != 0 }">
										<c:forEach begin="1" end="${vo.rate }">
												<li class="active"></li>
										</c:forEach>  
										</c:if>
										<c:if test="${vo.rate == 0}">
											등록된 후기가 없습니다. 
										</c:if> 
											</ul>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/sticky-sidebar.js"></script>
	<script src="assets/js/YouTubePopUp.jquery.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/imagesloaded.min.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>

</html>
