<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Booking item -->
<div class="col-lg-12" style="margin-bottom: 50px;">
	<H3 style="text-align: center;">예약시간이 초과되어 상담을
		받지않으신 내역입니다.</H3>
		<p style="text-align: center; margin-bottom: 50px">파란글씨를 누르면 디자이너의 상세 페이지로 이동할수있어요!</p>
	<c:forEach var="conhisends" items="${conhisends }">

		<c:if test="${conhisends.state eq 'ccode006' }">
			<div style="margin: auto; width: 100%"
				class="col-lg-6 margin-bottom-45px full-width">
				<div class="background-white thum-hover box-shadow  hvr-float" style="display:inline-block; width:100%;">
					<div class="padding-30px full-width" >
						<img src="${pageContext.request.contextPath}/resources/img/${conList.fileUuid}"
							class="float-left margin-right-100px border-radius-60 margin-bottom-20px"
							alt="" style="width:300px;	height: 300px;">
						<div class="margin-left-85px">
							<a class="d-block text-dark text-medium margin-bottom-5px"
								href="#">${conhisends.title } </a>
							<div class="d-block padding-tb-5px">
								예약날짜 : <a href="desListSelect.do?id=${conhisends.id }" class="text-main-color">${conhisends.day }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약시간 : <a href="desListSelect.do?id=${conhisends.id }" class="text-main-color">
									${conhisends.time }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약신청한날짜 : <a href="desListSelect.do?id=${conhisends.id }" class="text-main-color">${conhisends.reservateDate }</a>
							</div>
							<div class="d-block padding-tb-5px">
								디자이너 : <a href="desListSelect.do?id=${conhisends.id }" class="text-main-color">
									${conhisends.desName }</a>
							</div>
							<p class="margin-top-15px text-grey-2">상세정보 :
								${conhisends.detail }</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<div style="text-align: center;">
	<c:forEach var="conhisends" items="${conhisends }">
	 <c:if test="${conhisends.state ne 'ccode006' }">
           <c:set></c:set>
      </c:if>
      	</c:forEach>
      	</div>

</div>