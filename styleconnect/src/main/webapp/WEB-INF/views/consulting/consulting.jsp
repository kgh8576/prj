<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!-- 1.(1)state가 예약확정 (2)현재시간으로부터 10분 후 이내면 버튼으로 변경 및 활성화-->
<!-- 	1-1.버튼 클릭 DB update(state: 상담중) -->
<!-- 2. 나머지 경우 state -->
<!-- 서버 컴퓨터 하드코딩 괜찮은가... -->
<!-- 제시간이 아니면 버튼 없이 state로만 표시 -->

<script>
function goChatting(conNo) {
	//window.location.href = "about:blank";
	console.log(conNo);
	
	$.ajax({
		url:'/conHistoryAttendUpdate.do?conNo=' + conNo,
		type:'GET',
		success:function(data){
			console.log('update ajax 성공', data);
		},error:function(error){
			console.log('update ajax 실패', error);
		}
	});
}
</script>			

<h1>세션 값 확인</h1>
<h1>일반회원 아이디 : ${id}</h1>
<h1>디자이너 아이디 : ${did}</h1>
	<br><br><br><br>
	<!--  
	<pre>
	1.서비스 번호
	2.디자이너 이름
	3.상담 이름
	4.서비스 날짜
	5.서비스 시간
	6.상담 상세내용
	7.디자이너 코멘트
	8.상태 및 링크
	</pre>
	-->		
	<c:forEach var="conHistory" items="${conHistoryList}">
	<!--  
	<pre>
	1.${conHistory.conNo}
	2.${conHistory.desName}				
	3.${conHistory.title}
	4.${conHistory.day}
	5.${conHistory.time}
	6.${conHistory.detail}
	7.${conHistory.desComment}
	8.${conHistory.state}
	</pre>
	-->				

	<div class="margin-bottom-30px box-shadow">
    	<div class="padding-30px background-white">
    		<h3>상담 번호: ${conHistory.conNo}</h3>
    		<h3>상담 이름: ${conHistory.desName}</h3>
    		<h3>상담 일시: ${conHistory.day} ${conHistory.time}</h3>
    		<hr>
    		<p class="text-grey-2">상담 상세내용: ${conHistory.detail}</p>
    		<p class="text-grey-2">디자이너 코멘트: ${conHistory.desComment}</p>
    		<p class="text-grey-2">상태: ${conHistory.state}</p>
    		
    		<!-- 1.(1)state가 예약확정 (2)현재시간으로부터 10분 후 이내면 버튼으로 변경 및 활성화-->
			<!-- 	1-1.버튼 클릭 DB update(state: 상담중) -->
			<!-- 2. 나머지 경우 state -->
			<!-- 서버 컴퓨터 하드코딩 괜찮은가... -->
			<!-- 제시간이 아니면 버튼 없이 state로만 표시 -->
    		<p class="text-grey-2">남은시간: ${conHistory.remainingTime}</p>
    		<p>*상담시간 10분 전부터 상담 참여 가능합니다.</p>
    		<!-- 하드코딩? 원본코드: &&(${conHistory.remainingTime}>-30 || ${conHistory.remainingTime}<10)-->
    		<c:if test = "${conHistory.state eq '예약확정' && (conHistory.remainingTime ge -30 || onHistory.remainingTime le 10) }">
    			<!-- 공통 코드 참조해서 상담중으로 update -->
    			<!-- document.get~ 으로 사용하면 보다 쉽게 페이지에서 동작하는 함수를 알 수 있으나 일단 걍 만듦 -->
    			<button onclick="goChatting(${conHistory.conNo});">상담 참여 생성 테스트</button>
    		</c:if>
    	</div>
    </div>
    <hr>	
	</c:forEach>	
	