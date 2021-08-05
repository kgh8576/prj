<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<style>
#row{
padding-left: 30px;
    padding-right: 30px;
    padding-top: 15px;
"
}
</style>
</head>
<script>
	$(document).ready(
			function() {

				//비밀번호 정규화
				var password = document.getElementById("pw");

				password.onchange = function(e) {
					$.ajax({
						url : 'sendpassword.do',
						data : {
							pw : $('#pw').val(),
						},
						type : 'post',
						success : function(data) {
							if (data == 1) {
								$('#chkNoticeP').html('사용할수있는 비밀번호입니다.').attr(
										'color', '#132bab');
								$('#passwordpass').val('Checked');
							} else {
								$('#chkNoticeP').html('사용할수 없는 비밀번호입니다.').attr(
										'color', '#f82a2aa3');
								$('#passwordpass').val('unChecked');
								frm.pw.focus();
							}
						},
						error : function(err) {
							console.log(err);
							console.log("비밀번호 검증오류");
						}
					});
				};
			});
	//비밀번호 실시간체크
	$(function() {
		var password = $('input[type=password]');
		var chkNotice = $('#chkNoticeP');
		var pswd = $('#pw');
		var pswd2 = $('#pwcheck');

		password.keyup(function() {
			if (pswd2.val() == "") {
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
	
	function changebtn() {
		
		if (frm.gupw.value == "") {
			alert("현재 비밀번호를 입력해주세요.");
			frm.gupw.focus();
			return false;
		}
		if (frm.pw.value == "") {
			alert("새로운 비밀번호를 입력해주세요.");
			frm.pw.focus();
			return false;
		}
		if (frm.pwcheck.value == "") {
			alert("비밀번호 확인을 적어주세요.");
			frm.pwcheck.focus();
			return false;
		}
		if (frm.passwordpass.value == "unChecked") {
			alert("비밀번호 양식이 맞지않습니다.");
			frm.passwordpass.focus();
			return false;
		}
		if (frm.passwordCheck.value == "unChecked") {
			alert("입력한 비밀번호가 서로 다릅니다.");
			frm.passwordCheck.focus();
			return false;
		}
		$.ajax({
			url : 'pwchange.do',
			data : {
				gupw : $('#gupw').val(),
				pw : $('#pw').val(),
			},
			type : 'post',
			success : function(data) {
				if(data == 1) {
					alert("비밀번호 변경완료");
					location.href="membermypage.do";
				}else {
					  alert("현재 비밀번호가 다릅니다. 다시확인해주세요.");
				}
			},
			error : function(err) {
				console.log("비밀번호 변경에러");
			}
		})
	};
</script>
<form name="frm" action="pwchange.do" method="post">
<input type="hidden" id="passwordpass" name="passwordpass" value="unChecked">
<input type="hidden" id="passwordCheck" name="passwordCheck" value="unChecked">
<div class="row" style="margin-top: 300px">
	<div class="col-md-3 margin-bottom-20px">
		<label><i class="fas fa-lock margin-right-10px"></i> 현재 비밀번호</label> <input
			type="password" id="gupw" name="gupw"
			class="form-control form-control-sm">
	</div>
</div>
<div class="row">
	<div class="col-md-3 margin-bottom-20px">
		<label><i class="fas fa-lock margin-right-10px"></i> 새로운 비밀번호</label>
		<input type="password" id="pw" name="pw"
			class="form-control form-control-sm">
			<p>'숫자', '문자' 무조건 1개 이상, '최소 8자에서 최대 20자' 허용 <br>(특수문자는 정의된 특수문자만 사용 가능)</p>
	</div>
</div>
<div class="row" style="margin-bottom: 300px">
	<div class="col-md-3 margin-bottom-20px">
		<label><i class="fas fa-lock margin-right-10px"></i> 비밀번호 확인</label> <input
			type="password" id="pwcheck" name="pwcheck"
			class="form-control form-control-sm">
			<font id="chkNoticeP" size="2"></font>
			<div id="row" style="margin-top: 15px">
			<a href="membermypage.do"  class="btn btn-primary" >변경하지않기</a>
			<button type="button" class="btn btn-primary" id="change" name="change" onclick="changebtn()" style="float: right;"> 비밀번호변경</button>
			</div>
	</div>
</div>
</form>
