<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과 </title>
</head>
<body>
<c:forEach items="${search}" var="vo">
 ${vo.name }
		
</c:forEach>
</body>
</html>