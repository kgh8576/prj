<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

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

#member-id-search-container-in-entire-page {
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

#member-id-search-button, #member-consulting-history-update-button,
#member-consulting-history-list-select-button, #back-button, #consulting-history-number-search-button{
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
function goPageForEntirePage(page) {
	location.href = "memberManagement.do?page=" + page;
}

//전체 페이지에서 일반회원 ID로 검색하여 디자이너 목록 조회
function memberIDSearch(){
	var searchedID = $('#member-id-search-box').val();
	location.href= "memberManagement.do?searchedID=" + searchedID;
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

//모달 페이지에서 상담번호로 검색하여 상담 내역조회
function conHistoryNoSearch(id){
	var page;
	var searchedConNo = $('#consulting-history-number-search-box').val();
	
	memberConHistoryUpdateForm(id, page, searchedConNo);
}

//상담내역 수정을 위해 요구되는 value값을 각 폼의 hidden input에 삽입하는 함수
	//1.
function getSelectedDesignerAttendValue(index){
	$('#designer-attend' + index).attr('value',$('#designer-attend-select-box' + index + ' option:selected').val());
	console.log($('#designer-attend' + index).val());
}
	//2.
function getSelectedMemberAttendValue(index){
	$('#member-attend' + index).attr('value', $('#member-attend-select-box' + index + ' option:selected').val());
	console.log($('#member-attend' + index).val());
}

//모달 안 일반회원 상담 내역 수정 폼 태그 생성 함수
function memberConHistoryUpdateForm(id, page, searchedConNo) {
	//memberConHistoryUpdateForm(id)로 실행할 경우 page와 searchedConHistoryNo는 null이 아닌 undefined가 되면서 실행 오류 발생
	if(page == undefined) {
		page = '';
	}
	
	if(searchedConNo == undefined) {
		searchedConNo = '';
	}
	
	console.log("아이디: " + id);
	console.log("페이지: " + page);
	console.log("상담번호: " + searchedConNo);

	$.ajax({
		url : "memberConHistoryUpdateForm.do?&memId="+ id + "&page=" + page + "&searchedConNo=" + searchedConNo,
		type : "GET",
		dataType: "json",
		success : function(data) {
			console.log(data);
			var memberConHistoryList = data.memberConHistoryList;
			var paging = data.paging;
			
			
			
			//모달 바디 안에 태그 삽입
				//1. 태그 생성
			var memberConHistoryUpdateFormCode ='';
			
				//검색창
			memberConHistoryUpdateFormCode += '<div id="consulting-history-number-search-container-in-modal1">'
												+ '<input type="text" id="consulting-history-number-search-box" placeholder="상담번호 검색"></input>'
												+ '<button type="button" id="consulting-history-number-search-button" onclick="conHistoryNoSearch(' + "'" + id + "'" + ')">검색</button>'
											+ '</div>';
				//검색창 끝
			
				//if: 검색 결과가 없을 때와 있을 때를 구분
			if(memberConHistoryList.length == 0 ){
				memberConHistoryUpdateFormCode += '<div align="center">';
				//검색 결과 메세지
				memberConHistoryUpdateFormCode += '<p>조회 결과가 없습니다.</p>';
				//'뒤로'버튼
				memberConHistoryUpdateFormCode += '<button type="button" id="back-button" onclick="memberConHistoryUpdateForm(' + "'" + id + "'," + page + ');">뒤로</button>';
				
				memberConHistoryUpdateFormCode +='</div>';
			} else {

						//받아온 데이터의 null 처리(처리하지 않을 시 DB에서 null인 경우 null 문자가 그대로 출력됨)
				for(var i = 0; i< memberConHistoryList.length; i++){
					for(var key in memberConHistoryList[i]){
						memberConHistoryList[i][key] = nullReplace(memberConHistoryList[i][key]);
					}
				}
						//null 처리 끝

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
				
				
						//테이블
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
														+ '<td>' + '<button type="button" id="member-consulting-history-update-button" onclick="memberConHistoryUpdate('+ i + ');">수정</button>' + '</td>'//
														+ '</tr>';//
				}
													
				memberConHistoryUpdateFormCode += '</table>';//
						//테이블 끝
						
						//'뒤로'버튼
				if(searchedConNo != null && searchedConNo !=''){	
					memberConHistoryUpdateFormCode += '<button type="button" id="back-button"onclick="memberConHistoryUpdateForm(' + "'" + id + "'," + page + ');">뒤로</button>';
				}
						
						//페이지 네비게이션
				memberConHistoryUpdateFormCode += '<div id="pagination" align="center">'//
													+ '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.firstPageNo + ')" class="first">first</span>'//
													+ '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.prevPageNo + ')" class="prev">prev</span>';//
																
				for(var i=paging.startPageNo; i<=paging.endPageNo; i++){
					if(i == paging.pageNo){
						memberConHistoryUpdateFormCode += '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + i + ')" class="active">' + i + '</span>';//
					} else {
						memberConHistoryUpdateFormCode += '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + i + ')">' + i + '</span>';//
					}
				}
	
				memberConHistoryUpdateFormCode += '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.nextPageNo + ')" class="next">next</span>'//
												+ '<span onclick="goPageForModal1(' + "'" + id + "'" + ',' + paging.finalPageNo + ')" class="last">last</span>'//
											+ '</div>';//
					//페이지 네비게이션 끝
			}
			
			//1. 태그 생성 끝
				
				//2. 태그 삽입
			$('#member-conHistory-update-form-target').html(memberConHistoryUpdateFormCode);
				//2. 태그 삽입 끝
				
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
<div align="center">
	<div id="entire-container-for-width">
	<!-- 페이지명 쓸까-->
		<div id="member-id-search-container-in-entire-page">
			<input type="text" id="member-id-search-box" placeholder="일반회원 ID 검색"></input>
			<button type="button" id="member-id-search-button"onclick="memberIDSearch()">검색</button>
		</div>

		
		<!-- 일반회원 리스트 -->
		
			
			<c:if test="${fn:length(memberList) == 0 }">
				<p>검색 결과가 없습니다.</p>
				<button type="button" onclick="location.href='javascript:history.back();'">뒤로</button>
			</c:if>
			<c:if test="${fn:length(memberList) != 0 }">
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
					<td><button type="button" id="member-consulting-history-list-select-button" data-toggle="modal" data-target="#member-conHistory-update-modal" onclick="memberConHistoryUpdateForm('${member.id}')">상담내역 변경</button></td>
				</tr>
				</c:forEach>
				
				</table>
				<c:if test = "${param.searchedID != '' && param.searchedID != null }">
					<button type="button" id="back-button" onclick="location.href='javascript:history.back();'">뒤로</button>
				</c:if>
			</c:if>
		

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
</div>
		
		<!-- 상담내역 수정 모달 -->
		<div class="modal fade" id="member-conHistory-update-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel"><!-- 일반회원 상담내역 변경 --></h5>
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



