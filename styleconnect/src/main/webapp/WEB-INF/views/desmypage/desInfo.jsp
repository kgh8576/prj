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

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
  border-color: #2e6da4;
}

</style>
<script>

//비밀번호 확인
function checkPw(){
	$.ajax({
		url : "desPwCheck.do",
		data : {
			pw : $('#originpw').val(),
		},
		type : 'post',
		succes: function(data){
			console.log(data);
			if(data ==1){
				$('#chkNotice2').html('비밀번호가 일치합니다').attr('color','#f82a2aa3');
				$('#pwCheck').val('Checked');
			}else{
				$('#chkNotice2').html('비밀번호가 일치하지 않습니다. 다시 입력하세요').attr('color','#f82a2aa3');
				$('#pwCheck').val('unChecked');
			}
		},
		error: function(err){
			console.log(err);
			console.log("중복검사 에러");
		}
	})
}

//비밀번호 실시간체크
$(function() {
	var password = $('input[type=password]');
	var chkNotice = $('#chkNotice');
	var pswd = $('#pw');
	var pswd2 = $('#pw2');

	password.keyup(function() {
		if (pswd2.val() == "") {
			chkNotice.html('');
		} else {
			if (pswd2.val() != pswd.val()) {
				chkNotice.html('비밀번호 일치하지 않음<br><br>').attr('color',
						'#f82a2aa3');
				$('#passwordCheck').val('unChecked');
			} else {
				chkNotice.html('비밀번호 일치함<br><br>').attr('color',
						'#199894b3');
				$('#passwordCheck').val('Checked');
			}
		}
	});
});
	/* function formCheck(){
		if (frm.passwordCheck.value == 'unChecked') {
			alert("비밀번호를 다시 한번 똑같이 입력해주세요.");
			frm.pw2.focus();
			return false;
		}
		frm.submit();
	} */
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
	

</script>
<body>


    <div class="content-wrapper">
        <div class="container-fluid overflow-hidden">
            <div class="row margin-tb-90px margin-lr-10px sm-mrl-0px">
                <!-- Page Title -->
                <div id="page-title" class="padding-30px background-white full-width">
                    <div class="container">
                        <ol class="breadcrumb opacity-5">
                            <li><a href="#">Home</a></li>
                            <li><a href="mypage.do">MyPage</a></li>
                            <li class="active">My Profile</li>
                        </ol>
                        <h1 class="font-weight-300">${des.name } 디자이너 정보</h1>
                    </div>
                </div>
                <!-- // Page Title -->

                <div class="row margin-tb-45px full-width">
                
             <!-- 프로필 이미지 업로드 -->
                <!-- 이미지 등록  -->
                	<c:if test="${empty despro.fileUuid  }">
                	<form method="post" action="desProUp.do" enctype="multipart/form-data">
                	 <input type="hidden" value="${despro.fileUuid}" name="fileUuid">
                    <div class="col-md-4">
                        <div class="padding-15px background-white">
                            <a href="" class="d-block margin-bottom-10px"><img id="preview" src="${pageContext.request.contextPath}/resources/img/이미지 등록.png" alt=""></a>
                            <input type="file" name="file" onchange="readURL(this);" >
                            <button type="submit">등록</button>
                        </div>
                    </div>
                	</form>
                	</c:if>
                <!-- 이미지 등록// -->
                <!-- 이미지 수정 -->	
                	<c:if test="${not empty despro.fileUuid  }">
                    <form method="post" action="desProUpdate.do"  enctype="multipart/form-data">
                    <input type="hidden" value="${despro.fileUuid}" name="fileUuid">
                    <div class="col-md-4">
                        <div class="padding-15px background-white">
                            <a href="" class="d-block margin-bottom-10px">
                            <img id="preview" src="${pageContext.request.contextPath}/resources/img/${despro.fileUuid}" alt=""></a>
                             <input type="file" name="file" onchange="readURL(this);" >
                            <button type="submit" >수정</button>
                            <a  class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block">이미지 수정하기 </a>
                        </div>
                    </div>
                    </form>
                    </c:if>
                 <!-- 이미지 수정// -->
               <!-- 프로필 이미지 업로드 끝 -->
               <!-- 개인정보 수정 -->     
                    <form action="desUpdate.do" method="post" id="frm" name="frm" >
                    <input type="hidden" id="pw" name="pw" value="${des.pw }">  
                    <input type="hidden" id="major" name="major" value="${des.major }">
                    <div class="col-md-8">
                      <div class="row">
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
                              <label><i class="fas fa-mobile-alt margin-right-10px"></i> 성별</label>
                              <select id="gender" name="gender" disabled="disabled"> 
                              			<option value="MALE"  <c:if test="${des.gender =='남'}">selected</c:if>>Male</option>
										<option value="FEMALE" <c:if test="${des.gender == '여'}">selected</c:if>>Female</option>
                              </select>
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fas fa-mobile-alt margin-right-10px"></i> Phone</label>
                              <input id="hp" name="hp"  type="text" class="form-control form-control-sm" value="${des.hp }">
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fas fa-mobile-alt margin-right-10px"></i> Address</label>
                              <input id="location" name="location"  type="tel" class="form-control form-control-sm" value="${des.location }">
                          </div>
                        
                      </div>
                      <hr class="margin-tb-40px">
                      <div>
                    <!-- 전문분야 -->
                      <div class="col-md-6 margin-bottom-20px">
                              <label><i class="far fa-user margin-right-10px"></i> 전문성별 ${des.majorgender } </label>
						<div class="select" style="text-align: center;">
							<input class="foucsmajor" type="radio" name="majorgender" id="majorgender" value="MALE" <c:if test="${des.majorgender == 'MALE'}">checked</c:if> ><label for="majorgender">남자</label>
							<input class="foucsmajor" type="radio" name="majorgender" id="majorgender2" value="FEMALE"<c:if test="${des.majorgender == 'FEMALE'}">checked</c:if> ><label for="majorgender2">여자</label> 
							<input type="radio" class="foucsmajor" name="majorgender" id="majorgender3" value="ALL"<c:if test="${des.majorgender == 'ALL'}">checked</c:if> ><label for="majorgender3">성별무관</label>
						</div>
					</div>
					<!-- 전문분야 -->
					<div style="text-align: left">
						<font id="chkNotice2" size="2"></font>
					</div>
					 <div class="col-md-6 margin-bottom-20px">
                              <label><i class="far fa-user margin-right-10px"></i> 전문분야 </label>
						<div class="select" style="text-align: center;">
							<input class="check" type="checkbox" style="display: none;"
								name="makeupyn" id="makeupyn1" value="Y" <c:if test="${des.makeupyn == 'Y' }">checked</c:if> ><label
								style="width: 60px;" for="makeupyn1"> 메이크업 </label> <input
								class="finalcheck" type="hidden" id="makeupyn" name="makeupyn">
							<input class="check" type="checkbox" style="display: none;"
								name="cutyn" id="cutyn1" value="Y"<c:if test="${des.cutyn == 'Y' }">checked</c:if>><label
								style="width: 60px;" for="cutyn1"> 커트 </label> <input
								class="finalcheck" type="hidden" id="cutyn" name="cutyn">
							<input class="check" type="checkbox" style="display: none;"
								name="permyn" id="permyn1" value="Y"<c:if test="${des.permyn == 'Y' }">checked</c:if>><label
								style="width: 60px;" for="permyn1"> 펌 </label> <input
								class="finalcheck" type="hidden" id="permyn" name="permyn">
							<input class="check" type="checkbox" style="display: none;"
								name="dyeyn" id="dyeyn1" value="Y" <c:if test="${des.dyeyn == 'Y' }">checked</c:if>> <label
								style="width: 60px;" for="dyeyn1"> 염색 </label> <input
								class="finalcheck" type="hidden" id="dyeyn" name="dyeyn">
						</div>
					</div>
				 <div class="col-md-6 margin-bottom-20px">
                              <label><i class="far fa-user margin-right-10px"></i> 경력사항 </label>
						<textarea class="textarea"
							id="career" name="career" >${des.career }</textarea>
					</div>
					<div style="text-align: left">
						<font id="chkNotice" size="2"></font>
					</div>

					<div class="form-group label-floating">
						<p>재직증명서나 미용자격증등을 첨부해주시면됩니다.</p>
						<div class="filebox bs3-primary preview-image">
							<input class="upload-name" value="파일선택" disabled="disabled"
								style="width: 200px;"> <label for="cergroupno">업로드</label>
							<input type="file" name="file" id="cergroupno" class="upload-hidden">
						</div>
						
				</div>
                <!--// 비밀번호 변경 -->
               <!-- <!--     기존 비밀번호 체크
                     <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fas fa-lock margin-right-10px"></i> 기존 비밀번호</label>
                              <input id="originpw" name="originpw" type="password" class="form-control form-control-sm" oninput="checkPw()">
                          	<input type="hidden" id="pwCheck" name="pwCheck" value="unChecked">	
                          </div>
                         <div style="text-align: left">
							<font id="chkNotice2" size="2"></font>
						</div>
				   기존 비밀번호 체크 끝 --> 
                       <!--    <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fas fa-lock margin-right-10px"></i> 새비밀번호</label>
                              <input id="pw" name="pw" type="password" class="form-control form-control-sm">
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fas fa-lock margin-right-10px"></i> 새비밀번호 확인</label>
                              <input id="pw2" name="pw2" type="password" class="form-control form-control-sm">
                              <input type="hidden" id="passwordCheck" name="passwordCheck" value="unChecked">
                          </div>
                          <div style="text-align: left">
							<font id="chkNotice" size="2"></font>
						</div> -->
                  <!-- 비밀번호 변경 끝// -->
                        <a  class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block">Update Profile</a>
						<button type="submit" > 수정ddddd</button>
                    </div>
        			</form>
                </div>

            </div>
        </div>
        </div>
        <!-- /.container-fluid-->
        <!-- /.content-wrapper-->
      
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
          <i class="fa fa-angle-up"></i>
        </a>
       
    </div>
</body>
</html>