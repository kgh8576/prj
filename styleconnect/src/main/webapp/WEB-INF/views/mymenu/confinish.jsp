<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Booking item -->
<div class="col-lg-12">

	<c:forEach var="conhisends" items="${conhisends }">

		<c:if test="${conhisends.state eq 'ccode005' }">
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
							<c:if test="${conhisends.reviewexist eq 1 }">
								<a href="reviewList.do?desId=${conhisends.id }"
									class="d-inline-block text-grey-2 text-up-small" style="margin-right: 50px"><i
									class="far fa-file-alt"></i> 리뷰보기</a>
								<a href="reviewModify.do?conNo=${conhisends.conNo }"
									class="d-inline-block text-grey-2 text-up-small"><i
									class="far fa-file-alt"></i> 리뷰수정</a>

							</c:if>
							<c:if test="${conhisends.reviewexist eq 0 }">
								<a href="reviewRegister.do?id=${id }&conNo=${conhisends.conNo}"
									class="d-inline-block text-grey-2 text-up-small"><i
									class="far fa-file-alt"></i> 리뷰쓰기</a>
							</c:if>
							<font id="Noticemessage${conhisends.conNo }" size="2"></font>
						</div>
					</div>
				</div>
			</div>
		</c:if>

	</c:forEach>

</div>
