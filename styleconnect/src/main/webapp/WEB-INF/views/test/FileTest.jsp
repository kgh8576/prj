<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
</head>
<body>
	<br>
	<br>
	<form method="post" action="uploadTest.do" enctype="multipart/form-data">
	  <div>
	  </div>
	  	<input type="submit">
	  	<br>
	  <br>
	  <input type="file" class="multi"/>
	  <br>
	</form>
	<br><br><br>
	
	<form action="" id = "frm">
		<input type="text" id = "id" name = "name" value="">
	</form>
		<button onclick="test()"></button>
	
	
</body>
</html>