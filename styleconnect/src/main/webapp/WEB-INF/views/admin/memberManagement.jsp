<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function memberConHistoryListSelect(id) {

	$.ajax({
		url : "memberConHistoryUpdateForm.do?&memId="+ id,
		type : "GET",
		dataType: "json",
		success : function(data) {
			var memberConHistoryList = data.memberConHistoryList;
			var paging = data.paging;
			
			for(var i = 0; i < memberConHistoryList.length; i++){
				console.log('conNo: ' + memberConHistoryList[i].conNo);
			}
		}
	});
}
</script>

<br><br><br><br><br><br><br><br><br><br>
<h1>일반회원 관리 페이지</h1>
<!-- 검색창 추가 -->
<table>
	<tr>
		<td>회원ID</td>
		<td>이름</td>
		<td>성별</td>
		<td>생년월일</td>
		<td>휴대폰 번호</td>
		<td>가입일</td>
		<td>처리</td>
	</tr>
	<c:forEach var="member" items="${memberList }">
	<tr>
		<td>${member.id}</td>
		<td>${member.name}</td>
		<td>${member.gender}</td>
		<td>${member.birth}</td>
		<td>${member.hp}</td>
		<td>${member.regday}</td> 
		<td><button onclick="memberConHistoryListSelect('${member.id}')">수정</button>
			<button>삭제</button>
		</td>
	</tr>
	</c:forEach>
	
</table>

<!-- 페이징 추가 -->
<pre>
게시 글 수: ${paging.pageSize}
첫 번째 페이지 번호: ${paging.firstPageNo}
이전 페이지 번호: ${paging.prevPageNo}
시작 페이지 (페이징 네비 기준): ${paging.startPageNo}
페이지 번호: ${paging.pageNo}
끝 페이지 (페이징 네비 기준): ${paging.endPageNo}
다음 페이지 번호: ${paging.nextPageNo}
마지막 페이지 번호: ${paging.finalPageNo}
게시 글 전체 수: ${paging.totalCount}
</pre>

