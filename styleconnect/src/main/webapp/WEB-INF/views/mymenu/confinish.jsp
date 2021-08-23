<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	
</script>
<!-- Booking item -->

<br>
<br>
<br>
<br>
<br> 

<div class="col-lg-12">
	<H3 style="text-align: center;">상담이 끝난 목록입니다.</H3>
	<p style="text-align: center; margin-bottom: 50px">파란글씨를 누르면 디자이너의
		상세 페이지로 이동할수있어요!</p>
	<c:forEach var="conhisends" items="${conhisends }">

		<c:if test="${conhisends.state eq 'ccode005' }">
			<div style="margin: auto; width: 100%"
				class="col-lg-6 margin-bottom-45px full-width">
				<div class="background-white thum-hover box-shadow  hvr-float"
					style="display: inline-block; width: 100%;">
					<div class="padding-30px full-width" style="width: 800px">
						<img
							src="${pageContext.request.contextPath}/resources/img/${conhisends.fileUuid}"
							class="float-left margin-right-100px border-radius-60 margin-bottom-20px"
							alt="" style="width: 300px; height: 300px;">
						<div class="margin-left-85px">
							<a class="d-block text-dark text-medium margin-bottom-5px"
								href="desListSelect.do?id=${conhisends.id }">${conhisends.title }
							</a>
							<div class="d-block padding-tb-5px">
								예약날짜 : <a href="desListSelect.do?id=${conhisends.id }"
									class="text-main-color">${conhisends.day }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약시간 : <a href="desListSelect.do?id=${conhisends.id }"
									class="text-main-color"> ${conhisends.time }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약신청한날짜 : <a href="desListSelect.do?id=${conhisends.id }"
									class="text-main-color">${conhisends.reservateDate }</a>
							</div>
							<div class="d-block padding-tb-5px">
								디자이너 : <a href="desListSelect.do?id=${conhisends.id }"
									class="text-main-color"> ${conhisends.desName }</a>
							</div>
							<p class="margin-top-15px text-grey-2">상세정보 :
								${conhisends.detail }</p>
							<c:if test="${conhisends.reviewexist eq 1 }">
								<a href="reviewList.do?desId=${conhisends.id }"
									class="d-inline-block text-grey-2 text-up-small"
									style="margin-right: 50px; color: black;"><i
									class="far fa-file-alt"></i> 리뷰보기</a>
							</c:if>
							<c:if test="${conhisends.canmodify eq 1 }">
								<a href="reviewModify.do?conNo=${conhisends.conNo }"
									class="d-inline-block text-grey-2 text-up-small"
									style="color: black;"><i class="far fa-file-alt"></i> 리뷰수정</a>
							</c:if>
							<c:if test="${conhisends.reviewexist eq 0 }">
								<c:if test="${conhisends.canreview eq 1 }">
									<a href="reviewRegister.do?id=${id }&conNo=${conhisends.conNo}"
										class="d-inline-block text-grey-2 text-up-small"
										style="color: black; margin-right: 50px;"><i
										class="far fa-file-alt" style="color: blue;"></i> 리뷰쓰기</a>
									<a href="reviewList.do?desId=${conhisends.id }"
										class="d-inline-block text-grey-2 text-up-small"
										style="margin-right: 50px; color: black;"><i
										class="far fa-file-alt"></i> 리뷰보기</a>
								</c:if>
								<c:if test="${conhisends.canreview eq 0 }">
									<a href="reviewList.do?desId=${conhisends.id }"
										class="d-inline-block text-grey-2 text-up-small"
										style="margin-right: 50px; color: black;"><i
										class="far fa-file-alt"></i> 리뷰보기</a>
									<p>3일이 지나 리뷰를 작성할수 없습니다.</p>
								</c:if>

							</c:if>
							<font id="Noticemessage${conhisends.conNo }" size="2"></font>
						</div>
					</div>
				</div>
			</div>
		</c:if>

	</c:forEach>

</div>
