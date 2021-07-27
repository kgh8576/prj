<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>디자이너 카테고리</title>
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
<link rel="stylesheet" href="assets/css/animate.css" />
<!-- owl Carousel assets -->
<link href="assets/css/owl.carousel.css" rel="stylesheet">
<link href="assets/css/owl.theme.css" rel="stylesheet">
<!-- bootstrap -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!-- hover anmation -->
<link rel="stylesheet" href="assets/css/hover-min.css">
<!-- flag icon -->
<link rel="stylesheet" href="assets/css/flag-icon.min.css">
<!-- main style -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- colors -->
<link rel="stylesheet" href="assets/css/colors/main.css">
<!-- elegant icon -->
<link rel="stylesheet" href="assets/css/elegant_icon.css">

<!-- jquery library  -->
<script src="assets/js/jquery-3.2.1.min.js"></script>

<!-- Maps library  -->
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src="assets/js/jquery.gomap-1.3.3.min.js"></script>

<!-- fontawesome  -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>


</head>

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
									<a href="desListSelect.do?id=${vo.id}"><img src="http://placehold.it/400x400" alt=""></a>
								</div>
							<div class="padding-30px">
									<span class="text-grey-2">${vo.major } 전문</span>
									<h5 class="margin-tb-15px">
										<a class="text-dark" href="desListSelect.do">${vo.name } 디자이너</a>
									</h5>
									<div class="rating clearfix">
										<ul class="float-left">
											<li class="active"></li>
											<li class="active"></li>
											<li class="active"></li>
											<li class="active"></li>
											<li></li>
										</ul>
									</div>
					</div>
				</div>
			</div>
			</c:forEach>
			<!-- // Doctor -->
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
