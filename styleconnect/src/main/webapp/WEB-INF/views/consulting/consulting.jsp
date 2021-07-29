<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<br><br><br><br>
	<table>
		<tr>
			<!-- conNo로 룸넘버 주기 어차피 서버 연결해야되니까 서버간 데이터 전송시킴??-->
			<td>${conHistoryList[0].conNo }</td> <td><a href="https://192.168.0.15:3000">상담 테스트</a></td>
			<td>${conHistoryList[1].conNo }</td> <td><a href="https://192.168.0.15:3000">상담 테스트</a></td>
		</tr>
	</table>
</body>
</html>