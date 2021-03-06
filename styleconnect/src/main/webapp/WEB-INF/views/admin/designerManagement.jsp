<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

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

.modal-lg {
    max-width: 90%;
}

#entire-container-for-width{
width:70%;
}

td {
text-align:center;
}  

#designer-id-search-container-in-entire-page {
text-align:left;
margin:10px;
}

#consulting-history-number-search-container-in-modal1 {
text-align:left;
margin:10px;
}    

#pagination span{
margin:10px;
}

.active {
color: #584ccb;
font-weight:bold;
}

#designer-id-search-button, 
#designer-consulting-history-list-select-button, #designer-consulting-history-update-button,
#designer-state-select-button, #designer-state-update-button,
#back-button, #consulting-history-number-search-button{
background-color:#584ccb;
color:white;
border-radius:5px;
padding:5px;
border:0;
margin:2px;
}

</style>




<!-- 전체 페이지에서 사용하는 함수 -->
<script>
//전체 페이지 이동 함수
function goPageForEntirePage(page) {
	location.href = "designerManagement.do?page=" + page;
}

//전체 페이지에서 디자이너 ID로 검색하여 디자이너 목록 조회
function designerIDSearch(){
	var searchedID = $('#designer-id-search-box').val();
	location.href= "designerManagement.do?searchedID=" + searchedID;
}

</script>


<!-- 모달1에서 사용하는 함수-->
<script>
//모달 페이지 이동 함수 
function goPageForModal1(id, page) {
	designerConHistoryUpdateForm(id, page);
}

//모달 페이지에서 상담번호로 검색하여 상담 내역조회
function conHistoryNoSearch(id){
	var page;
	var searchedConNo = $('#consulting-history-number-search-box').val();
	
	designerConHistoryUpdateForm(id, page, searchedConNo);
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

//모달 안 폼 태그 생성 함수
function designerConHistoryUpdateForm(id, page, searchedConNo) {
	//designerConHistoryUpdateForm(id)로 실행할 경우 page와 searchedConHistoryNo는 null이 아닌 undefined가 되면서 실행 오류 발생
	if(page == undefined) {
		page = '';
	}
	
	if(searchedConNo == undefined) {
		searchedConNo = '';
	}

	$.ajax({
		url : "designerConHistoryUpdateForm.do?desId="+ id + "&page=" + page + "&searchedConNo=" + searchedConNo,
		type : "GET",
		dataType: "json",
		success : function(data) {
			var designerConHistoryList = data.designerConHistoryList;
			var paging = data.paging;
			

			
			//모달 바디 안에 태그 삽입
				//1. 태그 생성
			var designerConHistoryUpdateFormCode ='';
			
				//검색창
			designerConHistoryUpdateFormCode += '<div id="consulting-history-number-search-container-in-modal1">'
												+ '<input type="text" id="consulting-history-number-search-box" placeholder="상담번호 검색"></input>'
												+ '<button type="button" id="consulting-history-number-search-button" onclick="conHistoryNoSearch(' + "'" + id + "'" + ')">검색</button>'
											+ '</div>';
				//검색창 끝

				//if: 검색 결과가 없을 때와 있을 때를 구분
			if(designerConHistoryList.length == 0 ){
				designerConHistoryUpdateFormCode += '<div align="center">'
				//검색 결과 메세지
				designerConHistoryUpdateFormCode += '<p>조회 결과가 없습니다.</p>';
				//'뒤로'버튼
				if(searchedConNo != null && searchedConNo != ''){
					designerConHistoryUpdateFormCode += '<button type="button" id="back-button" onclick="designerConHistoryUpdateForm(' + "'" + id + "'," + page + ');">뒤로</button>';
				}
				
			
				designerConHistoryUpdateFormCode += '</div>';
			} else {		

						//받아온 데이터의 null 처리(처리하지 않을 시 DB에서 null인 경우 null 문자가 그대로 출력됨)
				for(var i = 0; i< designerConHistoryList.length; i++){
					for(var key in designerConHistoryList[i]){
						designerConHistoryList[i][key] = nullReplace(designerConHistoryList[i][key]);
					}
				}
						//null 처리 끝
						
						//코드 비효율적임. 추후 수정 시: 
						//form을 list size만큼 생성하지 않고 
						//1. 버튼 눌렀을 때 매개변수로 인덱스 값을 넘기고
						//2. 넘긴 인덱스로 3개의 value값(conNo, desAttend, memAttend) 찾아서
						//3. ajax로 value값 GET으로 넘기거나 data생성해서 POST로 넘김
					
						//폼 데이터를 만들기 위한 폼
				for(var i = 0; i < designerConHistoryList.length; i++){
					designerConHistoryUpdateFormCode += '<form id="designer-conHistory-update-form' + i + '"' + 'method="POST">'
														+ '<input type="hidden" id="consulting-no' + i + '"' + 'name="conNo" value="' + designerConHistoryList[i].conNo + '">'//conNo 히든
														+ '<input type="hidden" id="designer-attend' + i + '"' + 'name="desAttend" value="' + designerConHistoryList[i].desAttend + '">'//desAttend 히든
														+ '<input type="hidden" id="member-attend' + i + '"' + 'name="memAttend" value="' + designerConHistoryList[i].memAttend + '">'//memAttend 히든
														+ '</form>';
				}
						//폼 데이터를 만들기 위한 폼 끝	
				
						//테이블
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
					designerConHistoryUpdateFormCode += '<tr>'
														+ '<td>' + designerConHistoryList[i].conNo + '</td>'//
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
															+ '<select id="designer-attend-select-box' + i + '"' + 'onChange="getSelectedDesignerAttendValue('+ i + ');">'//
																+ '<option value="Y" selected="selected">Y</option>'//
																+ '<option value="N">N</option>'//
															+ '</select>'// 
															+ '</td>';//
					} else if (designerConHistoryList[i].desAttend == "N") {//
						designerConHistoryUpdateFormCode += '<td>'// 
															+ '<select id="designer-attend-select-box' + i + '"' + 'onChange="getSelectedDesignerAttendValue('+ i + ');">'// 
																+ '<option value="Y">Y</option>'//
																+ '<option value="N" selected="selected">N</option>'//
															+ '</select>'// 
															+ '</td>';//
					}
							//조건에 따라 일반회원 참여 여부 셀렉트 박스 코드 추가
					if (designerConHistoryList[i].memAttend == "Y") {
						designerConHistoryUpdateFormCode += '<td>'// 
															+ '<select id="member-attend-select-box' + i + '"' + ' onChange="getSelectedMemberAttendValue('+ i + ');">'// 
																+ '<option value="Y" selected="selected">Y</option>'//
																+ '<option value="N">N</option>'//
															+ '</select>'//
															+ '</td>';//
					} else if (designerConHistoryList[i].memAttend == "N") {//
						designerConHistoryUpdateFormCode += '<td>'// 
															+ '<select id="member-attend-select-box' + i + '"' + ' onChange="getSelectedMemberAttendValue('+ i + ');">'// 
																+ '<option value="Y" selected="selected">Y</option>'//
																+ '<option value="N" selected="selected">N</option>'//
															+ '</select>'//
															+ '</td>';//
					}
	
					designerConHistoryUpdateFormCode += '<td>' + designerConHistoryList[i].state + '</td>'//
														+ '<td>' + '<button type="button" id="designer-consulting-history-update-button" onclick="designerConHistoryUpdate('+ i + ');">수정</button>' + '</td>'//
														+ '</tr>';//
				}
													
				designerConHistoryUpdateFormCode += '</table>';
						//테이블 끝
						
						//'뒤로'버튼
				if(searchedConNo != null && searchedConNo !=''){	
					designerConHistoryUpdateFormCode += '<div align="center">';
					designerConHistoryUpdateFormCode += '<button type="button" id="back-button" onclick="designerConHistoryUpdateForm(' + "'" + id + "'," + page + ');">뒤로</button>';
					designerConHistoryUpdateFormCode += '</div>';
				}
						
				
						//페이지 네비게이션
				designerConHistoryUpdateFormCode += '<div id="pagination" align="center">'//
													+ '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.firstPageNo + ')" class="first">first</span>'//
													+ '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.prevPageNo + ')" class="prev">prev</span>';//
													
								
				for(var i=paging.startPageNo; i<=paging.endPageNo; i++){
					if(i == paging.pageNo){
						designerConHistoryUpdateFormCode += '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + i + ')" class="active">' + i + '</span>';//
					} else {
						designerConHistoryUpdateFormCode += '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + i + ')">' + i + '</span>';//
					}
				}
	
				designerConHistoryUpdateFormCode += '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.nextPageNo + ')" class="next">next</span>'//
													+ '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.finalPageNo + ')" class="last">last</span>'//
												+ '</div>';//
						//페이지 네비게이션 끝
			}
							
				//2. 태그 생성 끝			
				//3. 태그 삽입
			$('#designer-conHistory-update-form-target').html(designerConHistoryUpdateFormCode);
				//3. 태그 삽입 끝

			
		}
	});
}

// 디자이너 상담 내역 수정 함수
function designerConHistoryUpdate(index) {
	console.log('실행 체크');
	
	var formDataQueryString = $('#designer-conHistory-update-form' + index).serialize();
	//console.log(formDataQueryString);
	//var formData = new FormData(form);
	
	//formData 확인
	//for (var value of formData.values()) {
	//	   console.log(value);
	//	}
	
	$.ajax({
		url : "designerConHistoryUpdate.do",
		type : "POST",
		data : formDataQueryString,
		success : function(result) {
			window.alert(result.message);
		}
	});
}
</script>

<!-- 모달2에서 사용하는 함수 -->
<script>
function designerStateUpdateForm(id) {
	
	$.ajax({
		url : "designerStateUpdateForm.do?desId="+ id,
		type : "GET",
		dataType: "json",
		success : function(data) {
			var designerStateOne = data.designerStateOne;
			var designerCertificationFileList = data.designerCertificationFileList;

			
			//받아온 데이터의 null 처리(처리하지 않을 시 DB에서 null인 경우 null 문자가 그대로 출력됨)
			for(var key in designerStateOne){
				designerStateOne[key] = nullReplace(designerStateOne[key]);
			}
			
			for(var i = 0; i< designerCertificationFileList.length; i++){
				for(var key in designerCertificationFileList[i]){
					designerCertificationFileList[i][key] = nullReplace(designerCertificationFileList[i][key]);
				}
			}
			//null처리 끝
			
			//모달 바디 안에 태그 삽입
				//1. 태그 생성
					//테이블
			var designerStateUpdateFormCode ='';//
			designerStateUpdateFormCode += '<table>';//
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td>ID</td>'//
											+ '<td>' + designerStateOne.id + '</td>';//
			designerStateUpdateFormCode += '</tr>';//
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td>이름</td>'//
											+ '<td>' + designerStateOne.name + '</td>';//
			designerStateUpdateFormCode += '</tr>';//
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td>성별</td>'//
											+ '<td>' + designerStateOne.gender + '</td>';//
			designerStateUpdateFormCode += '</tr>';//
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td>생년월일</td>'//
											+ '<td>' + designerStateOne.birth + '</td>';//
			designerStateUpdateFormCode += '</tr>';//
			designerStateUpdateFormCode += '<td>휴대폰 번호</td>'//
											+ '<td>' + designerStateOne.hp + '</td>';//
			designerStateUpdateFormCode += '</tr>';//
			designerStateUpdateFormCode += '<td>근무처</td>'//
											+ '<td>' + designerStateOne.location + '</td>';//
			designerStateUpdateFormCode += '</tr>';//
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td>경력</td>'//
											+ '<td>' + designerStateOne.career + '</td>';//
			designerStateUpdateFormCode += '</tr>';//
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td>분야</td>'//
											+ '<td>' + '메이크업: ' + designerStateOne.makeupyn//
													+ '컷: ' + designerStateOne.cutyn// 
													+ '펌: ' + designerStateOne.permyn//
													+ '염색: ' + designerStateOne.dyeyn + '</td>';//
			designerStateUpdateFormCode += '</tr>';//
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td>전문</td>'//
											+ '<td>' + designerStateOne.major + '</td>';//
			designerStateUpdateFormCode += '</tr>';//
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td rowspan="' + (designerCertificationFileList.length + 1) +'">증명 자료</td>';//
			
			for(var i = 0; i < designerCertificationFileList.length; i++){
				designerStateUpdateFormCode += '<tr>';//
				designerStateUpdateFormCode += '<td>'// 
												+ '<img src="${pageContext.request.contextPath}/resources/img/' + designerCertificationFileList[i].fileUuid + '">' + designerCertificationFileList[i].fileName// 
												+ '</td>';//
				designerStateUpdateFormCode += '</tr>';//
			}
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td>상태</td>'//
				
			//조건에 따라 디자이너 참여 여부 셀렉트 박스 코드 추가
			if (designerStateOne.state == "신청") {
				designerStateUpdateFormCode += '<td>'//
												+ '<select id="designer-state-select-box">'//
													+ '<option value="신청" selected="selected">신청</option>'//
													+ '<option value="반려">반려</option>'//
													+ '<option value="승인">승인</option>'//
													+ '<option value="탈퇴">탈퇴</option>'//
													+ '<option value="휴면">휴면</option>'//
												+ '</select>'// 
												+ '</td>';//
			} else if (designerStateOne.state == "반려") {
				designerStateUpdateFormCode += '<td>'//
												+ '<select id="designer-state-select-box">'//
													+ '<option value="신청">신청</option>'//
													+ '<option value="반려" selected="selected">반려</option>'//
													+ '<option value="승인">승인</option>'//
													+ '<option value="탈퇴">탈퇴</option>'//
													+ '<option value="휴면">휴면</option>'//
												+ '</select>'// 
												+ '</td>';//
			} else if (designerStateOne.state == "승인") {
				designerStateUpdateFormCode += '<td>'//
												+ '<select id="designer-state-select-box">'//
													+ '<option value="신청" >신청</option>'//
													+ '<option value="반려">반려</option>'//
													+ '<option value="승인" selected="selected">승인</option>'//
													+ '<option value="탈퇴">탈퇴</option>'//
													+ '<option value="휴면">휴면</option>'//
												+ '</select>'// 
												+ '</td>';//
			} else if (designerStateOne.state == "탈퇴") {
				designerStateUpdateFormCode += '<td>'//
												+ '<select id="designer-state-select-box">'//
													+ '<option value="신청" >신청</option>'//
													+ '<option value="반려">반려</option>'//
													+ '<option value="승인">승인</option>'//
													+ '<option value="탈퇴" selected="selected">탈퇴</option>'//
													+ '<option value="휴면">휴면</option>'//
												+ '</select>'// 
												+ '</td>';//
			} else if (designerStateOne.state == "휴면") {
				designerStateUpdateFormCode += '<td>'//
												+ '<select id="designer-state-select-box">'//
													+ '<option value="신청" >신청</option>'//
													+ '<option value="반려">반려</option>'//
													+ '<option value="승인">승인</option>'//
													+ '<option value="탈퇴" >탈퇴</option>'//
													+ '<option value="휴면" selected="selected">휴면</option>'//
												+ '</select>'// 
												+ '</td>';//
			}
			designerStateUpdateFormCode += '</tr>';//
											
			designerStateUpdateFormCode += '<tr>';//
			designerStateUpdateFormCode += '<td>관리자 코멘트</td>';//
			designerStateUpdateFormCode += '<td><textarea id="designer-comments-textarea" name="comments">' + designerStateOne.comments + '</textarea></td>';//
			designerStateUpdateFormCode += '</tr>';//
			
			designerStateUpdateFormCode += '</table>';//
			designerStateUpdateFormCode += '<div align="center">' 
											+ '<button type="button" id="designer-state-update-button" onclick="designerStateUpdate('+ "'" + designerStateOne.id + "'" +');">수정</button>'//
										+ '</div>'//
					//테이블 끝
					
				//1. 태그 생성 끝
				
				//2. 태그 삽입
			$('#designer-state-update-form-target').html(designerStateUpdateFormCode);
				//2. 태그 삽입 끝
			
		}
	});
	
}

function designerStateUpdate(id) {
	var id = id;
	var state = $('#designer-state-select-box option:selected').val();
	var comments = $('#designer-comments-textarea').val();
	console.log("상태: " + state);
	console.log("코멘트: " + comments);
	
	$.ajax({
		url : "designerStateUpdate.do",
		type : "POST",
		data : {
			"id" : id,
			"state" : state,
			"comments" : comments
		},
		success : function(result) {
			window.alert(result.message);
		}
	});
}

</script>

<!-- 데이터 처리 함수 -->
<script>
// null 데이터 치환 함수
// "", " ", null, undefined, {}, [] 도 NULL이라고 봄
function nullReplace(data) {
    if(typeof(data) === 'object'){
        if(JSON.stringify(data) === '{}' || JSON.stringify(data) === '[]'){
            return "";
        }else if(!data){
            return "";
        }
        return data;
    }else if(typeof(data) === 'string'){
        if(!data.trim()){
            return "";
        }
        return data;
    }else if(typeof(data) === 'undefined'){
        return "";
    }else{
        return data;
    }
}
</script>





<br><br><br><br><br>
<!-- 디자이너 관리 페이지 -->
<div align="center">
	<div id="entire-container-for-width">
		<!-- 검색창 -->
		<div id="designer-id-search-container-in-entire-page">
			<input type="text" id="designer-id-search-box" placeholder="디자이너 ID 검색"></input>
			<button type="button" id="designer-id-search-button" onclick="designerIDSearch()">검색</button>
		</div>


<!-- 디자이너 리스트 -->
	<c:if test="${fn:length(designerList) == 0 }">
			<div style="margin: 100px;"><p>조회 결과가 없습니다.</p></div>
			<button type="button" id="back-button" onclick="location.href='javascript:history.back();'">뒤로</button>
	</c:if>
	
	<c:if test="${fn:length(designerList) != 0 }">
		<table>
			<tr>
				<td>ID</td>
				<td>이름</td>
				<td>성별</td>
				<td>생년월일</td>
				<td>휴대폰 번호</td>
				<td>근무처</td>
				<td>분야</td>
				<td>전문</td>
				<td>상태</td>
				<td>가입일</td>
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
				<td>메이크업: ${designer.makeupyn}<br>
					컷: ${designer.cutyn}<br>
					펌: ${designer.permyn}<br>
					염색: ${designer.dyeyn}</td>
				<td>${designer.major}</td>
				<td>${designer.state}</td>
				<td>${designer.regday}</td>
				<td><button id="designer-consulting-history-list-select-button" data-toggle="modal" data-target="#designer-conHistory-update-modal" onclick="designerConHistoryUpdateForm('${designer.id}')">상담내역 변경</button>
					<button id="designer-state-select-button" data-toggle="modal" data-target="#designer-state-update-modal" onclick="designerStateUpdateForm('${designer.id}')">회원상태 변경</button>
				</td>
			</tr>
			</c:forEach>
			
		</table>

		<c:if test = "${param.searchedID != '' && param.searchedID != null }">
			<button type="button" id="back-button" onclick="location.href='javascript:history.back();'">뒤로</button>
		</c:if>
	</c:if>
	
	</div>
	<!-- 전체 페이지의 페이지 네비게이션 -->
<div id="pagination" align="center">
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
</div>



<!-- 모달1: 상담내역 수정 모달 -->
<div class="modal fade" id="designer-conHistory-update-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
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

<!-- 모달2: 회원 상태 수정 모달 -->
<div class="modal fade" id="designer-state-update-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"><!-- 모달 타이틀 --></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="designer-state-update-form-target">
			<!-- ajax로 태그 삽입 -->
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>






