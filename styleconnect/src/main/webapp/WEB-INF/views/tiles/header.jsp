<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>StyleConnect에 방문해주셔서 감사합니다.</title>

<style type="text/css">
#menu-main {
	padding-right: 200px;
	padding-top: 30px;
}

header ul.nav-menu>li>a {
	color: #000;
	z-index: 3;
	opacity: .7;
	font-family: "Poppins";
	text-transform: capitalize;
	font-size: 20px;
	font-weight: 500;
	text-decoration: none;
	display: block;
	padding: 35px 0px 35px 0px;
	margin-right: 20px;
}

#loginJoin {
	padding-top: 45px;
}

#loginJoin a {
	margin-right: 30px;
}

#logo {
	font-size: 20px;
	margin-top: 70px;
}
</style>




<script type="text/javascript">
	$(document)
			.ready(
					function() {

						//상담시작 알람
						<c:if test="${not empty id && id ne 'admin'}">
						var memId = "${id}";
						$
								.ajax({
									url : 'startSchedule.do',
									data : {
										memId : memId
									},
									type : 'post',
									success : function(data) {
										console.log(data);
										if (data == 1) {
											document.getElementById("altercheck").style.display = 'block';
										}
									},
									error : function(err) {
										console.log(err);
										console.log("스케줄러 불러오기오류");
									}

								})
						$
								.ajax({
									url : 'checkSchedule.do',
									data : {
										memId : memId
									},
									type : 'post',
									success : function(data) {
										console.log(data);
										if (data == 1) {
											document
													.getElementById("altercheck2").style.display = 'block';
										} else {
											document
													.getElementById("altercheck2").style.display = 'none';
										}
									},
									error : function(err) {
										console.log(err);
										console.log("스케줄러 불러오기오류");
									}

								})

						</c:if>

					});
</script>
</head>

<body>
	<header>
		<div id="fixed-header-dark" class="header-output fixed-header">
			<div class="container header-in">
				<div class="row">
					<div class="col-xl-2 col-lg-2">
						<a id="logo" href="main.do" class="d-inline-block margin-tb-15px">
							<strong>STYLE CONNECT</strong>
						</a>
					</div>
					<div class="col-lg-7 col-md-12 position-inherit">
						<ul id="menu-main"
							class="nav-menu float-lg-right link-padding-tb-20px">
							<li><a href="consulting.do"><strong>상담하기</strong></a></li>
							<li><a href="category.do"><strong>디자이너 찾기</strong></a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-12" id="loginJoin">
						<hr class="margin-bottom-0px d-block d-sm-none">
						<c:if test="${empty id && empty did }">
							<a href="loginpage.do"
								class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right">
								<i class="far fa-user"></i>로그인
							</a>
							<a href="Insertchoice.do"
								class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right">
								<i class="far fa-user"></i>회원가입
							</a>
						</c:if>
						<hr class="margin-bottom-0px d-block d-sm-none">
						<c:if test="${not empty id }">
							<c:choose>
								<c:when test="${id eq 'admin'}">
									<a href="logout.do"
										class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right">
										<i class="far fa-user"></i>로그아웃
									</a>
									<a href="admin.do"
										class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right">
										<i class="far fa-user"></i>관리자 홈
									</a>
								</c:when>
								<c:when test="${id ne 'admin'}">
									<a href="logout.do"
										class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right">
										<i class="far fa-user"></i>로그아웃
									</a>
									<a href="membermypage.do"
										class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right">
										<i class="far fa-user"></i>마이페이지
									</a>
								</c:when>
							</c:choose>
						</c:if>
						<!-- 디자이너 마이페이지 -->
						<hr class="margin-bottom-0px d-block d-sm-none">
						<c:if test="${not empty did }">
							<input type="hidden" id="did" name="did" value="${did }">
							<a href="logout.do"
								class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right">
								<i class="far fa-user"></i>로그아웃
							</a>
							<a href="mypage.do"
								class="margin-tb-20px d-inline-block text-up-small float-left float-lg-right">
								<i class="far fa-user"></i>마이페이지
							</a>
						</c:if>
						<!-- 디자이너 마이페이지 -->
					</div>
				</div>

			</div>
			<br>
			<div id="altercheck" class="alert alert-success alert-dismissible"
				style="display: none; width: 800px; text-align: center; margin: auto;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>상담시간입니다!</strong> <a href="consulting.do"> 여기를 누르면
					상담페이지로 이동합니다 ! </a>
			</div>
			<div id="altercheck2" class="alert alert-success alert-dismissible"
				style="display: none; width: 800px; text-align: center; margin: auto;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>상담 시작시간까지 얼마 남지않았습니다!</strong> <a href="consulting.do"> 여기를 눌러 디자이너 선생님과 상담을 준비해요! </a>
			</div>
		</div>
	</header>
	<!-- // Header  -->
</body>
</html>
