<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>

<style>
.reserbtn{
 width: 200px;
 color: black;
}
#fixed {
  position: fixed;
  right: 0;
}
#dname{
	color: black;
}
#side{
align-content: center;
 border :1px;
}

#rate{
 margin-left:100px;
}
#tag{
 margin:  50px;
}
span:hover{
	color:white;
   background-color: grey;
}
#styimg{
 border: 1px solid #333;
}
.border-radius-img {
    border-radius: 10px;
    width: 300;
    margin: auto;
}
.row3 {
    display: flex;
    margin-right: -15px;
    margin-left: -15px;
    flex-wrap: wrap;
    flex-direction: row;
    align-content: center;
}
.row2{
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
    flex-wrap: wrap;
    flex-direction: row;
    align-content: center;
}
#sidevar{
color: black;
}
#thumimg{
	width: 100%;
	height: 100%;
}

#reserbt {
    float: left;
    display: block;
    margin: 0px 10px 10px 10px;
    padding: 0px 9px;
    font-size: 20px !important;
    line-height: 48px;
    color: #fff!important;
    border: #584ccb solid 1px;
    border-radius: 30px;
    text-decoration: none;
    background: #584ccb;
    text-align: center;
}
.col-44 {
    flex: 0 0 33.333333%;
    max-width: 90%;
    width: 100%;
}
</style>
</head>
<br/><br/><br/>
<body>
    <div id="page-title" class="padding-tb-30px gradient-white">
        <div class="container">
            <h1 class="font-weight-300">${designer.name} 디자이너</h1>
        </div>
    </div>
    <div class="margin-tb-30px">
        <div class="container">
            <div class="row3">
                <div class="col-lg-8">
                    <div class="margin-bottom-30px box-shadow">
                    	<c:if test="${empty img }">
                    		 <div class="col-6 margin-bottom-20px"><img id="thumimg"class="border-radius-img" src="resources/img/logo.jpg" alt=""></div>
                    	</c:if>
                    	<c:if test="${not empty img }">
                       	<c:forEach items="${img}" var="img1" begin="0" end="0"> 
                             <div class="margin-bottom-20px"><img id="thumimg" class="border-radius-img" src="resources/img/${img1.fileUuid }" alt=""></div>
                        </c:forEach>  
                        </c:if>
                        <div class="padding-10px background-white">
                            <div class="row">
                            </div>
                        </div>
                    </div>
                   <!-- 프로필(경력) -->
                    <div class="margin-bottom-30px box-shadow">
                        <div class="padding-30px background-white">
                            <h3><i class="far fa-user margin-right-10px text-main-color"></i> 경력 </h3>
                            <hr>
                            <p class="text-grey-4">${designer.career }</p>
                        </div>
                    </div>
                    <!-- 전문분야-->
                    <div class="margin-bottom-30px box-shadow">
                        <div class="padding-30px background-white">
                            <h3><i class="far fa-file margin-right-10px text-main-color"></i> 전문분야 </h3>
                          <!-- Post tags -->
                        <hr>
                        <div class="post-tags">
                            <div>
								<c:set var="majors" value="${fn:split(designer.major,',')}"></c:set>
								<c:forEach var="major" items="${majors}">
									<a href="searchList.do?search=${major }"> <span class="text-grey-4"># ${major} </span> </a>
								</c:forEach>
							</div>
                            <!-- // Post tags -->
                        </div>
                        </div>
                    </div>
                    	<!-- 디자이너 이미지 -->
                    <div class="margin-bottom-30px box-shadow">
                        <div class="padding-30px background-white">
                            <h3><i class="far fa-image margin-right-10px text-main-color"></i> 디자이너 스타일링 이미지 </h3>
                            <hr>
                             <div class="widget widget_categories">
                            <div class="padding-30px background-white border-radius-10">
                                <div class="row2"  >
                                <c:if test="${empty img2 }">
                                		<h3>등록된 스타일이 없습니다.</h3>
                                  </c:if>
                                <c:if test="${not empty img2 }">
                                 	<c:forEach items="${img2}" var="vo"> 
                                		 <div class="col-6 margin-bottom-20px"><img id="styimg"class="border-radius-10" src="resources/img/${vo.fileUuid }" alt=""></div>
                                	</c:forEach>  
                                  </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                        </div>
                    <!-- 리뷰 -->
                    <div class="margin-bottom-30px box-shadow">
                        <div class="padding-30px background-white">
                            <h3><i class="far fa-star margin-right-10px text-main-color"></i> 리뷰 </h3>
                            <hr>
                            <c:if test="${empty review }">
                            <div align="center">
                            <h3>등록된 후기가 없습니다.</h3>                            
                            </div>                            
                            </c:if>
                            <c:if test="${not empty review }">
							<c:forEach items="${review}" var="vo" begin="1" end="4">
                            <ul class="commentlist padding-0px margin-0px list-unstyled text-grey-3">
                                <li class="border-bottom-1 border-grey-1 margin-bottom-20px">
                                    <img src="http://placehold.it/60x60" class="float-left margin-right-20px border-radius-60 margin-bottom-20px" alt="">
                                    <div class="margin-left-85px">
                                        <a class="d-inline-block text-dark text-medium margin-right-20px" href="#"> 작성자 : ${vo.MName} </a>
                                       <%--  <span class="text-extra-small">상담명 :  <a href="#" class="text-main-color">${review1.title }</a></span> --%>
                                        <!-- 별점 -->
                                         <div class="rating clearfix">
                                        	<ul class="float-left">
                                        	<c:forEach begin="1" end="${vo.rate }">
												<li class="active"></li>
											</c:forEach> 
                                        	</ul>
                                    	</div>
                                        <!-- 별점 끝-->
                                        <p class="margin-top-15px text-grey-4">${vo.title } </p>
                               		</div>
                              	</li>
                          </ul>
							</c:forEach>
							</c:if>
                                <div align="right">
                                	<a href="reviewList.do?desId=${designer.id }"> > 리뷰 더 보기 </a>
                                	<input type="hidden" name="id" value="${designer.id }">
                               </div>
                        </div>
                    </div>
                    <!-- 리뷰 끝 -->
                       </div>
                <!-- 사이드바 div -->
                <div class="col-lg-4" id="fixed">
                    <div id="side" class="background-second-color border-radius-10 margin-bottom-45px text-white box-shadow">
                        <h3 id="dname" class="padding-lr-30px padding-top-20px"><i class="far fa-user margin-right-10px"></i> ${designer.name}디자이너</h3>
                        <hr>
                        <div class="padding-bottom-80px">
                            <!-- 상담목록가기 버튼 -->
                         <div class="col-44" id="reserbt">
                             <a  href="courseList.do?id=${designer.id }" ><i class="far fa-bookmark"></i>&nbsp 예 약 하 러 가 기 </a>
                          </div>
                       </div>
                       </div>
                      </div>
                     </div>
                    </div>
                    <!-- 사이드바 끝 -->
                    <div class="background-white border-radius-10 margin-bottom-45px">
                        <div class="padding-25px">
                        </div>
                    </div>
                </div>
</body>


</html>