<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문분야 설정</title>
<style>
.select input[type=radio] {
	display: none;
}
/* .select input[type=checkbox] {
	display: none;
} */
.select input[type=radio]+label {
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

.select input[type=radio]+label {
	background-color: #fff;
	color: #333;
}

.select input[type=checkbox]+label {
	background-color: #fff;
	color: #333;
}

.select input[type=radio]:checked+label {
	background-color: #333;
	color: #fff;
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

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
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
</head>
<body>
					<form id="frm" action="" method="post">
					<div class="form-group label-floating">
						<p>특별히 잘하는 스타일링이 있나요? 3개만 선택해주세요!</p>
						 <div class="select" style="text-align: center;">
						 	<div>
						 	<img alt="" src="images/Tulips.jpg">
							<input type="checkbox" style="display:none;" name="major" id="major1" value="탈색"><label for="major1">탈색</label>
							</div>
							<div>
						 	<img alt="" src="images/Tulips.jpg">
							<input type="checkbox" style="display:none;" name="major" id="major2" value="댄디컷"><label for="major2">댄디컷</label> 
							</div>
							<div>
						 	<img alt="" src="images/Tulips.jpg">
							<input type="checkbox" style="display:none;" name="major" id="major3" value="가르마펌"><label for="major3">가르마펌</label>
							</div>
						</div>
					</div>
					<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major4" value="모즈 컷"><label for="major4">모즈 컷</label>
							<input type="checkbox" style="display:none;" name="major" id="major5" value="리젠트컷"><label for="major5">리젠트컷</label> 
							<input type="checkbox" style="display:none;" name="major" id="major6" value="포마드컷"><label for="major6">포마드컷</label>
						</div>
					</div>
					<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major7" value="쉐도우펌"><label for="major7">쉐도우펌</label>
							<input type="checkbox" style="display:none;" name="major" id="major8" value="메이크업"><label for="major8">메이크업</label> 
							<input type="checkbox" style="display:none;" name="major" id="major9" value="윈드펌"><label for="major9">윈드펌</label>
						</div>
					</div>
					<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major10" value="벌룬펌"><label for="major10">벌룬펌</label>
							<input type="checkbox" style="display:none;" name="major" id="major11" value="삭발"><label for="major11">삭발</label> 
							<input type="checkbox" style="display:none;" name="major" id="major12" value="투블럭"><label for="major12">투블럭</label>
						</div>
					</div>	
				</form>



</body>
</html>