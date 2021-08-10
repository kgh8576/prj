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
function designerConHistoryUpdate(index) {
	
	var form = document.getElementById("designer-conHistory-update-form" + index);
	var formData = new FormData(form);
	
	//formData.append("test", "test");
	
	for (var value of formData.values()) {
		   console.log("value 확인: " + value);
		}
	
	$.ajax({
		url : "designerConHistoryUpdate.do",
		type : "POST",
		data : formData,
		success : function(message) {
			console.log(message);
		}
	});	
}

function getSelectedDesignerAttendValue(index){
	$('#designer-attend' + index).attr('value',$('#designer-attend-select-box option:selected').val());
	console.log($('#designer-attend').val());
}

function getSelectedMemberAttendValue(index){
	$('#member-attend' + index).attr('value', $('#member-attend-select-box option:selected').val());
	console.log($('#member-attend').val());
}

function designerConHistoryListSelect(id) {

	$.ajax({
		url : "designerConHistoryUpdateForm.do?&desId="+ id,
		type : "GET",
		dataType: "json",
		success : function(data) {
			var designerConHistoryList = data.designerConHistoryList;
			var paging = data.paging;
			
			//모달 바디 안에 태그 삽입
				//1. 태그 생성
			var designerConHistoryUpdateFormCode ='';
			designerConHistoryUpdateFormCode += '<table>';//
			designerConHistoryUpdateFormCode += '<tr>'//
													+'<td>상담번호</td>'//
													+'<td>디자이너 ID</td>'//
													+'<td>일반회원 ID</td>'//
													+'<td>상담날짜</td>'//
													+'<td>상담시간</td>'//
													+'<td>제목</td>'//
													+'<td>상세내용</td>'//
													+'<td>디자이너 코멘트</td>'//
													+'<td>일반회원 코멘트</td>'//
													+'<td>디자이너 참여 여부</td>'//
													+'<td>일반회원 참여 여부</td>'//
													+'<td>진행상황</td>'//
													+'<td>처리</td>'//
												+'</tr>'//
			
			for(var i = 0; i < designerConHistoryList.length; i++){
				designerConHistoryUpdateFormCode += '<form id="designer-conHistory-update-form' + i + '">' + 'method="POST">' + '<tr>'
													+ '<td>' + designerConHistoryList[i].conNo 
													+ '<input type="hidden" id="consulting_no" name="conNo" value="' + designerConHistoryList[i].conNo + '">'//conNo 히든
													+ '</td>'//
													+ '<td>' + designerConHistoryList[i].desId + '</td>'//
													+ '<td>' + designerConHistoryList[i].memId + '</td>'//
													+ '<td>' + designerConHistoryList[i].day + '</td>'//
													+ '<td>' + designerConHistoryList[i].time + '</td>'//
													+ '<td>' + designerConHistoryList[i].title + '</td>'//
													+ '<td>' + designerConHistoryList[i].detail + '</td>'//
													+ '<td>' + designerConHistoryList[i].desComment + '</td>'//
													+ '<td>' + designerConHistoryList[i].memComment + '</td>';//
				//조건에 따라 디자이너 참여 여부 셀렉트 박스 코드 추가
				if (designerConHistoryList[i].desAttend == "Y") {
					designerConHistoryUpdateFormCode += '<td>'//
														+ '<select id="designer-attend-select-box' + i + '"' + 'onChange="getSelectedDesignerAttendValue();">'//
														+ '<option value="Y" selected="selected">Y</option>'//
														+ '<option value="N">N</option>'//
														+ '</select>'// 
														+ '<input type="hidden" id="designer-attend' + i + '"' + 'name="desAttend">'//desAttend 히든
														+ '</td>';//
				} else if (designerConHistoryList[i].desAttend == "N") {//
					designerConHistoryUpdateFormCode += '<td>'// 
														+ '<select id="designer-attend-select-box' + i + '"' + 'onChange="getSelectedDesignerAttendValue();">'// 
														+ '<option value="Y" selected="selected">Y</option>'//
														+ '<option value="N" selected="selected">N</option>'//
														+ '<input type="hidden" id="designer-attend' + i + '"' + 'name="desAttend">'//desAttend 히든
														+ '</select>'// 
														+ '</td>';//
				}
				//조건에 따라 일반회원 참여 여부 셀렉트 박스 코드 추가
				if (designerConHistoryList[i].desAttend == "Y") {
					designerConHistoryUpdateFormCode += '<td>'// 
														+ '<select id="member-attend-select-box' + i + '"' + 'onChange="getSelectedMemberAttendValue();">'// 
														+ '<option value="Y" selected="selected">Y</option>'//
														+ '<option value="N">N</option>'//
														+ '</select>'//
														+ '<input type="hidden" id="member-attend' + i + '"' + 'name="memAttend">'//memAttend 히든
														+ '</td>';//
				} else if (designerConHistoryList[i].memAttend == "N") {//
					designerConHistoryUpdateFormCode += '<td>'// 
														+ '<select id="member-attend-select-box' + i + '"' + 'onChange="getSelectedMemberAttendValue();">'// 
														+ '<option value="Y" selected="selected">Y</option>'//
														+ '<option value="N" selected="selected">N</option>'//
														+ '</select>'//
														+ '<input type="hidden" id="member-attend' + i + '"' + 'name="memAttend">'//memAttend 히든
														+ '</td>';//
				}

				designerConHistoryUpdateFormCode += '</td>'//
													+ '<td>' + designerConHistoryList[i].state + '</td>'//
													+ '<td>' + '<button type="button" onclick="designerConHistoryUpdate('+ i + ');">수정</button>' + '</td>'//
													+ '</form>' + '</tr>';//
			}
												
			designerConHistoryUpdateFormCode += '</table>';
				//1. 태그 생성 끝
				
				//2. 태그 삽입
			$('#designer-conHistory-update-form-target').html(designerConHistoryUpdateFormCode);
				//2. 태그 삽입 끝
				
			//!!!!!페이징 추가!!!!!
		}
	});
}

//추후 수정




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
			<div class="modal-body" id="designer-conHistory-update-form-target">
			<!-- ajax로 태그 삽입 -->
			</div>
			<div class="modal-footer">
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