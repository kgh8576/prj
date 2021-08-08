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
                <li><a href="desListSelect.do?id=${did}">디자이너 상세정보</a></li>
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
             <!-- 상담목록 없을경우 -->
             <c:if test="${empty course }">
             상담목록없음
             <div class="blog-entry background-white border-1 border-grey-1 margin-bottom-35px">
                        <div class="row no-gutters">
                            <div class="img-in col-lg-5"><a href="#"><img src="http://placehold.it/400x240" alt=""></a></div>
                            <div class="col-lg-7">
                                <div class="padding-25px">
                                    <a class="d-block h4  text-capitalize margin-bottom-8px" href="#">상담제목 </a>
                                    <div class="meta">
                                        <span class="margin-right-20px text-extra-small"><a href="#" class="text-main-color"> ${vo.name }</a>디자이너</span>
                        			 <hr>
                                        <span> 상담을 생성하고 고객을 만나보세요! </span>
                                        <div align="right">
                                        <a href="desCourseRegister.do" > >상담생성하기</a>
                                    	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
             </c:if>
			<!-- 상담목록있을경우(조회,수정,삭제) -->
				<c:forEach items="${course}" var="vo">
                    <div class="blog-entry background-white border-1 border-grey-1 margin-bottom-35px">
                        <div class="row no-gutters">
                            <div class="img-in col-lg-5"><a href="#"><img src="http://placehold.it/400x240" alt=""></a></div>
                            <div class="col-lg-7">
                                <div class="padding-25px">
                                    <a class="d-block h4  text-capitalize margin-bottom-8px" href="#">${vo.title} </a>
                                    <div class="meta">
                                        <span class="margin-right-20px text-extra-small"><a href="#" class="text-main-color"> ${vo.name }</a>디자이너</span>
                        			상담번호:${vo.courNo }
                        			 <hr>
                                        <span> ${vo.detail }  </span>
                                        <div align="right">
                                        <a href="reservation.do?courNo=${vo.courNo }" >>수정하기</a>
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

                 

                </div>
            </div>

        </div>
    </div>

</body>
</html>