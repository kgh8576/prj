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

	.my_button {
		display: inline-block;
		width: 200px;
		text-align: center;
		padding: 10px;
		background-color: #006BCC;
		color: #fff;
		text-decoration: none;
		border-radius: 5px;
	}
	
	.imgs_wrap {
		border: 2px solid #A8A8A8;
		margin-top: 30px;
		margin-bottom: 30px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.imgs_wrap img {
		max-width: 150px;
		margin-left: 10px;
		margin-right: 10px;
	}
	.MultiFile-list{
		font-size: 20px;
    	margin-left: 20px;
    	margin-top: 20px;
	}
	
</style>
<script	src="${pageContext.request.contextPath}/resources/assets/js/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>

<script type="text/javascript">
$(function () {
	 $(".my_button").click(function () {
		 console.log("fileUploadAction");
		    $(".multi:eq(0)").click();
	})
	
})
	
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