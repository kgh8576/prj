<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문분야 설정</title>
<style>
.select input[type=checkbox]+label {
	display: inline-block;
	cursor: pointer;
	height: 24px;
	width: 90px;
	border: 1px solid #333;
	line-height: 24px;
	text-align: center;
	font-weight: bold;
	font-size: 13px;
	margin-right: 15px;
	margin-left: 15px;
}

.select input[type=checkbox]+label {
	background-color: #fff;
	color: #333;
}

.select input[type=checkbox]:checked+label {
	background-color: #333;
	color: #fff;
}

.log-in-form .form-output label {
	font-size: 14px;
	text-transform: capitalize;
	color: #686868;
	margin: 10px 10px;
}

.textarea {
	width: 410px;
	height: 400px;
	resize: none;
	border-radius: 0px;
	-webkit-box-shadow: none;
}
body {margin: 10px;}
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

/* imaged preview */
.filebox .upload-display {
  margin-bottom: 5px;
}

@media(min-width: 768px) {
  .filebox .upload-display {
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 0;
  }
}

.filebox .upload-thumb-wrap {
  display: inline-block;
  width: 54px;
  padding: 2px;
  vertical-align: middle;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
}

.filebox .upload-display img {
  display: block;
  max-width: 100%;
  width: 100% \9;
  height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
  border-color: #2e6da4;
}

img{
	width: 100px;
	height: 100px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
//major 선택 3개로 제한
	$(document).ready(function(){
		$("input[type='checkbox']").on("click",function(){
			let count = $("input:checked[type='checkbox']").length;
			
			if(count > 3){
				$(this).prop("checked",false);
				alert("3개까지만 선택할 수 있습니다.");
			}
		});	
	});
	
</script>
</head>
<body>
					<form id="frm" action="" method="post">
					<div class="form-group label-floating">
						<p>특별히 잘하는 스타일링이 있나요? 3개만 선택해주세요!</p>
						
						<div>
						 <input type="checkbox" id="m1" name="m1"value="댄디컷" <c:if test="${des.major =='댄디컷'}">selected</c:if> />
						 <label for="m1"> 댄디컷d</label>
						</div>
						
						
						
						
						 <div class="select" style="text-align: center;">
						 	<div>
						 	<img alt="" src="images/Tulips.jpg">
							<input type="checkbox" style="display:none;" name="major" id="major1" value="탈색"><label for="major1">탈색</label>
							</div>
							<div>
						 	<img alt="" src="images/Tulips.jpg">
							<input type="checkbox" style="display:none;" name="major" id="major2" value="댄디컷" <c:if test="${des.major =='댄디컷'}">:checked</c:if>><label for="major2">댄디컷</label> 
							</div>
							<div>
						 	<img alt="" src="images/Tulips.jpg">
							<input type="checkbox" style="display:none;" name="major" id="major3" value="가르마펌"><label for="major3">가르마펌</label>
							</div>
						</div>
					</div>
					
				</form>



</body>
</html>