<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 상담목록 리스트 (blog-grid.html)</title>
</head>
<body>
 <div id="page-title" class="padding-tb-30px gradient-white">
        <div class="container">
            <ol class="breadcrumb opacity-5">
                <li><a href="main.do">Home</a></li>
                <li><a href="desListSelect.do?id=${id}">디자이너 상세정보</a></li>
                <li class="active">상담 목록</li>
            </ol>
          <c:forEach items="${course }" var="vo" begin="1" end="1">
            <h1 class="font-weight-300">${vo.name } 디자이너 상담 목록</h1>
        </c:forEach>
        </div>
    </div>


    <div class="margin-tb-30px">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                <!-- 상담목록 없을 경우 -->
				<c:if test="${empty course }">
				<div align="center">
				<h3>등록된 상담이 없습니다.</h3>
				</div>
				</c:if>
			<!-- 상담목록 -->
				<c:forEach items="${course }" var="vo">
                    <div class="blog-entry background-white border-1 border-grey-1 margin-bottom-35px">
                        <div class="row no-gutters">
                            <div class="img-in col-lg-5"><a href="#">
                            <img src="resources/img/${vo.fileUuid }" alt=""></a></div>
                            <div class="col-lg-7">
                                <div class="padding-25px">
                                    <a class="d-block h4  text-capitalize margin-bottom-8px" href="#">${vo.title} </a>
                                    <div class="meta">
                                        <span class="margin-right-20px text-extra-small"><a href="#" class="text-main-color"> ${vo.name }</a>디자이너</span>
                        			상담번호:${vo.courNo } / ${vo.price }원
                        			 <hr>
                                        <span> ${vo.detail }  </span>
                                        <div align="right">
                                        <a href="reservation.do?courNo=${vo.courNo }" >>예약하러가기</a>
                                    	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                 <!-- 상담목록 끝 -->
				</c:forEach>
                    <div class="row"></div>
                    <ul class="pagination pagination-md ">
                        <li class="page-item disabled"><a class="page-link rounded-0" href="#" tabindex="-1">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link rounded-0" href="#">Next</a></li>
                    </ul>
                </div>
                <div class="col-lg-4">

                    <div class="margin-bottom-30px">
                        <div class="padding-30px background-white border-radius-10">
                            <h4><i class="fas fa-search margin-right-10px text-main-color"></i> Search</h4>
                            <hr>
                            <div class="input-group mb-3">
                                <input type="text" value="Search..." class="form-control border-radius-0">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary text-white background-main-color border-radius-0" type="button">Search</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- 사이드 디자이너 이미지 -->
                    <div class="widget widget_categories">
                        <div class="margin-bottom-30px">
                            <div class="padding-30px background-white border-radius-10">
                                <h4><i class="fab fa-instagram margin-right-10px text-main-color"></i> 디자이너 이미지 </h4>
                                <hr>
                                <div class="row">
                                <c:forEach items="${img2 }" var="vo" begin="1" end="4">
                                	<c:if test="${vo.fileState eq 'sty' }">
                                    	<div class="col-6 margin-bottom-20px"><a href="#">
                                   		<img class="border-radius-10" src="resources/img/${vo.fileUuid }" alt=""></a></div>
                               		</c:if>
                               	</c:forEach>
                               	</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</body>
</html>