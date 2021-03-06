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
<style>

.rating {
    display: flex;
    flex-direction: row-reverse;
    justify-content: center
}

.rating>input {
    display: none;
}

.rating>label {
    position: relative;
    width: 1em;
    font-size: 1.5vw;
    color: #FFD600;
    cursor: pointer
}

.rating>label::before {
    content: "\2605";
    position: absolute;
    opacity: 0
}

.rating>label:hover:before,
.rating>label:hover~label:before {
    opacity: 1 !important
}

.rating>input:checked~label:before {
    opacity: 1
}

.rating:hover>input:checked~label:before {
    opacity: 0.4
}


</style>
<script>
	$(function(){
		$('#title').val($('#hiddenReviewTitle').val());
		if ($('#hiddenRate').val() == 1) {
			$("input:radio[name='rate']:radio[value='1']").prop('checked', true); // 선택하기
		} else if ($('#hiddenRate').val() == 2) {
			$("input:radio[name='rate']:radio[value='2']").prop('checked', true); // 선택하기
		} else if ($('#hiddenRate').val() == 3) {
			$("input:radio[name='rate']:radio[value='3']").prop('checked', true); // 선택하기
		} else if ($('#hiddenRate').val() == 4) {
			$("input:radio[name='rate']:radio[value='4']").prop('checked', true); // 선택하기
		} else if ($('#hiddenRate').val() == 5) {
			$("input:radio[name='rate']:radio[value='5']").prop('checked', true); // 선택하기
		}
		
	});
	function getTextLength(str){ // 한글은 2바이트 계산해주는 함수
		var len = 0;
		for (var i = 0; i < str.length; i++){
			if (escape(str.charAt(i)).length == 6){
				len++;
				
			}
			len++;
		}
		return len;
	}
	
	function modify(conNo){
		var contents = CKEDITOR.instances.contents.getData();
		if (getTextLength(contents) <= 20){ // 20바이트 이하이면
			alert('최소 20바이트 ( 한글 10자 ) 이상 작성해주세요');
			return false;
		}
		
		var rate = document.querySelector('input[name="rate"]:checked').value;
		var title = $('#title').val();
		
		if (contents == ''){
			alert('내용을 입력하세요');
			return false;
		}
		if (title == ''){
			alert('제목을 입력하세요');
			return false;
		}
		
		$.ajax({
			url:'reviewUpdate.do',
			type:'post',
			data:{
				conNo : conNo,
				contents : contents,
				title : title,
				rate : rate
			},
			success : function(result) {
				alert('정상 수정 됨');
				var des_id = $('#hiddenDesId').val();
				location.href = 'reviewList.do?page=1'+'&desId='+des_id;
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
<br><br>
<div class="row">
	
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="margin-bottom-20px box-shadow">
	        <div class="padding-20px background-white">
	            <h3> ${reviewInfo.name } 디자이너의 [ ${reviewInfo.title } ] 서비스는 어떠셨나요? </h3>
	            <div class="alert alert-info alert-dismissible fade show" role="alert">
  					<h5>등록하시는 리뷰와 사진은 현행 법률에 부합하여야 하며 본 사의 이용 규칙에 따라야 합니다. <br>
  					 부적절한 게시물은 법률과 규칙에 따라 사전통보 없이 삭제될 수 있으며 서비스 이용이 제한될 수 있습니다.<br>
  					 답글은 최소 한글 10자 이상 작성해주세요.</h5>
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    					<span aria-hidden="true">&times;</span>
  					</button>
				</div>
	        </div>
	    </div>
		<div class="margin-bottom-20px box-shadow">
	        <div class="padding-20px background-white">
	            <input id="title" class="form-control" placeholder="제목을 입력하세요" type="text">
	        </div>
	    </div>
	    <div class="margin-bottom-20px padding-bottom-40px box-shadow">
	        <div class="padding-20px background-white">
	            <textarea class="form-control" id="contents" name="contents">${reviewInfo.contents }</textarea>
				<script type="text/javascript">
				 CKEDITOR.replace('contents'
				                , {height: 500,
				                	filebrowserUploadUrl: 'upload.do' 
				                 });
				</script>
	        </div>
	        <h4 align="center">얼마나 만족하셨나요?</h4><br>
	        <div class="rating">
				<input type="radio" name="rate" value="5" id="5"><label for="5">☆</label>
				<input type="radio" name="rate" value="4" id="4"><label for="4">☆</label>
				<input type="radio" name="rate" value="3" id="3"><label for="3">☆</label>
				<input type="radio" name="rate" value="2" id="2"><label for="2">☆</label>
				<input type="radio" name="rate" value="1" id="1"><label for="1">☆</label>
			</div><br>
			
	        <div align="center">
	        	<button class="btn btn-info" onclick="modify('${reviewInfo.conNo}')">수정</button>
	        </div>
	    </div>
	    
	</div>
	<div class="col-lg-3">
		<input type="hidden" id="hiddenTitle" value="${reviewInfo.title }">
		<input type="hidden" id="hiddenReviewTitle" value="${reviewInfo.reviewTitle }">
		<input type="hidden" id="hiddenRate" value="${reviewInfo.rate }">
		<input type="hidden" id="hiddenDesId" value="${reviewInfo.desId }">
	</div>

</div>
</div>
</body>
</html>