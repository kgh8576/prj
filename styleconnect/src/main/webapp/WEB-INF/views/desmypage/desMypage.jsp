<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 마이페이지</title>
</head>
<style>
.col-d-3 {
    -ms-flex: 0 0 25%;
    max-width: 30%;
    margin-bottom: 30px;
}
#img{
max-width: 100px;
}
</style>
<body>
<div class="row justify-content-center">
	              <div class="col-lg-7">
	              <br/><br/><br/><br/><br/>
					<div align="center" style="margin:100px;">
					<h1>${my.name }님의 마이페이지</h1>
					</div>
                    <div class="row">
                        <div class="col-d-3 col-6 sm-mb-30px wow fadeInUp">
                            <a href="desInfo.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img id="img" src="${pageContext.request.contextPath}/resources/assets/img/icon/profile-icon.png" alt="">
                                    </div>
                                    내정보관리
                                </div>
                            </a>
                        </div>
                        <div class="col-d-3 col-6 wow fadeInUp">
                            <a href="desMajor.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img id="img" src="${pageContext.request.contextPath}/resources/assets/img/icon/major-icon.png" alt="">
                                    </div>
                                    전문분야 설정
                                </div>
                            </a>
                        </div>
                        <div class="col-d-3 col-6 wow fadeInUp">
                            <a href="desStyle.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px">
                                        <img id="img" src="${pageContext.request.contextPath}/resources/assets/img/icon/styling-icon.png" alt="">
                                    </div>
                                    스타일링사진 관리
                                </div>
                            </a>
                        </div>
                        <div class="col-d-3 col-6 sm-mb-30px wow fadeInUp" data-wow-delay="0.2s">
                            <a href="desSchedule.do?state=ccode001" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img id="img" src="${pageContext.request.contextPath}/resources/assets/img/icon/reservation-icon.png" alt="">
                                    </div>
                                    예약관리
                                </div>
                            </a>
                        </div>
                        <div class="col-d-3 col-6 wow fadeInUp" data-wow-delay="0.2s">
                            <a href="desCourse.do?id=${my.id }" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img id="img" src="${pageContext.request.contextPath}/resources/assets/img/icon/consulting-icon.png" alt="">
                                    </div>
                                    내상담관리
                                </div>
                            </a>
                        </div>
                         <div class="col-d-3 col-6 wow fadeInUp" data-wow-delay="0.2s">
                            <a href="desWorkOpen.do?id=${my.id }" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img id="img" src="${pageContext.request.contextPath}/resources/assets/img/icon/clock-icon.png" alt="">
                                    </div>
                                    스케쥴관리
                                </div>
                            </a>
                        </div>
                        <div class="col-d-3 col-6 wow fadeInUp" data-wow-delay="0.4s">
                            <a href="reviewList.do?desId=${my.id }" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img id="img" src="${pageContext.request.contextPath}/resources/assets/img/icon/review-icon.png" alt="">
                                    </div>
                                    리뷰관리
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>