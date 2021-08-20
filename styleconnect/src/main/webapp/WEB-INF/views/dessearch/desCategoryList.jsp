<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<body>
<br><br><br><br><br>
	
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
<!-- 디자이너 카테고리 박스 -->
<div class="margin-tb-100px">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<div class="featured-categorey">
						<div class="row">
						<!-- 박스 -->
							<div class="col-6 margin-bottom-30px wow fadeInUp">
								<a href="cutList.do" class="d-block border-radius-15 hvr-float hvr-sh2">
								<div class = "background-main-color text-white border-radius-15 padding-30px text-center opacity-hover-7">
									<div class="icon margin-bottom-15px opacity-7">
										<img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/assets/img/icon/hair-cut.png" alt="">
									</div>
											컷 전문
								</div>
									</a>
							</div>
							<div class="col-6 margin-bottom-30px wow fadeInUp">
								<a href="permList.do" class="d-block border-radius-15 hvr-float hvr-sh2">
								<div class="background-main-color text-white border-radius-15 padding-30px text-center opacity-hover-7">
									<div class="icon margin-bottom-15px opacity-7">
										<img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/assets/img/icon/hair-perm.png" alt="">
									</div>
										펌 전문
									</div>
								</a>
							</div>
							<div class="col-6 margin-bottom-30px wow fadeInUp" data-wow-delay="0.2s">
								<a href="dyeList.do" class="d-block border-radius-15 hvr-float hvr-sh2">
								<div class="background-main-color text-white border-radius-15 padding-30px text-center opacity-hover-7">
									<div class="icon margin-bottom-15px opacity-7">
										<img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/assets/img/icon/hair-dye.png" alt="">
									</div>
										염색 전문
									</div>
								</a>
							</div>
							<div class="col-6 wow fadeInUp" data-wow-delay="0.2s">
								<a href="makeupList.do" class="d-block border-radius-15 hvr-float hvr-sh2">
								<div class="background-main-color text-white border-radius-15 padding-30px text-center opacity-hover-7">
									<div class="icon margin-bottom-15px opacity-7">
										<img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/assets/img/icon/makeup.png" alt="">
									</div>
										메이크업 전문
									</div>
								</a>
							</div>
							<div class="col-6 wow fadeInUp" data-wow-delay="0.4s">
								<a href="dessearchList.do" class="d-block border-radius-15 hvr-float hvr-sh2">
								<div class="background-main-color text-white border-radius-15 padding-30px text-center opacity-hover-7">
										<div class="icon margin-bottom-15px opacity-7">
										<img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/assets/img/icon/allList.png" alt="">
									</div>
										전체보기
									</div>
								</a>
							</div>
						</div>
					</div>
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
