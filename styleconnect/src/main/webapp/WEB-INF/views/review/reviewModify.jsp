<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	function insert(){
		var contents = CKEDITOR.instances.content.getData();
		$.ajax({
			url:'reviewUpdate.do',
			type:'post',
			data:{
				conNo : 
				contents : contents
			},
			success : function(result) {
				alert('정상 수정 됨');
			},
			error : function(err) {
				console.log(err);
			}
			
		});
	}
</script>
</head>
<body>
<div class="container-fluid">
<div class="row">
	
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="margin-bottom-30px box-shadow">
	        <div class="padding-30px background-white">
	            <h3> 제목 </h3> <input id="title" class="form-control" placeholder="제목을 입력하세요" type="text">
	        </div>
	    </div>
	    <div class="margin-bottom-30px box-shadow">
	        <div class="padding-30px background-white">
	            <h3> 내용 </h3>
	            <textarea class="form-control" id="contents" name="contents"></textarea>
				<script type="text/javascript">
				 CKEDITOR.replace('contents'
				                , {height: 500,
				                	filebrowserUploadUrl: 'upload.do' 
				                 });
				</script>
	        </div>
	    </div>
	</div>
	<div class="col-lg-3"></div>
</div>

</div>
</body>
</html>