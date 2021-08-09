<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 삭제 함수 -->


<br><br><br><br><br><br><br><br><br><br>
<h1>디자이너 관리 페이지</h1>
<!-- 셀렉트 박스로 상태 구분하여 보여줌, 검색창 -->
<table>
	<tr>
		<td>회원ID</td>
		<td>이름</td>
		<td>성별</td>
		<td>생년월일</td>
		<td>휴대폰 번호</td>
		<td>근무처</td>
		<td>경력</td>
		<td>전문분야</td>
		<td>major</td>
		<td>진행상황</td>
		<td>가입일</td>
		<td>코멘트</td>
		<td>파일 넘버</td>
		<!-- 수정 버튼 클릭 시 수정 폼페이지로 이동 -->
		<td>처리</td>
	</tr>
	<c:forEach var="designer" items="${designerList }">
	<tr>
		<td>${designer.id}</td>
		<td>${designer.name}</td>
		<td>${designer.gender}</td>
		<td>${designer.birth}</td>
		<td>${designer.hp}</td>
		<td>${designer.location}</td>
		<td>${designer.career}</td>
		<td>메이크업: ${designer.makeupyn}<br>
			컷: ${designer.cutyn}<br>
			펌: ${designer.permyn}<br>
			염색: ${designer.dyeyn}</td>
		<td>${designer.regday}</td>
		<td>${designer.major}</td>
		<td>${designer.state}</td>
		<td>${designer.regday}</td>
		<td>${designer.comments}</td>
		<td>${designer.fileNo}</td>
		<td><button onclick="location.href='designerInformationUpdateForm.do'">수정</button>
			<button>삭제</button>
		</td>
	</tr>
	</c:forEach>
	
</table>

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