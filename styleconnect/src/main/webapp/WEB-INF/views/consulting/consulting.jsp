<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 


<!-- 1.(1)state가 예약확정 (2)현재시간으로부터 10분 후 이내면 버튼으로 변경 및 활성화-->
<!-- 	1-1.버튼 클릭 DB update(state: 상담중) -->
<!-- 2. 나머지 경우 state -->
<!-- 서버 컴퓨터 하드코딩 괜찮은가... -->
<!-- 제시간이 아니면 버튼 없이 state로만 표시 -->
<!-- 테스트 주석 -->

<style>
.note {
	color:red;
}
</style>

<script>
function goChatting(conNo) {
	//ajax 사용할지 페이지 이동할지 아니면 새로운 페이지를 띄울지 결정
	window.location.href = 'https://192.168.0.15:8443/chatting.do?conNo=' + conNo;
	
	$.ajax({
		url:'conHistoryAttendUpdate.do',
		type:'POST',
		data: {
			conNo : conNo
		},
		success:function(){
			console.log('success');
		},error:function(r){
			console.log('fail');
		}
	});
}
</script>			

<h1>세션 값 확인</h1>
<h1>일반회원 아이디 : ${id}</h1>
<h1>디자이너 아이디 : ${did}</h1>
	<br><br><br><br>

<div align="center">

	<c:if test="${fn:length(conHistoryList)==0}">
		<div style="width:70%">
			<p>참여할 수 있는 상담이 없습니다.</p>
		</div>
	</c:if>
	
	<c:if test="${fn:length(conHistoryList)!=0}">	
		<c:forEach var="conHistory" items="${conHistoryList}">
		
		<div style="width:70%;" >
			<div class="margin-bottom-30px box-shadow">
	    		<div class="padding-30px background-white">
	    			<div>
			    		<div><h3>상담 번호: ${conHistory.conNo}</h3></div>
			    		<div><h3>상담 일시: ${conHistory.day} ${conHistory.time}</h3></div>
			    		<div><h3>상담 이름: ${conHistory.desName}</h3></div>
	    			</div>
		    		<p class="text-grey-2">상담 상세내용: ${conHistory.detail}</p>
		    		<p class="text-grey-2">디자이너 코멘트: ${conHistory.desComment}</p>
		    		<p class="text-grey-2">상태: ${conHistory.state}</p>
	    		
					<!-- 남은 시간 
		    		<h1>남은 시간</h1>
		    		<c:out value="${conHistory.remainingTime}" />
		    		-->
		    		
		    		<c:if test = "${conHistory.remainingTime le -30 || conHistory.remainingTime ge 10}">
		    			<p><span class="note">*</span>상담시간 10분 전부터 상담 참여 가능합니다.</p>
		    		</c:if>
		    		<!-- 하드코딩? 원본코드: (${conHistory.remainingTime}>-30 || ${conHistory.remainingTime}<=10)-->
		    		<c:if test = "${conHistory.remainingTime ge -30 && conHistory.remainingTime le 10}">
		    			<!-- 공통 코드 참조해서 상담중으로 update -->
		    			<!-- document.get~ 으로 사용하면 보다 쉽게 페이지에서 동작하는 함수를 알 수 있으나 일단 걍 만듦 -->
		    			<button type="button" onclick="goChatting(${conHistory.conNo});">상담 참여 생성 테스트</button>
		    		</c:if>
		    		
		    	</div>
		    </div>
	    </div>
	    <hr>	
		</c:forEach>
</c:if>
</div>
	