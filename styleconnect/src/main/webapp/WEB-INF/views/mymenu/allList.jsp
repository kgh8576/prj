<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Booking item -->
<head>
</head>
<div class="col-lg-12" style="margin-bottom: 50px;">
	<H3 style="text-align: center; ">모든 예약하신 목록입니다.</H3>
	<p style="text-align: center; margin-bottom: 50px">파란글씨를 누르면 디자이너의 상세 페이지로 이동할수있어요!</p>
	<c:forEach var="conList" items="${conList }">

			<div style="margin: auto; width: 100%"
				class="col-lg-6 margin-bottom-45px full-width">
				<div class="background-white thum-hover box-shadow  hvr-float" style="display:inline-block; width:100%;">
					<div class="padding-30px">
						<img src="${pageContext.request.contextPath}/resources/img/${conList.fileUuid}"
							class="float-left margin-right-100px border-radius-60 margin-bottom-20px"
							alt="" style="width:300px;	height: 300px;">
						<div class="margin-left-85px">
							<a class="d-block text-dark text-medium margin-bottom-5px"
								href="#">${conList.title } </a>
							<div class="d-block padding-tb-5px">
								예약날짜 : <a href="desListSelect.do?id=${conList.id }" class="text-main-color">${conList.day }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약시간 : <a href="desListSelect.do?id=${conList.id }" class="text-main-color">
									${conList.time }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약신청한날짜 : <a href="desListSelect.do?id=${conList.id }" class="text-main-color">${conList.reservateDate }</a>
							</div>
							<div class="d-block padding-tb-5px">
								디자이너 : <a href="desListSelect.do?id=${conList.id }" class="text-main-color">
									${conList.desName }</a>
							</div>
							<div class="d-block padding-tb-5px">
								상태 : <a href="desListSelect.do?id=${conList.id }" class="text-main-color">
									${conList.codecontent }</a>
							</div>
							<p class="margin-top-15px text-grey-2">상세정보 :
								${conList.detail }</p>
								<a href="reviewList.do?desId=${conList.id }"
									class="d-inline-block text-grey-2 text-up-small" style="margin-right: 50px"><i
									class="far fa-file-alt"></i> 리뷰보기</a>
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
	<div style="text-align: center;">
	 <c:if test="${empty conList}">
           <div>
				<p>아직 한번도 이용안해보신거같아요!</p>
				<p>나에게 맞는 선생님을 찾으러 가볼까요?</p>
				<a href="category.do" style="color: blue">찾으러가기!</a>
			</div>
      </c:if>
      	</div>

</div>