<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
<script>
	// 페이지 버튼 클릭 시
	function goPage(page){
		var pullValue = $('#pullValue option:selected').val();
		if (pullValue == null){ // 선택된 게 없으면 all을 넣어서 준다
			pullValue == 'byDate';
		}
		location.href = 'editReservation.do?page='+page+'&pullValue='+pullValue;
	}
</script>
</head>
<body>
	<div>
		<select>
			<option value></option>
		</select>
	</div>
	<div>
		${name } 디자이너의 총 리뷰 건수는 ${total } 입니다
		<ul>
			<c:forEach begin="0" end="${rate }">
				<li class="active"></li>
			</c:forEach>	
		</ul>
	</div>
	<div>
		<c:forEach items="${reviewListPaging }" var="vo">
			<div>
				${vo.title }
			</div>
			
		</c:forEach>
		
		<div>
		</div>
	</div>
	<div>
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
</body>
</html>