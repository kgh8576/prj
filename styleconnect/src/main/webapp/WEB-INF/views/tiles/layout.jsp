<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="author" content="Nile-Theme">
<meta name="robots" content="index follow">
<meta name="googlebot" content="index follow">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="keywords"
	content="directory, doctor, doctor directory, Health directory, listing, map, medical, medical directory, professional directory, reservation, reviews">
<meta name="description"
	content="Health Care & Medical Services Directory">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- google fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800%7CPoppins:300i,300,400,700,400i,500%7CDancing+Script:700%7CDancing+Script:700"
	rel="stylesheet">
<!-- animate -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/animate.css" />
<!-- owl Carousel assets -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/owl.theme.css"
	rel="stylesheet">
<!-- bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<!-- hover anmation -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/hover-min.css">
<!-- flag icon -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/flag-icon.min.css">
<!-- main style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<!-- colors -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/colors/main.css">
<!-- elegant icon -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/elegant_icon.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/sb-admin.css">
<!-- jquery library  -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.2.1.min.js"></script>
<!-- fontawesome  -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<style type="text/css">
footer{
	margin-top : 50px;
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
	padding: 15px 0;
}
</style>
</head>

<body>
	<div class="container-fluid">
		<nav>
			<tiles:insertAttribute name="header" />
		</nav>
		<br>
		<br>
		<br>
		<article>
			<tiles:insertAttribute name="body" />
		</article>
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
	
	
	
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/sticky-sidebar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/YouTubePopUp.jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/imagesloaded.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
</body>
</html>