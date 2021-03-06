<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	transition: 0.6s;
}
.select input[type=checkbox]+label:hover{
transform: translateY(-5px);}

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

.content{
	width: 500px;
	height: 300px;
	box-sizing: border-box;
	border: 1px solid #fff;
	box-shadow: 0px 6px 15px 0px rgb(0 0 0 / 10%);
	padding-top: 60px;
}
.title p:first-child{
	width: 380px;
	height: 20px;
	background-color: #fff;
	display: block;
	font-size: 20px;
	text-align: center;
	
}
.mtitle {
	font-size: 30px;
	text-decoration: underline;
	margin-left: 50px;
	margin-top: 50px;
}
.btn{cursor:pointer;}
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
	
function updateMajor(){
		var frm = document.frm;
		var major_arr = [];
		var obj_length = document.getElementsByName("major").length;
		frm.submit();
	}
	
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark z-index-9  fixed-top"
			id="mainNav">
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul	class="navbar-nav navbar-sidenav background-main-color admin-nav" id="admin-nav" style="margin-top:0px">
					<li class="nav-item"><span class="nav-title-text">디자이너	기본정보</span></li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
						<a href="desInfo.do" class="nav-link" href="dashboard-home.html">
							<i class="fa fa-fw fa-user-circle"></i>
							<span class="nav-link-text">내정보관리</span>
						</a>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My items">
						<a href="desMajor.do" class="nav-link active" href="dashboard-my-listings.html">
							<i class="fa fa-fw fa-table"></i>
							<span class="nav-link-text">전문분야설정</span>
						</a>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My Favorites">
						<a href="desStyle.do" class="nav-link" href="dashboard-my-favorites.html">
							<i class="fa fa-fw fa-image"></i>
							<span class="nav-link-text">스타일링사진 관리</span>
						</a>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
						<a class="nav-link" href="desWorkOpen.do?id=${my.id }">
							<i class="fa fa-fw fa-table"></i>
							<span class="nav-link-text">스케쥴관리</span>
						</a>
					</li>
					<li class="nav-item">
						<span class="nav-title-text">상담관련</span>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookings">
						<a href="desCourse.do" class="nav-link"	href="dashboard-bookings.html">
							<i class="fa fa-fw fa-plus-circle"></i>
							<span class="nav-link-text">내상담관리</span>
						</a>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Listing">
						<a href="desSchedule.do" class="nav-link" href="dashboard-add-listing.html">
							<i class="fa fa-fw fa-bookmark"></i>
								<span class="nav-link-text">예약관리</span>
						</a>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Listing">
						<a href="reviewList.do?desId=${did}" class="nav-link" href="dashboard-add-listing.html">
							<i class="fa fa-fw fa-star"></i>
								<span class="nav-link-text">리뷰관리</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
    <!-- 네비 끝// -->
<div class="content-wrapper">
        <div class="container-fluid overflow-hidden">
    		<h1 class="mtitle">&nbsp;&nbsp;&nbsp; keyword setting</h1>
            <div class="row margin-tb-90px margin-lr-0px sm-mrl-0px">    
     <div id="page-title" class="padding-30px background-white full-width">
                    <div class="container">
                        <ol class="breadcrumb opacity-5">
                        </ol>
                    </div>
                </div>
				<form name="frm" id="frm" action="majorUpdate.do" method="post">
				<input type="hidden" name="id" id="id" value="${des.id }"> 
						<div class="title" align="center">
						<p>특별히 잘하는 스타일링이 있나요? </p>
						<p>3개만 선택해주세요!</p>
						</div>
					<div align="center" class="content">
							<c:set var="majors" value="${fn:split(des.major,',')}"></c:set>
							<c:set var="selectmajor" value="${des.major }"></c:set>
							<c:forEach var="major" items="${majors}" >
							</c:forEach> 
							<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major1" value="탈색"  <c:if test="${fn:contains(selectmajor,'탈색')}">checked</c:if>/><label for="major1">탈색</label>
							<input type="checkbox" style="display:none;" name="major" id="major2" value="댄디컷"  <c:if test="${fn:contains(selectmajor,'댄디컷')}">checked</c:if>/><label for="major2">댄디컷</label> 
							<input type="checkbox" style="display:none;" name="major" id="major3" value="가르마펌"  <c:if test="${fn:contains(selectmajor,'가르마펌')}">checked</c:if>/><label for="major3">가르마펌</label>
						</div>
					</div>
					<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major4" value="레이어드컷" <c:if test="${fn:contains(selectmajor,'레이어드컷')}">checked</c:if>/><label for="major4">레이어드컷</label>
							<input type="checkbox" style="display:none;" name="major" id="major5" value="레이어드펌" <c:if test="${fn:contains(selectmajor,'레이어드펌')}">checked</c:if>/><label for="major5">레이어드펌</label> 
							<input type="checkbox" style="display:none;" name="major" id="major6" value="웨이브펌" <c:if test="${fn:contains(selectmajor,'웨이브펌')}">checked</c:if>/><label for="major6">웨이브펌</label>
						</div>
					</div>
					<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major7" value="쉐도우펌" <c:if test="${fn:contains(selectmajor,'쉐도우펌')}">checked</c:if>/><label for="major7">쉐도우펌</label>
							<input type="checkbox" style="display:none;" name="major" id="major8" value="메이크업" <c:if test="${fn:contains(selectmajor,'메이크업')}">checked</c:if>/><label for="major8">메이크업</label> 
							<input type="checkbox" style="display:none;" name="major" id="major9" value="윈드펌"<c:if test="${fn:contains(selectmajor,'윈드펌')}">checked</c:if>/><label for="major9">윈드펌</label>
						</div>
					</div>
					<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major10" value="볼륨펌" <c:if test="${fn:contains(selectmajor,'볼륨펌')}">checked</c:if>/><label for="major10">볼륨펌</label>
							<input type="checkbox" style="display:none;" name="major" id="major11" value="삭발" <c:if test="${fn:contains(selectmajor,'삭발')}">checked</c:if>/><label for="major11">삭발</label> 
							<input type="checkbox" style="display:none;" name="major" id="major12" value="투블럭" <c:if test="${fn:contains(selectmajor,'투블럭')}">checked</c:if>/><label for="major12">투블럭</label>
						</div>
					</div>
										
				</div>
			</form>
		</div>
			<div align="center">
				<button onclick="updateMajor()" class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block">수정하기</button>
			</div>
	</div>
</div>
			

</body>
</html>