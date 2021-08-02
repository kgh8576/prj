<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>


<script>
//시간 차이 계산 함수, 파라미터: 서비스 데이, 서비스 타임
function calculateTime(serviceDay, serviceTime){
	var currentDate = new Date();
	//Date 만들되 String인 값으로 만들기
	var serviceDate = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = year + '-' + month  + '-' + day;

	console.log(dateString);
	
	return null;
}

</script>

<body>
	<br><br><br><br>
	<table>
		<tr>
			<td>서비스 번호</td>
			<td>디자이너 이름</td>
			<td>상담 이름</td>
			<td>서비스 날짜</td>
			<td>서비스 시간</td>
			<td>상담 상세내용</td>
			<td>디자이너 코멘트</td>
			<td>상태</td>
			<td>링크</td>
		</tr>
		<c:forEach var="conHistory" items="${conHistoryList}" >
			<tr>
				<td>${conHistory.conNo}</td>
				<td>${conHistory.desName}</td>				
				<td>${conHistory.title}</td>
				<td>${conHistory.day}</td>
				<td>${conHistory.time}</td>
				<td>${conHistory.detail}</td>
				<td>${conHistory.desComment}</td>
				
				
				<!-- 1.(1)state가 예약확정 (2)현재시간으로부터 10분 후 이내면 버튼으로 변경 및 활성화-->
				<!-- 	1-1.버튼 클릭 DB update(state: 상담중) -->
				<!-- 2. 나머지 경우 state -->
				<td>${conHistory.state}
				<a href="https://192.168.0.15:8443/chatting.do?conNo=${conHistory.conNo}">상담 참여</a></td>
				

				
				<!-- 서버 컴퓨터 하드코딩 괜찮은가... -->
				<td></td>
				
				<!-- 제시간이 아니면 버튼 없이 state로만 표시 -->
			</tr>
		</c:forEach>
	</table>
</body>
</html>