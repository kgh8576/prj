<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br><br><br><br><br><br><br><br><br><br>
<h1>일반회원 관리 페이지</h1>

<table>
	<tr>
		<td>회원ID</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>성별</td>
		<td>생년월일</td>
		<td>휴대폰 번호</td>
		<td>적립금</td>
		<td>가입일</td>
		<td>처리</td>
	</tr>
	<c:forEach var="member" items="${memberList }">
	<tr>
		<td>${member.id}</td>
		<td>${member.pw}</td>
		<td>${member.name}</td>
		<td>${member.gender}</td>
		<td>${member.birth}</td>
		<td>${member.hp}</td>
		<td>${member.point}</td>
		<td>${member.regday}</td> <!-- 형식 변경 -->
		<td>수정/삭제</td>
	</tr>
	</c:forEach>
	
	<!-- 페이징 추가 -->
</table>

