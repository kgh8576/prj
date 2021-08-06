<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.li1{
	 display: inline-block;
	 border: 1px solid white;
	width: 205px;
    text-align: center;
    height: 50px;
    padding-top: 10px;
    margin: 0px;
    font-size: 18px;
	
	}
	.lit{
	 display: inline-block;
	 border: 1px solid white;
	width: 205px;
    text-align: center;
    height: 50px;
    background-color: #d8d8d8;
    padding-top: 10px;
    margin: 0px;
    font-size: 18px;
	
	}
	.ul1{
	     display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 30px;
	}
.hpcheckbtn1 {
	width: 20%;
	display: flex;
	padding: 10px 13px;
	color: #fff;
	border: solid 1px rgba(0, 0, 0, .08);
	height: 50px;
	background-color: #575757;
}
</style>
<script>
	
	var frm;
	var frmHp;
	var hpcheck;
	var hpnumber = document;
	
	$(function(){
		///////////////////////  
		//핸드폰인증번호체크
		//////////////////////
		hpnumber.onchange = function(e) {
			hpnumber = frmhp;
			$.ajax({
				url : 'checkSMS.do',
				data : {
					insertCode : hpnumber,
				},
				type : 'post',
				success : function(data) {
					console.log(data);
					if (data == 1) {
						$('#hppass').val('Checked');
						$('#chkNotice3').html('인증이 완료되었습니다.')
								.attr('color', '#f82a2aa3');
						
					} else {
						$('#hppass').val('unChecked');
						$('#chkNotice3').html('인증번호가 틀렸습니다.')
								.attr('color', '#f82a2aa3');
					}
				},
				error : function(err) {
					console.log(err);
					console.log("핸드폰번호 인증 에러");
				}
			})
		};
		$("#hpcheckbtn").on("click", hpcheckbtn);
		////////////////////////
		// 핸드폰번호 정규식 ///////
		// 검증 /////////////////
		////////////////////////
		var hpnumber = document.getElementById("hp");
		hpnumber.onblur = function(e) {
			$.ajax({
				url : 'realhpcheck.do',
				data : {
					hp : $('#hp').val(),
				},
				type : 'post',
				success : function(data) {
					if (data == 1) {
						$('#chkNotice3').html(
								'입력완료 인증번호받기를 눌러주세요.').attr(
								'color', '#f82a2aa3');
					} else {
						$('#chkNotice3').html(
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
		
	});
	
	function hpcheckbtn() {
		var button_joinus = document.getElementById('hpcheckbtn');
		if (frmHp == "") {
			alert("핸드폰번호를 입력해주세요.");
		} else {
			$.ajax({
				url : 'sendSMS.do',
				data : {
					hp : $('#hp').val(),
				},
				type : 'post',
				success : function(data) {
					frm.hpcheck.focus();
					button_joinus.disabled = true;
					$('#chkNotice3').html('인증번호가 전송되었습니다.').attr('color',
							'#f82a2aa3');
				},
				error : function(err) {
					console.log(err);
					console.log("휴대폰 인증에러");
				}
			})
		}
	};
	
	function membershow() {
		document.getElementById("member").style.display = 'block';
		document.getElementById("des").style.display = 'none';
		frm = document.getElementById("m_frm");
		frmHp = frm.hp.value;
		hpcheck = frm.mhpcheck.value;
		
	}
	function desshow() {
		document.getElementById("des").style.display = 'block';
		document.getElementById("member").style.display = 'none';
		frm = document.getElementById("d_frm");
		frmHp = frm.hp.value;
		hpcheck = frm.dhpcheck.value;
	}
	function nextpage(){
		if (frm.hppass.value == "unChecked") {
			alert("핸드폰번호 인증을 해주세요.");
			frm.hp.focus();
			return false;
		}
/*		
		if (frm.passwordpass.value == 'unChecked') {
			alert("비밀번호 형식이 맞지않습니다. 다시한번 확인해주세요.");
			frm.pw.focus();
			return false;
		}

		if (frm.passwordCheck.value == 'unChecked') {
			alert("비밀번호를 다시 한번 똑같이 입력해주세요.");
			frm.pw2.focus();
			return false;
		}
*/		
		
	}
	
	
</script>
</head>
<body>


<div class="container margin-bottom-200px" id="member" style="display: block;">
	<!--======= log_in_page =======-->

	<div id="log-in" class="site-form log-in-form box-shadow border-radius-10">
		<ul class="ul1">
			<li class="lit" onclick="membershow()">일반</li>
			<li class="li1" onclick="desshow()">디자이너</li>
		</ul>
		<div class="form-output">
			<form action="" id="m_frm">
				<div class="form-group label-floating">
					<label class="control-label">핸드폰 번호</label>
					<input class="form-control" placeholder="핸드폰번호입력 '-'는 빼고 입력해주세요." type="text" name="hp" id="hp" min="11" maxlength="11">
					<input style="width: 80%; display: flex; float: left;" class="form-control" placeholder="인증번호" type="text" name="mhpcheck" id="mhpcheck"
						onchange="smsCheck()">
					<input type="hidden" id="hppass" name="hppass" value="unChecked">
					<button type="button" class="hpcheckbtn1" id="hpcheckbtn" name="hpcheckbtn">인증하기</button>
					<font id="chkNotice3" size="2"></font>
				</div>
				<button type="button" onclick="nextpage()" class="btn btn-md btn-primary full-width">다음단계</button>
			</form>


		</div>
	</div>

</div>



<div class="container margin-bottom-100px" id="des"
	style="display: none;">
	<!--======= log_in_page =======-->
	<div id="log-in"
		class="site-form log-in-form box-shadow border-radius-10">
		<ul class="ul1">
			<li class="li1" onclick="membershow()">일반</li>
			<li class="lit" onclick="desshow()">디자이너</li>
		</ul>

		<div class="form-output">
			<form action="" id="d_frm">
				<div class="form-group label-floating">
					<label class="control-label">핸드폰 번호</label>
					<input class="form-control" placeholder="핸드폰번호입력 '-'는 빼고 입력해주세요." type="text" name="hp" id="hp" min="11" maxlength="11">
					<input style="width: 80%; display: flex; float: left;" class="form-control" placeholder="인증번호" type="text" name="dhpcheck" id="dhpcheck"
						onchange="smsCheck()">
					<input type="hidden" id="hppass" name="hppass" value="unChecked">
					<button type="button" class="hpcheckbtn1" id="hpcheckbtn" name="hpcheckbtn">인증하기</button>
					<font id="chkNotice3" size="2"></font>
				</div>
				<button type="button" onclick="nextpage()" class="btn btn-md btn-primary full-width">다음단계</button>
			</form>
		</div>
	</div>
</div>



</form>


</body>
</html>