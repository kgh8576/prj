<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과 페이지 </title>
<style type="text/css">
#imgsize {
    width: 200px;
    height: 200px;
}
</style>
</head>
<body>
<body>
	<div id="page-title" class="padding-tb-30px gradient-white">
		<div class="container">
			<h1 class="font-weight-300"> ${searchkeyword } 검색결과</h1>
		</div>
	</div>
	<!-- 검색창 -->
<form id="frm" action="searchList.do" method="post">
 <div class="margin-bottom-30px">
                        <div class="padding-30px background-white border-radius-10">
                            <h4><i class="fas fa-search margin-right-10px text-main-color"></i> Search</h4>
                            <hr>
                            <div class="input-group mb-3">
                                <input type="text" name="search" placeholder="${searchkeyword}" class="form-control border-radius-0">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary text-white background-main-color border-radius-0" type="submit">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>
</form>
<!-- 검색창 끝 -->
<c:if test="${empty search }">
<div align="center">
<h1>검색 결과가 없습니다.</h1>
</div>
</c:if>
	<div class="margin-tb-30px">
		<div class="container">
		<div class="row">
		<div class="col-lg-8"> 
					<div class="row">
						<!-- Doctor -->
						<c:forEach items="${search}" var="vo">
							<div class="col-lg-4 col-md-6 hvr-bob margin-bottom-45px">
								<div class="background-white box-shadow">
									<div class="thum">
										<a href="desListSelect.do?id=${vo.id}">
										<c:if test="${vo.fileUuid == '0'}">
										<img id="imgsize" src="resources/img/이미지 등록.png" alt="">
										</c:if>
										<c:if test="${vo.fileUuid != '0'}">
										<img id="imgsize" src="resources/img/${vo.fileUuid }" alt="">
										</c:if>
										</a>
									</div>
									<div class="padding-30px">
									<div>
										<c:set var="majors" value="${fn:split(vo.major,',')}"></c:set>
											<c:forEach var="major" items="${majors}">
											    <a href="searchList.do?search=${major }"> <span class="text-grey-2"># ${major} </span> </a>
											</c:forEach>
									</div>
										<h5 class="margin-tb-15px">
											<a class="text-dark" href="desListSelect.do?id=${vo.id }">${vo.name }
												디자이너</a>
										</h5>
										<div class="rating clearfix">
											<ul class="float-left">
										<c:if test="${vo.rate != 0}">
										<c:forEach begin="1" end="${vo.rate }">
												<li class="active"></li>
										</c:forEach>  평점 ${vo.rate }
										</c:if>
										<c:if test="${vo.rate == 0}">
											등록된 후기가 없습니다. 
										</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</body>
</html>