<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//삭제 버튼 ajax
	function deletes(target, desId){
		$.ajax({
			data:{conNo:target},
			url:'reviewDelete.do',
			type:'post',
			success:function(result){
				alert('삭제했습니다. 돌아갑니다');
				location.href = 'reviewList.do?desId='+desId;
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	// 수정 버튼은 form으로 페이지가 넘어가도록
	function modify(){
		$('#modifyFrm').submit();
	}
	// 돌아가기 버튼
	function back(desId){
		location.href='reviewList.do?desId='+desId;
	}
	
</script>
</head>
<body>
<br><br><br>
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div align="right" style="border-bottom: 1px solid black;">
			<c:if test="${id eq reviewInfo.memId }">
				<button class="btn btn-info" onclick="deletes('${reviewInfo.conNo}', '${reviewInfo.desId }')">삭제</button>
				<button class="btn btn-info" onclick="modify()">수정</button>
				<form action="reviewModify.do" id="modifyFrm" method="post">
					<input type="hidden" name="conNo" value="${reviewInfo.conNo }">
					<input type="hidden" name="memId" value="${reviewInfo.memId }">
				</form>
			</c:if>
			<br>
		</div>
		<br><br>
		<div class="rating clearfix">
			<ul class="float-left">
				<c:forEach begin="1" end="${reviewInfo.rate }">
					<li class="active"></li>
				</c:forEach>
				<c:forEach begin="${reviewInfo.rate+1}" end="5">
					<li></li>
				</c:forEach>
			</ul>
			<p align="right" style="color: grey;">${reviewInfo.stringwDate }&emsp;&emsp;&emsp; ${reviewInfo.memId }</p>
		</div>

		<div>
			<h3>${reviewInfo.reviewTitle }</h3>
			<hr>
			${reviewInfo.contents}
		</div>
		<div align="center">
			<br><button class="btn btn-info" onclick="back('${reviewInfo.desId}')">돌아가기</button>
		</div>
	</div>
		
	<div class="col-md-3"></div>
</div>
</body>
</html>