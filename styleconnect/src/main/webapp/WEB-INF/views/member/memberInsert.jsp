
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<head>
	<style>
	.hpcheckbtn1 {
width: 20%;display: flex;padding: 10px 13px;color: #fff;
    border: solid 1px rgba(0,0,0,.08);height: 50px;
    background-color: #575757;
}
	</style>
	
	</head>
<script>
$(document).ready(function(){
	//페이지 시작할때 이벤트발생
///////////////////////  
	//핸드폰인증번호체크
	////////////////////////
	var hpnumber = document.getElementById("hpcheck");
	hpnumber.onchange = function (e) {
		$.ajax({
			url : 'checkSMS.do',
			data : {
				insertCode : $('#hpcheck').val(),
			},
			type : 'post',
			success : function(data) {
				console.log(data);
				if (data == 1) {
					$('#hppass').val('Checked');
					$('#chkNotice3').html('인증이 완료되었습니다.').attr('color',
					'#007bff');
				} else {
					$('#hppass').val('unChecked');
					$('#chkNotice3').html('인증번호가 틀렸습니다.').attr('color',
					'#f82a2aa3');
				}
			},
			error : function(err) {
				$('#hppass').val('unChecked');
				$('#chkNotice3').html('인증하기 버튼을 눌러주세요.').attr('color',
				'#f82a2aa3');
			}
		})
	};
	$("#hpcheckbtn").on("click",hpcheckbtn);
	////////////////////////
	// 핸드폰번호 정규식 ///////
	// 검증 /////////////////
	////////////////////////
	var hpnumber = document.getElementById("hp");
	hpnumber.onblur = function (e) {
		$.ajax({
			url : 'realhpcheck.do',
			data : {
				hp : $('#hp').val(),
			},
			type : 'post',
			success : function(data) {
				if(data == 1){
					document.getElementById("hppasschk").value = "Checked"
					$('#chkNotice3').html('입력완료 인증번호받기를 눌러주세요.').attr('color',
					'#007bff');
				}else {
					$('#chkNotice3').html('휴대폰번호 형식이 맞지않습니다.').attr('color',
					'#f82a2aa3');
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
	//비밀번호 정규화
	var password = document.getElementById("pw");
	
	password.onchange = function (e) {
		$.ajax({
			url : 'sendpassword.do',
			data : {
				pw : $('#pw').val(),
			},
			type : 'post',
			success : function(data) {
				if(data == 1){
					$('#chkNoticeP').html('사용할수있는 비밀번호입니다.').attr('color',
					'#007bff');
					$('#passwordpass').val('Checked');
				}else {
					$('#chkNoticeP').html('사용할수 없는 비밀번호입니다.').attr('color',
					'#f82a2aa3');
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

//핸드폰인증 번호전송
function hpcheckbtn() {
	var button_joinus = document.getElementById('hpcheckbtn');
	
	if(frm.hp.value == "") {
		alert("핸드폰번호를 입력해주세요.")
	}
	if (document.getElementById("hppasschk").value == "unChecked") {
		alert("핸드폰번호를 정상적으로 입력했는지 확인해주세요.");
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
				'#007bff');
			},
			error : function(err) {
				console.log(err);
				console.log("휴대폰 인증에러");
			}
		})
	}
	
	
};


	//비밀번호 실시간체크
	$(function() {
		var password = $('input[type=password]');
		var chkNotice = $('#chkNotice');
		var pswd = $('#pw');
		var pswd2 = $('#pw2');

		password.keyup(function() {
			if (pswd2.val() == "") {
			} else {
				if (pswd2.val() != pswd.val()) {
					chkNotice.html('비밀번호 일치하지 않음<br><br>').attr('color',
							'#f82a2aa3');
					$('#passwordCheck').val('unChecked');
				} else {
					chkNotice.html('비밀번호 일치함<br><br>').attr('color',
							'#007bff');
					$('#passwordCheck').val('Checked');
				}
			}
		});
	});
	function checkId() {
		$.ajax({
			url : 'userIdCheck.do',
			data : {
				id : $('#id').val(),
			},
			type : 'post',
			success : function(data) {
				console.log(data);
				if (data == 1) {
					$('#chkNotice2').html('이미 가입중이거나, 회원 탈퇴한 회원입니다.').attr('color',
					'#f82a2aa3');
					$('#idCheck').val('unChecked');
				} else {
					$('#chkNotice2').html('멋진 아이디네요!').attr('color',
					'#007bff');
					$('#idCheck').val('Checked');
				}
			},
			error : function(err) {
				console.log(err);
				console.log("중복검사 에러");
			}
		})
	};
	function siche_next() {
		if (document.getElementById("hp").value.length==11) {
			document.getElementById("hpcheck").focus();
		}
		if (document.getElementById("hpcheck").value.length==4) {
			document.getElementById("hpfinalcheck").focus();
		}
	}
	function hpceck(obj)
	{ 
		document.getElementById("hppasschk").value = "unChecked"
	}

	function formCheck() {
		if (frm.id.value == "") {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		}
		if (frm.pw.value == "") {
			alert("비밀번호를 입력하세요.");
			frm.pw.focus();
			return false;
		}
		if (frm.pw2.value == "") {
			alert("비밀번호를 재입력하세요.");
			frm.pw2.focus();
			return false;
		}
		if (frm.name.value == "") {
			alert("이름를 입력하세요.");
			frm.name.focus();
			return false;
		}
		if (frm.hppass.value == "unChecked") {
			alert("핸드폰번호 인증을 해주세요.");
			frm.hp.focus();
			return false;
		}
		if(frm.gender.value=="") {
			alert("성별 확인 해주세요.");
			frm.gender.focus();
		}
		if (frm.idCheck.value == 'unChecked') {
			alert("탈퇴한 아이디이거나, 이미 사용중인 아이디입니다.");
			frm.id.val("");
			frm.id.focus();
			return false;
		}
		if(frm.passwordpass.value =='unChecked') {
			alert("비밀번호 형식이 맞지않습니다. 다시한번 확인해주세요.");
			frm.pw.focus();
			return false;
		}
		if (frm.passwordCheck.value == 'unChecked') {
			alert("비밀번호를 다시 한번 똑같이 입력해주세요.");
			frm.pw2.focus();
			return false;
		}
		if (frm.hppasschk.value == "unChecked") {
			alert("핸드폰 형식을 다시한번 확인해주세요.");
			return false;
		}
		
		frm.submit();
	}
	
	
</script>
<div class="container margin-bottom-100px">
	<!--======= log_in_page =======-->
	<div id="log-in"
		class="site-form log-in-form box-shadow border-radius-10">

		<div class="form-output">

			<form id="frm" action="memberInsert.do" method="post">
				<div class="form-group label-floating">
					<label class="control-label">이름</label> <input class="form-control"
						placeholder="이름을 입력해주세요." type="text" name="name" id="name">
				</div>
				<div class="form-group label-floating">
					<label class="control-label">ID</label> <input class="form-control" oninput = "checkId()"
						placeholder="사용 하실 아이디를 입력해주세요." type="text" name="id" id="id">
						<input type="hidden" id="idCheck" name="idCheck" value="unChecked">
						
				</div>
				<div style="text-align: left">
					<font id="chkNotice2" size="2"></font>
				</div>
				<div class="form-group label-floating">
					<label class="control-label">Password</label> <input
						class="form-control" placeholder="비밀번호 입력" type="password" id="pw"
						name="pw">
						<input type="hidden" id="passwordpass" name="passwordpass" value="unChecked">
						<p>'숫자', '문자' 무조건 1개 이상, '최소 8자에서 최대 20자' 허용 <br>(특수문자는 정의된 특수문자만 사용 가능)</p>
						<div style="text-align: left">
					<font id="chkNoticeP" size="2"></font>
					
				</div>
				</div>
				<div class="form-group label-floating">
					<label class="control-label">Password Check</label> <input
						class="form-control" placeholder="비밀번호 확인" type="password"
						id="pw2" name="pw2">
						<input type="hidden" id="passwordCheck" name="passwordCheck" value="unChecked">
				</div>
				<div style="text-align: left">
					<font id="chkNotice" size="2"></font>
					
				</div>
				<div class="form-group label-floating">
					<label class="control-label">생년월일</label> <input
						class="form-control" placeholder="우측 달력을 눌러주세요" type="date"
						id="birth" name="birth" min="1900-01-01" max="2100-12-31">
				</div>

				<div class="form-group label-floating is-select">
					<label class="control-label">성별</label> <select
						class="selectpicker form-control" id="gender" name="gender">
						<option value="MALE">Male</option>
						<option value="FEMALE">Female</option>
					</select>
				</div>
									<div class="form-group label-floating">
						<label class="control-label">핸드폰 번호</label> <input
							class="form-control" placeholder="핸드폰번호입력 '-'는 빼고 입력해주세요." type="text" name="hp"
							id="hp" min="11" maxlength="11" onkeyup="siche_next()" onchange="hpceck(this)">
							<input style="width: 80%;display: flex;float: left;"
							class="form-control" placeholder="인증번호" type="text" name="hpcheck"
							id="hpcheck" onkeyup="siche_next()">
							<input type="hidden" id="hppass" name="hppass" value="unChecked">
							<button type="button" class="hpcheckbtn1" id="hpcheckbtn" name="hpcheckbtn">인증하기</button>
							<font id="chkNotice3" size="2"></font>
							<input type="hidden" id="hppasschk" name="hppasschk"
										value="unChecked">
				</div>
				<div class="remember">
					<div class="checkbox">
						
					</div>
				</div>

				<button type="button" id="hpfinalcheck" onclick="formCheck()" class="btn btn-md btn-primary full-width">가입하기</button>

				<div class="or"></div>

				<p>
					계정이있으신가요!? <a href="loginpage.do"> 로그인화면으로 </a>
				</p>
			</form>

		</div>
	</div>
</div>
<!--======= // log_in_page =======-->