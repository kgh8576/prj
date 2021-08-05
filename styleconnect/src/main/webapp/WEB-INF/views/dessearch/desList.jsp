<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<body>
	<div id="page-title" class="padding-tb-30px gradient-white">
		<div class="container">
			<ol class="breadcrumb opacity-5">
				<li><a href="#">Home</a></li>
				<li><a href="#">Pages</a></li>
				<li class="active">Doctors List</li>
			</ol>
			<h1 class="font-weight-300">Designer List</h1>
		</div>
	</div>
	
	<div class="margin-tb-30px">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
						<!-- Doctor -->
						<c:forEach items="${designer}" var="vo">
							<div class="col-lg-4 col-md-6 hvr-bob margin-bottom-45px">
								<div class="background-white box-shadow">
									<div class="thum">
										<a href="desListSelect.do?id=${vo.id}">
										<c:if test="${vo.fileUuid == 0 }">
										<img src="resources/img/이미지 등록.png" alt="">
										</c:if>
										<c:if test="${vo.fileUuid != 0 }">
										<img src="resources/img/${vo.fileUuid }" alt="">
										</c:if></a>
									</div>
									<div class="padding-30px">
									<div>
										<c:set var="majors" value="${fn:split(vo.major,',')}"></c:set>
											<c:forEach var="major" items="${majors}">
											    <a href="searchList.do?search=${major }"> <span class="text-grey-2"># ${major} </span> </a>
											</c:forEach>
									</div>
										<h5 class="margin-tb-15px">
											<a class="text-dark" href="desListSelect.do?id=${vo.id }">${vo.name }
												디자이너</a>
										</h5>
										<div class="rating clearfix">
											<ul class="float-left">
										<c:if test="${vo.rate != 0 }">
										<c:forEach begin="1" end="${vo.rate }">
												<li class="active"></li>
										</c:forEach>  평점 ${vo.rate }
										</c:if>
										<c:if test="${vo.rate == 0 }">
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
	<ul class="pagination pagination-md ">
		<li class="page-item disabled"><a class="page-link rounded-0"
			href="#" tabindex="-1">Previous</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link rounded-0" href="#">Next</a></li>
	</ul>
	<!-- 페이징처리 -->
								
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
