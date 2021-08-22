<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 상담목록 리스트 (blog-grid.html)</title>
<style type="text/css">
.row1 {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
    flex-wrap: wrap;
    flex-direction: row;
    align-content: center;
}

.border-radius-10a {
    border-radius: 10px;
    border: 1px solid #eaeaea;
    width: 100px;
    height: 100px;
    margin: auto;
}
.border-radius-10b {
    border-radius: 10px;
    width: 300px;
    margin: auto;
}
.blog-entry{
width: 730px;
height: 270px;
padding: 15px;
box-sizing: border-box;
border: 1px solid #fff;
box-shadow: 0px 6px 15px 0px rgb(0 0 0 / 10%);
transition: 0.6s;
position: relative;
}
.blog-entry:hover{
transform: translateY(-5px);}
.img-in{padding-top: 1%;}

.meta .a{
width: 350px;
height: 5px;
}
#reserve {
position: absolute;
right: 15px;
bottom: 15px;}
</style>
</head>
<body>
<br/><br/>
 <div id="page-title" class="padding-tb-30px gradient-white">
        <div class="container">
            <ol class="breadcrumb opacity-5">
                <li><a href="main.do">Home</a></li>
                <li><a href="desListSelect.do?id=${designer.id}">디자이너 상세정보</a></li>
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
                                <div class="padding-15px">
                                    <a class="d-block h4  text-capitalize margin-bottom-8px" href="reservation.do?courNo=${vo.courNo }">${vo.title} </a>
                                    <div class="meta">
                                        <span class="margin-right-20px text-extra-small"> ${vo.name }디자이너</span>
                        			<br/> ${vo.price }원
                        			 <hr>
                                        <span class="a"> ${vo.detail }  </span>
                                    </div>
                                </div>
                            </div>
                                        <div id="reserve" align="right">
                                        <a class="text-main-color" href="reservation.do?courNo=${vo.courNo }" >>예약하기</a>
                                    	</div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                 <!-- 상담목록 끝 -->
				</c:forEach>
               <div class="row"></div>
                </div>
                <div class="col-lg-4">
                <form id="frm" action="searchList.do" method="post">
                    <div class="margin-bottom-30px">
                        <div class="padding-30px background-white border-radius-10b">
                            <h4><i class="fas fa-search margin-right-10px text-main-color"></i> 검색</h4>
                            <hr>
                            <div class="input-group mb-3">
                              <input type="text" name="search" placeholder="" class="form-control border-radius-0">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary text-white background-main-color border-radius-0" type="submit">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                    <!-- 사이드 디자이너 이미지 -->
                    <div class="widget widget_categories">
                        <div class="margin-bottom-30px">
                            <div class="padding-30px background-white border-radius-10b">
                                <h4><i class="fab fa-instagram margin-right-10px text-main-color"></i> 스타일링 </h4>
                                <hr>
                                <div class="row1">
                                <c:if test="${not empty img2 }">
                                <c:forEach items="${img2 }" var="vo" begin="0" end="3">
                                	<c:if test="${vo.fileState eq 'sty' }">
                                    	<div class="col-6 margin-bottom-20px"><a href="#">
                                   		<img class="border-radius-10a" src="resources/img/${vo.fileUuid }" alt=""></a></div>
                               		</c:if>
                               	</c:forEach>
                               	</c:if>
                               	<c:if test="${empty img2 }">
                               	<div align="center">
                               	 <p> &nbsp;&nbsp;&nbsp; 등록된 스타일이 없습니다.</p>
                               	</div>
                               	</c:if>
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