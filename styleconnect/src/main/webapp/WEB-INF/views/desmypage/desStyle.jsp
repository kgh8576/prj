<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너마이페이지 - 스타일링 이력</title>
<script>
function delfunc(fileUuid){
	if(confirm("이미지를 삭제하시겠습니까?") == true){
		location.href="desStyleDel.do?fileUuid="+fileUuid
	}else{
		confirm("취소하였습니다.") 
		return;
	}
}

</script>
<!-- BASE CSS -->
<link
	href="${pageContext.request.contextPath}/resources/reservationreso/css/bootstrap_customized.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/reservationreso/css/style.css"
	rel="stylesheet">

<!-- SPECIFIC CSS -->
<link
	href="${pageContext.request.contextPath}/resources/reservationreso/css/detail-page.css"
	rel="stylesheet">

<!-- YOUR CUSTOM CSS -->
<link
	href="${pageContext.request.contextPath}/resources/reservationreso/css/custom.css"
	rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
#btnmargin{
	margin: 80px;
}
</style>
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
                    <a href="desMajor.do" class="nav-link" href="dashboard-my-listings.html">
                <i class="fa fa-fw fa-table"></i>
                <span class="nav-link-text">전문분야설정</span>
              </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My Favorites">
                    <a href="desStyle.do" class="nav-link active" href="dashboard-my-favorites.html">
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
                    <a href="desSchedule.do" class="nav-link" href="dashboard-add-listing.html">
                        <i class="fa fa-fw fa-plus-circle"></i>
                        <span class="nav-link-text">예약관리</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
<main>
		<div class="container margin_detail">
			<div class="row">
				<div class="col-lg-8">
					<div class="tabs_detail">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a id="tab-A" href="#pane-A"
								class="nav-link active" data-toggle="tab" role="tab">d상담 정보</a></li>
							<li class="nav-item"><a id="tab-B" href="#pane-B"
								class="nav-link" data-toggle="tab" role="tab">전문가 정보</a></li>
						</ul>

						<div class="tab-content" role="tablist">
							<div id="pane-A" class="card tab-pane fade show active"
								role="tabpanel" aria-labelledby="tab-A">
								<div class="card-header" role="tab" id="heading-A">
									<h5>
										<a class="collapsed" data-toggle="collapse" href="#collapse-A" aria-expanded="true" aria-controls="collapse-A">상담 정보</a>
									</h5>
								</div>
								<div id="collapse-A" class="collapse" role="tabpanel"
									aria-labelledby="heading-A">
									<div class="card-body info_content">
										<h2></h2>
										<h2 align="left">상담 상세 정보</h2>
										<p>${course.detail}</p>
										<div class="add_bottom_25"></div>
										<h2>디자이너가 했던 사진들</h2>
										<div class="pictures magnific-gallery clearfix">
											<c:forEach items="${sty }" var="vo">
											<figure>
												<a href="${pageContext.request.contextPath}/resources/img/${vo.fileUuid}"
													title="${vo.fileName }" data-effect="mfp-zoom-in">
													<img src="${pageContext.request.contextPath}/resources/img/${vo.fileUuid}"
													data-src="${pageContext.request.contextPath}/resources/img/${vo.fileUuid}"
													class="lazy" alt="">
												</a>
											</figure>
											<button id="btnmargidn" onclick="delfunc('${vo.fileUuid}')">삭제</button>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<!-- /tab -->
						</div>
						<!-- /tab-content -->
					</div>
					<!-- /tabs_detail -->
				</div>
				<!-- /col -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</main>
		<form method="post" action="desStyleUp.do" enctype="multipart/form-data">
		<input type="hidden" name="did" value="${did }">
		<input type="file" id="file" name="file" class="multi" />
		<br> 
		<input type="submit">
	</form>
	<!-- COMMON SCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/resources/reservationreso/js/common_scripts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/reservationreso/js/common_func.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/reservationreso/assets/validate.js"></script>
	<!-- SPECIFIC SCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/resources/reservationreso/js/sticky_sidebar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/reservationreso/js/specific_detail.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/reservationreso/js/datepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/reservationreso/js/datepicker_func_1.js"></script>
	
</body>
</html>