<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Booking item -->
<div class="col-lg-12" style="margin-bottom: 50px;">
	<H3 style="text-align: center; margin-bottom: 50px">예약시간이 초과되어 상담을
		받지않으신 내역입니다.</H3>
	<c:forEach var="conhisends" items="${conhisends }">

		<c:if test="${conhisends.state eq 'ccode006' }">
			<div style="margin: auto; width: 100%"
				class="col-lg-6 margin-bottom-45px full-width">
				<div class="background-white thum-hover box-shadow  hvr-float">
					<div class="padding-30px full-width" style="width: 800px">
						<img src="http://placehold.it/60x60"
							class="float-left margin-right-20px border-radius-60 margin-bottom-20px"
							alt="">
						<div class="margin-left-85px">
							<a class="d-block text-dark text-medium margin-bottom-5px"
								href="#">${conhisends.title } </a>
							<div class="d-block padding-tb-5px">
								예약날짜 : <a href="#" class="text-main-color">${conhisends.day }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약시간 : <a href="#" class="text-main-color">
									${conhisends.time }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약신청한날짜 : <a href="#" class="text-main-color">${conhisends.reservateDate }</a>
							</div>
							<div class="d-block padding-tb-5px">
								디자이너 : <a href="#" class="text-main-color">
									${conhisends.desName }</a>
							</div>
							<p class="margin-top-15px text-grey-2">상세정보 :
								${conhisends.detail }</p>
							<a href="#" class="d-inline-block text-grey-2 text-up-small"><i
								class="far fa-file-alt"></i> Approve</a> <a href="#"
								class="d-inline-block margin-lr-20px text-grey-2 text-up-small"><i
								class="far fa-window-close"></i> Delete</a>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<div style="text-align: center;">
	<c:forEach var="conhisends" begin="0" end="0" items="${conhisends }">
	 <c:if test="${conhisends.state ne 'ccode006' }">
           <div>
				<p>불참한 내역이 없습니다!</p>
				<p>소중한 시간약속 계속해서 잘 지켜주세요!</p>
				<a href="membermypage.do" style="color: blue">마이페이지로!</a>
			</div>
      </c:if>
      	</c:forEach>
      	</div>

</div>