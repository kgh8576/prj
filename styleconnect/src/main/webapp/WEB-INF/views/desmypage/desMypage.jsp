<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 마이페이지</title>
</head>
<body>

<div align="center">
${my.id }
</div>
<input type="hidden" id="did" name="did" value="${did }">
<div class="row justify-content-center">
	              <div class="col-lg-7">
                    <div class="row">
                        <div class="col-md-3 col-6 sm-mb-30px wow fadeInUp">
                            <a href="desInfo.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-1.png" alt="">
                                    </div>
                                    내정보관리
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 sm-mb-30px wow fadeInUp" data-wow-delay="0.2s">
                            <a href="desSchedule.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-2.png" alt="">
                                    </div>
                                    스케쥴 관리
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.4s">
                            <a href="desStyle.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-3.png" alt="">
                                    </div>
                                    스타일링 관리
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.6s">
                            <a href="desMajor.do" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-4.png" alt="">
                                    </div>
                                    전문분야 설정
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-6 wow fadeInUp" data-wow-delay="0.6s">
                            <a href="desCourse.do?id=${my.id }" class="d-block border-radius-15 hvr-float hvr-sh2">
                                <div class="background-main-color text-white border-radius-15 padding-20px text-center opacity-hover-7">
                                    <div class="icon margin-bottom-15px opacity-7">
                                        <img src="${pageContext.request.contextPath}/resources/assets/img/icon/categorie-4.png" alt="">
                                    </div>
                                    상담내역
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>