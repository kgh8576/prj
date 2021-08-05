<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.hpcheckbtn1 {
	width: 10%;
    display: flex;
    padding: 4px 4px 5px 16px;
    color: #110202;
    border: solid 1px #aab7ad;
    height: 35px;
    font-family: sans-serif;
    font-weight: 600;
    margin-left: 330px;
}
.hpchange {
font-family: sans-serif;
    font-weight: 600;
    float: right;
    color: #110202;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	
	//현재 휴대폰번호 비교 후 다를때 휴대폰인증
	var hpnumber = document.getElementById("hp");
	var hiddenhp = document.getElementById("hiddenhp").value;

	hpnumber.onchange = function(e) {
		$.ajax({
			url : 'realhpcheck.do',
			data : {
				hp : $('#hp').val(),
			},
			type : 'post',
			success : function(data) {
				var hpno = document.getElementById("hp").value;
				if (data == 1) {
					if (hiddenhp == hpno){
						
						$('#NoticeHP').html(
						'핸드폰번호가 같습니다 사용할수없습니다.').attr(
						'color', '#f82a2aa3');
						$('#hp').val('');
						frm.hp.focus();
					}else {
						$('#NoticeHP').html(
						'입력완료 인증번호받기를 눌러주세요.').attr(
						'color', '#f82a2aa3');
						$('#hiddenpass').val('Checked');
					}
					
				} else {
					$('#NoticeHP').html(
							'휴대폰번호 형식이 맞지않습니다.').attr(
							'color', '#f82a2aa3');
					$('#hp').val('');
					frm.hp.focus();
				}
			},
			error : function(err) {
				console.log(err);
				console.log("핸드폰번호 정규식 에러");
			}

		})
	};
	//인증번호확인
	var hpnumber = document.getElementById("hppass");
	hpnumber.onchange = function(e) {
		$.ajax({
			url : 'checkSMS.do',
			data : {
				insertCode : $('#hppass').val(),
			},
			type : 'post',
			success : function(data) {
				console.log(data);
				if (data == 1) {
					$('#hppasschk').val('Checked');
					$('#NoticeHP').html('인증이 완료되었습니다.')
							.attr('color', '#f82a2aa3');
				} else {
					$('#hppasschk').val('unChecked');
					$('#NoticeHP').html('인증번호가 틀렸습니다.')
							.attr('color', '#f82a2aa3');
				}
			},
			error : function(err) {
				console.log(err);
				console.log("핸드폰번호 인증 에러");
			}
		})
	};
});
function hpchange() {
	document.getElementById("phoneNochange").style.display='block';
}
function hppasscancle() {
	document.getElementById("phoneNochange").style.display='none';
}
function siche_next() {
	if (document.getElementById("hp").value.length==11) {
		document.getElementById("hppass").focus();
	}
	if (document.getElementById("hppass").value.length==4) {
		document.getElementById("hpfinalcheck").focus();
	}
}
//핸드폰인증 번호전송
function hpbtn() {
	var button_joinus = document.getElementById('hpcheckbtn');
	if (frm.hp.value == "") {
		alert("핸드폰번호를 입력해주세요.");
	} if (document.getElementById("hiddenpass").value == "unChecked") {
		alert("핸드폰번호를 정상적으로 입력했는지 확인해주세요.");		
	} else {
		$.ajax({
			url : 'sendSMS.do',
			data : {
				hp : $('#hp').val(),
			},
			type : 'post',
			success : function(data) {
				frm.hppass.focus();
				button_joinus.disabled = true;
				$('#NoticeHP').html('인증번호가 전송되었습니다.').attr('color',
						'#f82a2aa3');
				
				
			},
			error : function(err) {
				console.log(err);
				console.log("휴대폰 인증에러");
			}
		})
	}
};
function hpsubmit() {
	if(frm.hppasschk.value == "unChecked"){
		alert("인증번호를 다시 한번 입력해주세요");
		return false;
	}else {
		frm.submit();
	}
}
</script>
</head>
<body>
   <div class="content-wrapper">
        <div class="container-fluid overflow-hidden">
            <div class="row margin-tb-90px margin-lr-10px sm-mrl-0px">
                <!-- Page Title -->
                <div id="page-title" class="padding-30px background-white full-width">
                    <div class="container">
                        <ol class="breadcrumb opacity-5">
                            <li><a href="main.do">홈으로</a></li>
                            <li class="active">나의 프로필</li>
                        </ol>
                        <h1 class="font-weight-300">나의 프로필</h1>
                    </div>
                </div>
                <!-- // Page Title -->

                <div class="row margin-tb-45px full-width">
                    <div class="col-md-8">
                      <div class="row">
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="far fa-user margin-right-10px"></i>${user.name } 님 반갑습니다.</label>
                              <input type="hidden" id="hiddenhp" value="${user.hp }">
                              <input type="hidden" id="hiddenpass" value="unChecked">
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fas fa-mobile-alt margin-right-10px"></i> 연락처 : ${user.hp } 　　<button type="button" onclick="hpchange()">수정</button></label>
                              <form id="frm" action="hpchange.do" method="post">
                              <input type="hidden" id="hppasschk" name="hppasschk" value="unChecked">
                              <div id="phoneNochange" style="display: none;">
                              <strong>변경할 연락처</strong><p></p> <input style="float: left;width: 75%; margin-right: 20px;" class="form-control" min="11" maxlength="11" type="text" id="hp" name="hp" placeholder="변경할 연락처를 입력해주세요" onkeyup='siche_next()'>
                              
                              <button type="button" class="hpcheckbtn1" id="hpcheckbtn"
							name="hpcheckbtn" onclick="hpbtn()">전송</button>
						
							<br><br>
								<div style="text-align: left">
						<font id="NoticeHP" size="2"></font>
					</div>
							<p></p>
							<strong>인증번호 입력</strong>
							<p></p>
							<input style="width: 50%;" class="form-control" min="4" maxlength="4" type="text" id="hppass" name="hppass" placeholder="인증번호" onkeyup='siche_next()'>
							<p></p>
							<button type="button" onclick="hppasscancle()" >수정취소</button>
							<button type="button" class="hpfinalcheck" id="hpfinalcheck" name="hpfinalcheck" style="margin-left: 30px;" onclick="hpsubmit()">수정완료</button>
                              </div>
                              </form>
                          </div>
                          <div class="col-md-6">
                              <label><i class="fas fa-link margin-right-10px"></i> 가입 하신날짜 : ${user.regday }</label>
                          </div>
                          <div class="col-md-6">
                              <label><i class="fas fa-info margin-right-10px"></i> 현재 보유중인 적립금 :　 ${user.point } 　POINT</label>
                          </div>
                      </div>
                      <hr class="margin-tb-40px">
                      <div class="row">
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fab fa-facebook margin-right-10px"></i> Facebook</label>
                              <input type="text" class="form-control form-control-sm" placeholder="http://www.facebook.com">
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fab fa-twitter margin-right-10px"></i> Twitter</label>
                              <input type="text" class="form-control form-control-sm" placeholder="http://www.twitter.com">
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fab fa-youtube margin-right-10px"></i> Youtube</label>
                              <input type="text" class="form-control form-control-sm" placeholder="http://www.youtube.com">
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fab fa-google-plus-g margin-right-10px"></i> Google Pluse</label>
                              <input type="text" class="form-control form-control-sm" placeholder="http://www.google-plus.com">
                          </div>
                          <div class="col-md-6 margin-bottom-20px">
                              <label><i class="fab fa-whatsapp margin-right-10px"></i> Whatsapp</label>
                              <input type="text" class="form-control form-control-sm" placeholder="http://www.whatsapp.com">
                          </div>

                      </div>
                        <a href="#" class="btn btn-md padding-lr-25px  text-white background-main-color btn-inline-block">Update Profile</a>

                    </div>
                </div>

            </div>
        </div>
        </div>
        <!-- /.container-fluid-->
</body>
</html>