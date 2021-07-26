<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 분야선택>디자이너 목록 페이지 (doctor-layout-1.html#)</title>
</head>
<body>

<c:forEach items="${cut}" var="vo">
	${vo.name} 디자이너 <br/>
	${vo.major }<br/>
	${vo.number }
	
</c:forEach>

</body>
</html>