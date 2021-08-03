<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
			<!-- 1.(1)state가 예약확정 (2)현재시간으로부터 10분 후 이내면 버튼으로 변경 및 활성화-->
			<!-- 	1-1.버튼 클릭 DB update(state: 상담중) -->
			<!-- 2. 나머지 경우 state -->
			<!-- 서버 컴퓨터 하드코딩 괜찮은가... -->
			<!-- 제시간이 아니면 버튼 없이 state로만 표시 -->
</head>

<body>
<!--  
<h1>세션 값 확인</h1>
<h1>일반회원 아이디 : ${id}</h1>
<h1>디자이너 아이디 : ${did}</h1>
	<br><br><br><br>

			1.서비스 번호
			2.디자이너 이름
			3.상담 이름
			4.서비스 날짜
			5.서비스 시간
			6.상담 상세내용
			7.디자이너 코멘트
			8.상태 및 링크
	<div>
		<c:forEach var="conHistory" items="${conHistoryList}">

			1.${conHistory.conNo}
			2.${conHistory.desName}				
			3.${conHistory.title}
			4.${conHistory.day}
			5.${conHistory.time}
			6.${conHistory.detail}
			7.${conHistory.desComment}
					

			8.${conHistory.state}
			<a href="https://192.168.0.15:8443/chatting.do?conNo=${conHistory.conNo}">상담 참여</a>
				
			
			
			<div class="margin-bottom-30px box-shadow">
    			<div class="padding-30px background-white">
    				<h3>상담 이름: ${conHistory.desName}</h3><h3>상담 일시: ${conHistory.day} ${conHistory.time}</h3>
    				<hr>
    				<p class="text-grey-2">상담 상세내용: ${conHistory.detail}</p>
    				<p class="text-grey-2">디자이너 코멘트: ${conHistory.desComment}</p>
    				<p id="con-history-state" class="text-grey-2">상태: ${conHistory.state}</p>
    			</div>
    		</div>
    	</div>
    	
		</c:forEach>	
	
	
	<button id="test-button">시간계산 테스트</button>
	-->	


<!--  
<script>
//document 로드 시 
//container div의 첫째 자식 div 아이디 값을 리스트로 만듬
//첫째 자식 div 안에 있는 id가 con-history-day, con-history-time인 자식 태그의 값 가져옴
//시간 차이를 계산하고 조건 충족될 경우 해당 박스 안에 버튼 생성. 버튼 아이디 리스트 인덱스 이용함
//시간 차이 계산 함수, 파라미터: 서비스 데이, 서비스 타임
 document.getElementById("test-button").onclick = function calculateTimeDifference(){
	var currentDate = new Date();
	
	console.log(currentDate);
	 
	// 현재시간 
	var currentYear = currentDate.getFullYear();     // 연도
	var currentMonth = currentDate.getMonth()+1;     // 월(+1해줘야됨)                             
	var currentDay = currentDate.getDate();          // 일
	var currentHours = currentDate.getHours();       // 현재 시간
	var currentMinutes = currentDate.getMinutes();   // 현재 분

	// 비교시간
	
	//서비스데이(ex) 2021-08-03 00:00:00) 에서 데이와 타임의 구분
	//id값으로 가져옴: 부모태그의 차일드 중
	
	var serviceDay = '2021-08-03';
	//var comparedDate = serviceDay.split(" "); 
	//var comparedDay = comparedDate[0];
	//comparedDay = comparedDay.split("-");
	
	var comparedDay = serviceDay.split("-");
	var comparedYear = comparedDay [0];
	var comparedMonth = comparedDay [1];
	var comparedDay = comparedDay [2];

	var serviceTime='13:00';
	var comparedTime = serviceTime.split(":"); //id값으로 가져옴
	var comparedHours = comparedTime[0];
	var comparedMinutes = comparedTime[1];
	 
	var date1 = new Date(currentYear, currentMonth, currentDay, currentHours, currentMinutes); // 현재 
	var date2 = new Date(comparedYear, comparedMonth, comparedDay, comparedHours, comparedMinutes); // 파라미터
	   
	var elapsedMSec = date2.getTime() - date1.getTime(); 
	var elapsedMin = elapsedMSec / 1000 / 60; 
	 
	elapsedMin = parseInt(elapsedMin);    // 정수 표기를 위해 parseInt 
	
	console.log("테스트 실행");
	console.log(elapsedMin);
	
	return elapsedMin;
}

</script>
-->	
</body>
</html>