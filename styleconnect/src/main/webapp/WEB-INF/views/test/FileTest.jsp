<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
	
	function test(date) {
		var testDate = date;
		var year = testDate.substring(0,4);
		var month = testDate.substring(5,7);
		var day = testDate.substring(8,10);
		var h = testDate.substring(11,13);
		var m = testDate.substring(14,16);
		var cancleDay = new Date(year, month*1-1, day, h, m);
		var today = new Date();
		if(today.getTime() > cancleDay.getTime()){
			console.log('취소안됩니다.');	
		}else{
			console.log('예약이 취소 됐습니다.');
		}
		
	}
	
	
</script>
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
		<button onclick="test('${date}')"></button>
</body>
</html>