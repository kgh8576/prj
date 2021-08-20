<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너마이페이지 - 내정보 관리</title>
</head>
<style>
#frm{
		width: 640px;
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
	margin-top: 36px;
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
	width: 310px;
	height: 200px;
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

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
  border-color: #2e6da4;
}
#adcomments{
	color: red;
}

.cerbtn{
	box-sizing: boder-box;
	width: 150px;
	height: 40px;
	line-height: 40px;
	border: 2px solid #ddd;
	border-radius: 30px;
	cursor: pointer;
	margin-left: 30px;
}
.cerbtn a{
	width: 150px;
	display: block;
	text-align: center;
}
textarea {
 height: 100px;
}
.mtitle {
	font-size: 30px;
	text-decoration: underline;
	margin-left: 50px;
	margin-top: 50px;
}
.select{
	width: 500px;
	height:100px;
	box-sizing: border-box;
	border: 2px solid #ddd;
	margin-top: 10px;
}
.foucsmajor{
	margin-top: 30px;
	
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
//파일사진 미리보기
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
function readURL2(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview2').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview2').src = "";
	  }
	}
	
function hpchange() {
	document.getElementById("phoneNochange").style.display = 'block';
}
//글자수 카운트
$(document).ready(function(){
	$(".career").keyup(function(e){
		console.log(" 키업확인");
		
		 var content = $(this).val();
		$('#counter').html("("+content.length+" / 최대 100자)");   //글자수 실시간 카운팅
		
		if(content.length > 100){
			alert("최대 100자까지 입력 가능합니다.");
		$(this).val(content.substring(0, 100));
        $('#counter').html("(100/ 최대 100자)");
		}
	});
});
//이미지 파일 확인
function imgCheck(){
	if(imgfrm.file.value == ""){
		alert("선택된 이미지가 없습니다.");
		return false;
	}else{
		imgfrm.submit();

	}
}
function cercheck(){
	if(cerfrm.file.value == ""){
		alert("선택된 파일이 없습니다.");
		return false;
	}else{
		cerfrm.submit();

	}
}
</script>
<body>
<nav class="navbar navbar-expand-lg navbar-dark z-index-9  fixed-top"
			id="mainNav">
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul	class="navbar-nav navbar-sidenav background-main-color admin-nav" id="admin-nav" style="margin-top:0px">
					<li class="nav-item"><span class="nav-title-text">디자이너	기본정보</span></li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
						<a href="desInfo.do" class="nav-link active" href="dashboard-home.html">
							<i class="fa fa-fw fa-user-circle"></i>
							<span class="nav-link-text">내정보관리</span>
						</a>
					</li>
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My items">
						<a href="desMajor.do" class="nav-link" href="dashboard-my-listings.html">
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
    <div class="content-wrapper">
        <div class="container-fluid overflow-hidden">
          <h1 class="mtitle"> &nbsp&nbsp&nbsp My Profile</h1>
            <div class="row margin-tb-90px margin-lr-10px sm-mrl-0px">
                <!-- Page Title -->
                <!-- // Page Title -->
<!-- 개인정보 수정 -->
                <div class="row margin-tb-45px full-width">
                    <div class="col-md-4">
                        <div class="padding-15px background-white">
                        <!-- 프로필 이미지 -->
                			<!-- 이미지 등록  -->
                			<c:if test="${empty despro.fileUuid  }">
                				<form id="imgfrm" name="imgfrm" method="post" action="desProUpdate.do" enctype="multipart/form-data">
                	 			 <label ><i class="far fa-images margin-right-10px"></i> 프로필 사진 등록</label>
                	 			<input type="hidden" value="${despro.fileUuid}" name="fileUuid">
                            	<a href="#" class="d-block margin-bottom-10px"><img id="preview" src="${pageContext.request.contextPath}/resources/img/이미지 등록.png" alt=""></a>
                             	<input type="file" name="file" onchange="readURL(this);" >
                        		</form>
                            	<button onclick="imgCheck()" class="btn btn-sm  text-white background-main-color btn-block">이미지 등록하기</button>
                        	</c:if>
                        <!-- 이미지 등록// -->
                        <!-- 이미지 수정 -->
                        	<c:if test="${not empty despro.fileUuid  }">
                			 <form id="imgfrm" name="imgfrm" method="post" action="desProUpdate.do"  enctype="multipart/form-data">
                			  <label ><i class="far fa-images margin-right-10px"></i> 프로필 사진 수정</label>
                	 		  <input type="hidden" value="${despro.fileUuid}" name="fileUuid">
                            	<a href="#" class="d-block margin-bottom-10px"> <img id="preview" src="${pageContext.request.contextPath}/resources/img/${despro.fileUuid}" alt=""></a>
                             	<input type="file" name="file" onchange="readURL(this);" >
                       		 </form>
                            	<button onclick="imgCheck()" class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block"> 이미지 수정하기 </button>
                       		</c:if>
                        </div>
                    </div>
                    	<!-- 이미지 수정// -->
                      <!-- 프로필 이미지// -->
                   <!-- 기본정보 수정 -->
                    <div class="col-md-8">
                        <form action="desUpdate.do"  method="post" id="infofrm" name="frm" enctype="multipart/form-data">
                      <div class="row">
                    	<input type="hidden" id="pw" name="pw" value="${des.pw }">  
                   		 <input type="hidden" id="major" name="major" value="${des.major }">
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="far fa-user margin-right-10px"></i> 이름  </label>
                               <input id="name" name="name" type="text" class="form-control form-control-sm" readonly="readonly" value="${des.name }">
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="far fa-user margin-right-10px"></i> ID </label>
                              <input id="id" name="id" type="text" class="form-control form-control-sm" readonly="readonly" value="${des.id }">
                          </div>
                          
                           <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fas fa-mobile-alt margin-right-10px"></i> 생년월일 </label>
                              <input id="birth" name="birth" type="text" readonly="readonly" value="${des.birth }" class="form-control form-control-sm" >
                          </div>
                           <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fas fa-mobile-alt margin-right-10px"></i> 성별</label><br/>
                              <select id="gender" name="gender" disabled="disabled"> 
                              			<option value="MALE"  <c:if test="${des.gender =='남'}">selected</c:if>>Male</option>
										<option value="FEMALE" <c:if test="${des.gender == '여'}">selected</c:if>>Female</option>
                              </select>
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fas fa-mobile-alt margin-right-10px"></i> Phone</label>
                              <input id="hp" name="hp"  type="number" class="form-control form-control-sm" value="${des.hp }">
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="far fa-map margin-right-10px"></i> Address</label>
                              <input id="location" name="location"  type="tel" class="form-control form-control-sm" value="${des.location }">
                          </div>
                      </div>
                      <br/><br/>
                      <!-- 전문분야 -->
                      <div class="row">
                          <div class="col-md-6 margin-bottom-20px">
                               <label><i class="far fa-flag margin-right-10px"></i> 전문성별 ${des.majorgender } </label>
                              <div class="select" style="text-align: center;">
								<input class="foucsmajor" type="radio" name="majorgender" id="majorgender" value="MALE" <c:if test="${des.majorgender == 'MALE'}">checked</c:if> ><label for="majorgender">남자</label>
								<input class="foucsmajor" type="radio" name="majorgender" id="majorgender2" value="FEMALE"<c:if test="${des.majorgender == 'FEMALE'}">checked</c:if> ><label for="majorgender2">여자</label> 
								<input type="radio" class="foucsmajor" name="majorgender" id="majorgender3" value="ALL"<c:if test="${des.majorgender == 'ALL'}">checked</c:if> ><label for="majorgender3">성별무관</label>
							 </div>
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="far fa-flag margin-right-10px"></i> 전문분야 </label>
                              <div class="select" style="text-align: center;">
                             <input class="check" type="checkbox" style="display: none;" name="makeupyn" id="makeupyn1" value="Y" 
                             <c:if test="${des.makeupyn == 'Y' }">checked</c:if> >
                             <label style="width: 60px;" for="makeupyn1"> 메이크업 </label>
							<input class="check" type="checkbox" style="display: none;" name="cutyn" id="cutyn1" value="Y"
							<c:if test="${des.cutyn == 'Y' }">checked</c:if>>
							<label style="width: 60px;" for="cutyn1"> 커트 </label> 
							<input class="check" type="checkbox" style="display: none;" name="permyn" id="permyn1" value="Y"
							<c:if test="${des.permyn == 'Y' }">checked</c:if>>
							<label style="width: 60px;" for="permyn1"> 펌 </label> 
							<input class="check" type="checkbox" style="display: none;" name="dyeyn" id="dyeyn1" value="Y" 
							<c:if test="${des.dyeyn == 'Y' }">checked</c:if>>
							 <label style="width: 60px;" for="dyeyn1"> 염색 </label> 
                          </div>
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="far fa-list-alt margin-right-10px"></i>경력사항  </label><span style="color:#aaa;" id="counter">(0 / 최대 150자)</span><br/>
								<c:if test="${empty des.career }">
								<textarea maxlength="100" onchange="careerchange()" style="width:400px" class="career" name="career" placeholder="경력 사항을 적어주세요. &#13;&#10; ex) 청담동 OO헤어샵 2년 근무 &#13;&#10; - 디자이너 콘테스트 1등"></textarea>
								</c:if>
								<c:if test="${not empty des.career }">
								<textarea maxlength="100" onchange="careerchange()" style="width:400px" class="career" name="career" >${des.career }</textarea>
								<br />
								</c:if>
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
								<label><i class="fas fa-lock margin-right-10px"></i></label> <a
									href="despwchangepage.do" >비밀번호 변경하기</a>
							</div>
                          </div>
                         	<div align="center">
                        		<button type="submit" class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block">기본정보 수정하기</button>
            				</div>
            		</form>
            		<!-- 기본정보 수정 끝// -->
            		<!-- 증명서 제출 -->
            		<hr class="margin-tb-40px">
            		<!-- 증명서 첨부(등록) -->
            			<c:if test="${empty descer.fileUuid }">
                          <div class="col-md-6 margin-bottom-20px">
                          <label><i class="far fa-user margin-right-10px"></i> 재직증명서나 미용자격증 등 첨부 </label>
                      			<div class="cerbtn" onclick="hpchange()"><a >증명서 제출하기</a></div><br/>
                      		<div id="phoneNochange" style="display: none;">
                      		<form id="cerfrm" method="post" action="desCerUp.do" enctype="multipart/form-data">
								<img id="preview2" src="${pageContext.request.contextPath}/resources/img/${descer.fileUuid}" alt="">
                	 			<input type="hidden" value="${descer.fileUuid}" name="fileUuid">
                             	<input type="file" name="file" onchange="readURL2(this);" >
                            </form>
                             		<button onclick="cercheck()" class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block">등록</button>
							</div>
                      		</div>
                      	</c:if>
                      <!-- 재첨부 끝// -->
            		<!-- 증명서 재첨부(수정) -->
            		<c:if test="${descer.state eq 'dcode002' }"><br/>
            		<c:if test="${not empty descer.fileUuid }">
                          <div class="col-md-6 margin-bottom-20px">
                          <label><i class="far fa-folder-open margin-right-10px"></i> 재직증명서나 미용자격증 등 재첨부 <br/> (*재첨부시 기존 파일은 전부 삭제됩니다.) </label>
            				
            				<div>
            				<p id="adcomments">*증명서를 다시 제출해주세요</p>
            				승인거절이유 - ${descer.comments }<br/>
            				</div>
            				
                      		<div class="cerbtn" onclick="hpchange()"><a>증명서 제출하기</a></div><br/>${descer.fileName }
                      		<div id="phoneNochange" style="display: none;">
                      		<form id="cerfrm" method="post" action="desCerUpdate.do" enctype="multipart/form-data">
								<img id="preview2" src="${pageContext.request.contextPath}/resources/img/${descer.fileUuid}" alt="">
                	 			<input type="hidden" value="${descer.fileUuid}" name="fileUuid">
                             	<input type="file" name="file" onchange="readURL2(this);" >
                            </form>
                             	<button onclick="cercheck()">등록</button>
							</div>
                      		</div>
                     </c:if>
                     </c:if>
                      <!-- 재첨부 끝// -->
                     <!-- 증명서 제출 끝// -->
            			</div>
            		</div>
                    </div>
                </div>

            </div>
        <!-- /.container-fluid-->
</body>

</html>
