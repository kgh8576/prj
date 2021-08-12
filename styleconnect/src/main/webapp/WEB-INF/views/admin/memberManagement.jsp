<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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


<!-- 전체 페이지에서 사용하는 함수 -->
<script>
function goPageForEntirePage(page) {
	location.href = "memberManagement.do?page=" + page;
}
</script> 

 <!-- 모달1에서 사용하는 함수-->
<script>
//모달 페이지 이동 함수 
function goPageForModal1(id, page) {
	console.log("ID: " + id);	
	console.log("페이지: " + page);
	memberConHistoryUpdateForm(id, page);
}

//상담내역 수정을 위해 요구되는 value값을 각 폼의 hidden input에 삽입하는 함수
function getSelectedDesignerAttendValue(index){
	$('#designer-attend' + index).attr('value',$('#designer-attend-select-box' + index + ' option:selected').val());
	console.log($('#designer-attend' + index).val());
}

function getSelectedMemberAttendValue(index){
	$('#member-attend' + index).attr('value', $('#member-attend-select-box' + index + ' option:selected').val());
	console.log($('#member-attend' + index).val());
}

//모달 안 일반회원 상담 내역 수정 폼 태그 생성 함수
function memberConHistoryUpdateForm(id, page) {
	//memberConHistoryUpdateForm(id)로 실행할 경우 page는 null이 아닌 undefined가 되면서 실행 오류 발생
	if(page == undefined) {
		page = '';
	}

	$.ajax({
		url : "memberConHistoryUpdateForm.do?&memId="+ id + "&page=" + page,
		type : "GET",
		dataType: "json",
		success : function(data) {
			console.log(data);
			var memberConHistoryList = data.memberConHistoryList;
			var paging = data.paging;
			
			//모달 바디 안에 태그 삽입
				//1. 태그 생성
			var memberConHistoryUpdateFormCode ='';

			//코드 추후 수정 한다면: 
			//form을 list size만큼 생성하지 않고 
			//1. td와 select box에 인덱스 이용한 아이디를 주고 버튼 눌렀을 때 매개변수로 인덱스 값을 넘김
			//2. 아이디로 3개의 value값(conNo, desAttend, memAttend) 찾아서
			//3. ajax로 value값을 data로 생성해서 POST로 넘김
			for(var i = 0; i < memberConHistoryList.length; i++){
				memberConHistoryUpdateFormCode += '<form id="member-conHistory-update-form' + i + '"' + 'method="POST">'
													+ '<input type="hidden" id="consulting-no' + i + '"' + 'name="conNo" value="' + memberConHistoryList[i].conNo + '">'//conNo 히든
													+ '<input type="hidden" id="designer-attend' + i + '"' + 'name="desAttend" value="' + memberConHistoryList[i].desAttend + '">'//desAttend 히든
													+ '<input type="hidden" id="member-attend' + i + '"' + 'name="memAttend" value="' + memberConHistoryList[i].memAttend + '">'//memAttend 히든
													+ '</form>';
			}
			
			memberConHistoryUpdateFormCode += '<table>';//
			memberConHistoryUpdateFormCode += '<tr>'//
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
			
			for(var i = 0; i < memberConHistoryList.length; i++){
				memberConHistoryUpdateFormCode += '<tr>'
													+ '<td>' + memberConHistoryList[i].conNo + '</td>'//
													+ '<td>' + memberConHistoryList[i].desId + '</td>'//
													+ '<td>' + memberConHistoryList[i].memId + '</td>'//
													+ '<td>' + memberConHistoryList[i].day + '</td>'//
													+ '<td>' + memberConHistoryList[i].time + '</td>'//
													+ '<td>' + memberConHistoryList[i].title + '</td>'//
													+ '<td>' + memberConHistoryList[i].detail + '</td>'//
													+ '<td>' + memberConHistoryList[i].desComment + '</td>'//
													+ '<td>' + memberConHistoryList[i].memComment + '</td>';//
				//조건에 따라 디자이너 참여 여부 셀렉트 박스 코드 추가
				if (memberConHistoryList[i].desAttend == "Y") {
					memberConHistoryUpdateFormCode += '<td>'//
														+ '<select id="designer-attend-select-box' + i + '"' + 'onChange="getSelectedDesignerAttendValue('+ i + ');">'//
														+ '<option value="Y" selected="selected">Y</option>'//
														+ '<option value="N">N</option>'//
														+ '</select>'// 
														+ '</td>';//
				} else if (memberConHistoryList[i].desAttend == "N") {//
					memberConHistoryUpdateFormCode += '<td>'// 
														+ '<select id="designer-attend-select-box' + i + '"' + 'onChange="getSelectedDesignerAttendValue('+ i + ');">'// 
														+ '<option value="Y">Y</option>'//
														+ '<option value="N" selected="selected">N</option>'//
														+ '</select>'// 
														+ '</td>';//
				}
				//조건에 따라 일반회원 참여 여부 셀렉트 박스 코드 추가
				if (memberConHistoryList[i].memAttend == "Y") {
					memberConHistoryUpdateFormCode += '<td>'// 
														+ '<select id="member-attend-select-box' + i + '"' + ' onChange="getSelectedMemberAttendValue('+ i + ');">'// 
														+ '<option value="Y" selected="selected">Y</option>'//
														+ '<option value="N">N</option>'//
														+ '</select>'//
														+ '</td>';//
				} else if (memberConHistoryList[i].memAttend == "N") {//
					memberConHistoryUpdateFormCode += '<td>'// 
														+ '<select id="member-attend-select-box' + i + '"' + ' onChange="getSelectedMemberAttendValue('+ i + ');">'// 
														+ '<option value="Y" selected="selected">Y</option>'//
														+ '<option value="N" selected="selected">N</option>'//
														+ '</select>'//
														+ '</td>';//
				}

				memberConHistoryUpdateFormCode += '<td>' + memberConHistoryList[i].state + '</td>'//
													+ '<td>' + '<button type="button" onclick="memberConHistoryUpdate('+ i + ');">수정</button>' + '</td>'//
													+ '</tr>';//
			}
												
			memberConHistoryUpdateFormCode += '</table>';
				
			//페이지 네비게이션
			memberConHistoryUpdateFormCode += '<div class="pagination">'
												+ '<p onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.firstPageNo + ')" class="first">first</p>'
												+ '<p onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.prevPageNo + ')" class="prev">prev</p>'
												+ '<span>';
												
							
			for(var i=paging.startPageNo; i<=paging.endPageNo; i++){
				if(i == paging.pageNo){
					memberConHistoryUpdateFormCode += '<p onclick="goPageForModal1(' + "'" + id + "'" + ',' + i + ')" class="active">' + i + '</p>';
				} else {
					memberConHistoryUpdateFormCode += '<p onclick="goPageForModal1(' + "'" + id + "'" + ',' + i + ')">' + i + '</p>';
				}
			}

			memberConHistoryUpdateFormCode += '</span>'
												+ '<p onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.nextPageNo + ')" class="next">next</p>'
												+ '<p onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.finalPageNo + ')" class="last">last</p>'
												+ '</div>';		
			//1. 태그 생성 끝
				
				//2. 태그 삽입
			$('#member-conHistory-update-form-target').html(memberConHistoryUpdateFormCode);
				//2. 태그 삽입 끝
				
			//!!!!!페이징 추가!!!!!
		}
	});
}

// 일반회원 상담 내역 수정 함수
function memberConHistoryUpdate(index) {
	
	var formDataQueryString = $('#member-conHistory-update-form' + index).serialize();
	//console.log(formDataQueryString);
	//var formData = new FormData(form);
	
	//formData 확인
	//for (var value of formData.values()) {
	//	   console.log(value);
	//	}
	
	$.ajax({
		url : "memberConHistoryUpdate.do",
		type : "POST",
		data : formDataQueryString,
		success : function(result) {
			console.log(result.message);
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
		<td><button data-toggle="modal" data-target="#member-conHistory-update-modal" onclick="memberConHistoryUpdateForm('${member.id}')">상담내역 변경</button></td>
	</tr>
	</c:forEach>
	
</table>

<!-- 페이징 -->
<div align="center">
	<jsp:include page="pagingForEntirePage.jsp" flush="true">
		<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
		<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
		<jsp:param name="startPageNo" value="${paging.startPageNo}" />
		<jsp:param name="pageNo" value="${paging.pageNo}" />
		<jsp:param name="endPageNo" value="${paging.endPageNo}" />
		<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
		<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
	</jsp:include>
</div>

<!-- 상담내역 수정 모달 -->
<div class="modal fade" id="member-conHistory-update-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="member-conHistory-update-form-target">
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

