<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너마이페이지 - 내정보 관리</title>
</head>
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
	function formCheck(){
		if (frm.passwordCheck.value == 'unChecked') {
			alert("비밀번호를 다시 한번 똑같이 입력해주세요.");
			frm.pw2.focus();
			return false;
		}
		frm.submit();
	}
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
                        <h1 class="font-weight-300">${des.name } 디자이너 정보dd </h1>
                    </div>
                </div>
                <!-- // Page Title -->

                <div class="row margin-tb-45px full-width">
                
                	<!-- 프로필 이미지 업로드 -->
                    <form method="post" action="desProUpdate.do"  enctype="multipart/form-data">
                    <input type="hidden" value="${des.fileUuid}" name="fileUuid">
                    <div class="col-md-4">
                        <div class="padding-15px background-white">
                            <a href="" class="d-block margin-bottom-10px"><img id="preview" src="${pageContext.request.contextPath}/resources/img/${des.fileUuid}" alt=""></a>
                            <input type="file" onchange="readURL(this);" >
                            <button type="submit"  >수저ㅓㅇ</button>
                            <a  class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block">이미지 수정하기 </a>
                        </div>
                    </div>
                    </form>
                    <!-- 프로필 이미지 업로드 끝 -->
                    
                    <form action="desUpdate.do" method="post" id="frm" name="frm" >
					<input type="text" id="gender" name="gender" value="${des.gender }">
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
                              <select id="gender" name="gender" > 
                              			<option value="MALE" <c:if test="${des.gender =='남'}">selected</c:if>>Male</option>
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
                          <div class="col-md-6 margin-bottom-20px">
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
						</div>
                  <!-- 비밀번호 변경 끝// -->
                        <a  class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block">Update Profile</a>
						<button type="button" onclick="formCheck()"> 수정ddddd</button>
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