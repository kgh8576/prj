<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.row {
flex-wrap: nowrap;
}
</style>

<br><br><br><br><br>
<!--  
<div align="center">
	<h1>관리자 홈</h1>
	<h1><a href="memberManagement.do">일반회원 관리</a></h1>
	<h1><a href="designerManagement.do">디자이너 관리</a></h1>
	<h1><a href="crawlManagement.do">크롤링 관리</a></h1>
</div>
-->

<div align="center" style="margin:100px;">
	<h1>관리자 홈</h1>
</div>

<div class="margin-tb-100px">
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<div class="row">
					<div class="featured-categorey">
						<div class="row">
							<!-- 박스1 -->
							<div onclick="location.href='memberManagement.do'" class="col-6 margin-bottom-30px wow fadeInUp">
								<!-- <a href="cutList.do" class="d-block border-radius-15 hvr-float hvr-sh2"></a> -->
								<div class = "background-main-color text-white border-radius-15 padding-30px text-center opacity-hover-7">
									<div class="icon margin-bottom-15px opacity-7">
										<img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/assets/img/icon/hair-cut.png" alt="">
									</div>
										일반회원 관리
								</div>	
							</div>
							<!-- 박스1 끝 -->
							<!-- 박스2-->
							<div class="col-6 margin-bottom-30px wow fadeInUp" data-wow-delay="0.2s">
								<!-- <a href="permList.do" class="d-block border-radius-15 hvr-float hvr-sh2"></a> -->
								<div onclick="location.href='designerManagement.do'" class="background-main-color text-white border-radius-15 padding-30px text-center opacity-hover-7">
									<div class="icon margin-bottom-15px opacity-7">
										<img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/assets/img/icon/hair-perm.png" alt="">
									</div>
										디자이너 관리
								</div>
							</div>
							<!-- 박스2 끝-->
							<!-- 박스3-->
							<div class="col-6 margin-bottom-30px wow fadeInUp" data-wow-delay="0.4s">
								<!-- <a href="dyeList.do" class="d-block border-radius-15 hvr-float hvr-sh2"></a> -->
								<div onclick="location.href='crawlManagement.do'" class="background-main-color text-white border-radius-15 padding-30px text-center opacity-hover-7">
									<div class="icon margin-bottom-15px opacity-7">
										<img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/assets/img/icon/hair-dye.png" alt="">
									</div>
										크롤링 관리
								</div>
							</div>
							<!-- 박스3 끝 -->
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

