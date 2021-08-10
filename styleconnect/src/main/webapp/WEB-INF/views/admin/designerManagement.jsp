<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;1,700&display=swap" rel="stylesheet">

<style>
body {
 font-family: 'Lato', sans-serif;
}
.wrapper {
padding-top: 120px;
}
.card-body{
    text-align: center;
    box-shadow: 0px 15px 15px -8px rgba(0,0,0,0.5)
}
.card-body h6 {
font-size: 14px;
}
.card-title {
text-transform: uppercase;
font-weight: bold;
font-size: 24px;
}

@media (max-width: 800px){
    .mx-30{
        margin-bottom: 30px;
    }
}

#searchBox{
	width: 100%;
	margin-left: 0px;
	margin-right: 0px;
}    
</style>

<script>
function designerConHistoryListSelect(id) {

	$.ajax({
		url : "designerConHistoryUpdateForm.do?&desId="+ id,
		type : "GET",
		dataType: "json",
		success : function(data) {
			var designerConHistoryList = data.designerConHistoryList;
			var paging = data.paging;
			
			//모달바디 안에 태그 넣기
			var designerConHistoryUpdateFormCode;
			designerConHistoryUpdateFormCode += '<table>';
			designerConHistoryUpdateFormCode += '<tr>'
													+'<td>상담번호</td>'
													+'<td>ID</td>'
													+'<td>이름</td>'
													+'<td>상담날짜</td>'
													+'<td>상담시간</td>'
													+'<td>제목</td>'
													+'<td>상세내용</td>'
													+'<td>디자이너 코멘트</td>'
													+'<td>일반회원 코멘트</td>'
													+'<td>디자이너 참여 여부</td>'
													+'<td>일반회원 참여 여부</td>'
													+'<td>진행상황</td>'
												+'</tr>'
			
			for(var i = 0; i < designerConHistoryList.length; i++){
				designerConHistoryUpdateFormCode += '<tr>'
													+ '<td>' + designerConHistoryList[i].conNo + '</td>'
													+ '<td>' + designerConHistoryList[i].desId + '</td>'
													+ '<td>' + designerConHistoryList[i].name + '</td>'
													+ '<td>' + designerConHistoryList[i].day + '</td>'
													+ '<td>' + designerConHistoryList[i].time + '</td>'
													+ '<td>' + designerConHistoryList[i].title + '</td>'
													+ '<td>' + designerConHistoryList[i].detail + '</td>'
													+ '<td>' + designerConHistoryList[i].desComment + '</td>'
													+ '<td>' + designerConHistoryList[i].memComment + '</td>'
													+ '<td>' + designerConHistoryList[i].desAttend + '</td>'
													+ '<td>' + designerConHistoryList[i].memAttend + '</td>'
													+ '<td>' + designerConHistoryList[i].state + '</td>'
													+ '</tr>';
			}
												
			designerConHistoryUpdateFormCode += '</table>';
			
			
		}
	});
}
</script>

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
		<td><button data-toggle="modal" data-target="#preferenceFrmModal" onclick="designerConHistoryListSelect('${designer.id}')">수정</button>
			<button>승인</button>
		</td>
	</tr>
	</c:forEach>
	
</table>

<!-- Modal -->
<div class="modal fade" id="preferenceFrmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="designer-conHistory-list-target">
			모달 바디
			</div>
			<div class="modal-footer">
				<button>수정</button>
			</div>
		</div>
	</div>
</div>

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