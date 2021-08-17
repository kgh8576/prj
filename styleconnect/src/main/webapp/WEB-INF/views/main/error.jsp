<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script type="text/javascript">

	$(function(){
		setTimeout(function(){
			location.href='main.do';
		}, 5000);
   });

</script>
<div align="center">
	<img src="${pageContext.request.contextPath}/resources/img/error.png" />
</div>
</html>