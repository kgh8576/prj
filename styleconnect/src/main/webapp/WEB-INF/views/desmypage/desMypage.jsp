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

<a href="desInfo.do">내정보 관리 - 기본정보 수정</a><br/>
<a href="desSchedule.do">스케쥴 관리 - 상담내역목록/상담내역 상세정보/상담화면이동</a><br/>
<a href="desStyle.do">스타일링 이력 - 스타일링이력 조회/등록/수정</a><br/>
<a href="desStyle.do">전문분야 설정 - major수정</a>
<hr/>
<a href="desStyle.do">상담내역 - 상담내역목록/상담내역 상세정보조회/등록/수정/삭제</a>
</div>
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
                                    스타일링 이력
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
                    </div>
                </div>
            </div>
</body>
</html>