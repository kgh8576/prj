<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.multi{
    width: 73px;
    padding-top: 0px;
    padding-bottom: 0px;
    padding-right: 0px;
    padding-left: 0px;
    margin-left: 20px;
	}

	
</style>
<script	src="${pageContext.request.contextPath}/resources/assets/js/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>

<script type="text/javascript">

	
</script>



</head>

<body>
	
	<br>
	<br>
	<form method="post" action="uploadTest.do" enctype="multipart/form-data">
		<input type="file" id="file" name="file" class="multi" />
		<br> 
		<input type="submit">
	</form>
	<br>
	<br>
	<br>
</body>
</html>