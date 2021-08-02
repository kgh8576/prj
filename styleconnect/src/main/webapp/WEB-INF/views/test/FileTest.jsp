<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<form method="post" action="uploadTest.do" enctype="multipart/form-data">
	  <div>
	    file : <input type="file" name="file">
	  </div>
  	<input type="submit">
  	
  	<img alt="실패중" src="${pageContext.request.contextPath}">
</form>
</body>
</html>