<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
	<br>
	<br>
	<form method="post" action="uploadTest.do" enctype="multipart/form-data">
	  <div>
	    file : <input type="file" name="file" multiple="multiple" >
	  </div>
	  	<input type="submit">
	  	<br>
	  	<img width="300" height="300" alt="실패중" src="${pageContext.request.contextPath}/resources/img/202108215144418-1.png">
	  	
	</form>
	<br><br><br>
	<img width="300" height="300" alt="실패중" src="${pageContext.request.contextPath}/resources/img/${uuid.fileUuid}">
	
	<form action="" id = "frm">
		<input type="text" id = "id" name = "name" value="">
	</form>
		<button onclick="test()"></button>
</body>
</html>