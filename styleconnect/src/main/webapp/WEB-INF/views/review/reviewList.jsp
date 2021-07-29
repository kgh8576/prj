<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.pagination {
		  display: inline-block;
		}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

elip{
	overflow: hidden;
	text-overflow: ellipsis;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 3; /* ellipsis line */
	-webkit-box-orient: vertical;
}

</style>
<script>
	// 페이지 로드 완료 시 시
	$(function(){
		var pullValue = document.location.href;
		pullValue = pullValue.slice(pullValue.indexOf('pullValue')).slice(10);
		if(pullValue != "") {
			$('#pullValue').val(pullValue);
		}
	});
	
	// 페이지 버튼 클릭 시
	function goPage(page){
		var pullValue = $('#pullValue option:selected').val();
		var desId = $('#hiddenId').val();
		location.href = 'reviewList.do?page='+page+'&desId='+desId+'&pullValue='+pullValue;
	}
	// 풀다운 값 변경 시 해당 풀다운 값을 가진 1페이지로 돌아간다
	function changeList(){
		var pullValue = $('#pullValue option:selected').val();
		var desId = $('#hiddenId').val();
		location.href = 'reviewList.do?page=1&desId='+desId+'&pullValue='+pullValue;
	}
	function goInfo(target){
		$('#'+target+'_form').submit();
	}
	
</script>
</head>
<body>
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
	<br><br><br>
		<div align="center">
			<p style="font-size: 20px;"><Strong>[name] 디자이너의 총 리뷰 건수는 ${total } 입니다</Strong></p>
			<br>
			<div class="rating clearfix" style="display: inline-block;">
				<ul class="float-left">
					<c:forEach begin="1" end="${rate }">
						<li class="active"></li>
					</c:forEach>
					<c:forEach begin="${rate+1}" end="5">
						<li></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div align="right">
			<input type="hidden" value="${desId}" id="hiddenId">
			<select name='pullValue' id="pullValue" onchange="changeList()">
				<option value='byDate'>최신 일자 순</option>
				<option value='byRatingDesc'>높은 평점 순</option>
				<option value='byRatingAsc'>낮은 평점 순</option>
			</select>
		</div>
		<div>
			<c:forEach items="${reviewListPaging }" var="vo">
				<div style="margin:10px; border-bottom:1px solid black;" onclick="goInfo('${vo.conNo}')">
					<form action="reviewInfo.do" method="POST" id="${vo.conNo }_form">
  						<input type="hidden" name="conNo" value="${vo.conNo}">
					</form>
					<h3>${vo.reviewTitle }</h3>
					<div class="rating clearfix">
						<ul class="float-left">
							<c:forEach begin="1" end="${vo.rate }">
								<li class="active"></li>
							</c:forEach>
							<c:forEach begin="${vo.rate+1}" end="5">
								<li></li>
							</c:forEach>
						</ul>
						<p align="right" style="color: grey;">${vo.stringwDate }&emsp;&emsp;&emsp; ${vo.memId }</p>
					</div>
					<elip>${vo.contents}</elip>
					<br><p style="color: grey; font-size: 20px;">${vo.title } &emsp; <fmt:formatNumber value="${vo.price}" pattern="#,###"/>
					</p>
					
				</div>
				<br>
			</c:forEach>
		</div>
		<div align="center">
			<jsp:include page="paging.jsp" flush="true">
			    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
			    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
			    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
			    <jsp:param name="pageNo" value="${paging.pageNo}" />
			    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
			    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
			    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
			</jsp:include>
		</div>
	</div>
	<div class="col-md-3"></div>
</div>
</body>
</html>