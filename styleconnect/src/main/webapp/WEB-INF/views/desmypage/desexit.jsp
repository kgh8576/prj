<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<style>
#row {
	padding-left: 30px;
	padding-right: 30px;
	padding-top: 15px;
	"
}
</style>
</head>
<script>
	function exitbtn() {

		if (frm.pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			frm.pw.focus();
			return false;
		}
		msg = "탈퇴하시면 기존에 있던 모든 정보들은 사라집니다.  정말 탈퇴하시겠습니까? ";
		if (confirm(msg) != 0) {
			$.ajax({
				url : 'memexit.do',
				data : {
					pw : $('#pw').val(),
				},
				type : 'post',
				success : function(data) {
					if (data == 1) {
						alert("다시 돌아오실날을 기다릴게요!");
						location.href = "main.do";
					} else {
						alert("비밀번호가 틀렸습니다. 다시 확인해주세요!");
					}
				},
				error : function(err) {
					console.log("회원탈퇴에러");
				}
			});
		};
	};
</script>
<form name="frm" action="pwchange.do" method="post">
	<input type="hidden" id="passwordpass" name="passwordpass"
		value="unChecked"> <input type="hidden" id="passwordCheck"
		name="passwordCheck" value="unChecked">
	<div class="row" style="margin-top: 300px">
		<div class="col-md-3 margin-bottom-20px">
			<H3>" STYLE CONNECT " 를 탈퇴 하기위한 절차입니다.</H3>
			<label><i class="fas fa-lock margin-right-10px"></i> 본인확인을 위한
				비밀번호를 한번더 입력해주세요.</label> <input type="password" id="pw" name="pw"
				class="form-control form-control-sm">
		</div>
	</div>
	<div class="row" style="margin-bottom: 300px">
		<div class="col-md-3 margin-bottom-20px">
			<label></label>
			<div id="row" style="margin-top: 15px">
				<a href="mypage.do" class="btn btn-primary">탈퇴하지않기</a>
				<button type="button" class="btn btn-primary" id="change"
					name="change" onclick="exitbtn()" style="float: right;">
					회원탈퇴하기</button>
			</div>
		</div>
	</div>
</form>
