<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

	var hp;
	var pw;
	var searchTable;
	var name;
	var idCheck = false;
	
	function realhpcheck(){

		$.ajax({
			url : 'realhpcheck.do',
			data : {
				hp : $('#hp').val(),
			},
			type : 'post',
			success : function(data) {
				if (data == 1) {
					$('#chkNotice').html(
							'입력완료 인증번호받기를 눌러주세요.').attr(
							'color', '#f82a2aa3');
				} else {
					$('#chkNotice').html(
							'휴대폰번호 형식이 맞지않습니다.').attr(
							'color', '#f82a2aa3');
					$('#hp').val('');
					$('#hp').focus();
				}
			},
			error : function(err) {
				console.log(err);
				console.log("핸드폰번호 정규식 에러");
			}
		})
	}
	
	function checkExistUserByIdHp(){
		idCheck = false;
		$.ajax({
			url : 'checkExistUserByIdHp.do',
			data : {	
				hp : $('#hp').val(),
				name : $('#name').val(),
				searchTable : searchTable
			},
			success:function(result){
				console.log(result);
				if(result == 1){
					idCheck = true;
				}
			}
		})
	}
	
	function smsCheck(){
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
					$('#chkNotice').html('인증이 완료되었습니다.')
							.attr('color', '#f82a2aa3');
					
				} else {
					$('#hppass').val('unChecked');
					$('#chkNotice').html('인증번호가 틀렸습니다.')
							.attr('color', '#f82a2aa3');
				}
			},
			error : function(err) {
				console.log(err);
				console.log("핸드폰번호 인증 에러");
			}
		})
		
	}
	
	function hpcheckbtn() {
		if(idCheck == true){
			var button_joinus = $('#hpcheckbtn');
			if ( $('#hp').val() == "" ) {
				alert("핸드폰번호를 입력해주세요.");
			} else {
				$.ajax({
					url : 'sendSMS.do',
					data : {
						hp : $('#hp').val()
					},
					type : 'post',
					success : function(data) {
						$('#hpcheck').focus();
						button_joinus.disabled = true;
						$('#chkNotice').html('인증번호가 전송되었습니다.').attr('color',
								'#f82a2aa3');
					},
					error : function(err) {
						console.log(err);
						console.log("휴대폰 인증에러");
					}
				})
			}
		}else{
			alert('존재하지 않는 사용자입니다. \n혹은 일반/디자이너 구분을 확인해주세요.');
			$('#chkNotice').html('');
		}
	}
	
	function membershow() {
		document.getElementById("memCheckedBar").style.display = 'block';
		document.getElementById("desCheckedBar").style.display = 'none';
		searchTable = 'member';
	}
	function desshow() {
		document.getElementById("desCheckedBar").style.display = 'block';
		document.getElementById("memCheckedBar").style.display = 'none';
		searchTable = 'designer';
	}
	function getId(){
		if (idCheck == false){
			alert("핸드폰번호 인증을 해주세요.")
			$('#chkNotice').html('');
			return false;
		}
		if ( $('#hppass').value == "unChecked" ) {
			alert("핸드폰번호 인증을 해주세요.");
			$('#hp').focus();
			return false;
		}
		if ( $('#name').value == "" ) {
			alert("이름을 기재하세요.");
			$('#name').focus();
			return false;
		}
		
		$.ajax({
			url : 'getUserIdByHpName.do',
			data : {
				hp : $('#hp').val(),
				name : $('#name').val(),
				searchTable : searchTable
			},
			type : 'post',
			success : function(data) {
				document.getElementById("log-in").style.display = 'none';
				document.getElementById("getIdDiv").style.display = 'block';
				$('#getId').append(data);
				
				hp = $('#hp').val();
				name = $('#name').val();
			},
			error : function(err) {
				console.log(err);
				console.log("인증에러");
			}
		});
	}
		
	function nextpage(){
		document.getElementById("getIdDiv").style.display = 'none';
		document.getElementById("updatePwDiv").style.display = 'block';
	}
	
	//비밀번호 정규화
	function sendpassword(){
		$.ajax({
			url : 'sendpassword.do',
			data : {
				pw : $('#pw').val(),
			},
			type : 'post',
			success : function(data) {
				if(data == 1){
					$('#chkNoticeP').html('사용할수있는 비밀번호입니다.').attr('color',
					'#132bab');
					$('#passwordpass').val('Checked');
				}else {
					$('#chkNoticeP').html('사용할수 없는 비밀번호입니다.').attr('color',
					'#f82a2aa3');
					$('#passwordpass').val('unChecked');
					$('#pw').focus();
				}
			},
			error : function(err) {
				console.log(err);
				console.log("비밀번호 검증 오류");
			}
		});
	}
	
	//document.ready 1. 비밀번호 실시간체크, 2. 타고 넘어온 url
	$(function() {
		var beforeLocation = document.location.href;
		if(beforeLocation.includes('MEM')){
			membershow();
		}else if(beforeLocation.includes('DES')){
			desshow();
		}
		
		var password = $('input[type=password]');
		var chkNotice = $('#chkNoticeP2');
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
							'#199894b3');
					$('#passwordCheck').val('Checked');
				}
			}
		});
	});
	
	function updatePw(){
			if ($('#pw').val() == '' ){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			if ($('#passwordpass').val() == 'unChecked') {
				alert("비밀번호 형식이 맞지 않습니다. 다시한번 확인해주세요.");
				$('#pw').focus();
				return false;
			}
			if ($('#passwordCheck').val() == 'unChecked') {
				alert("비밀번호를 다시 한 번 똑같이 입력해주세요.");
				$('#pw2').focus();
				return false;
			}
			
			pw = $('#pw').val();
			
			$.ajax({
				url : 'updateUserPwByHpName.do',
				data : {
					hp : hp,
					name : name,
					searchTable : searchTable,
					pw : pw
				},
				type : 'post',
				success : function(data) {
					alert('성공했습니다. 재 로그인하세요');
					console.log(data);
					location.href='main.do';
				},
				error : function(err) {
					console.log(err);
					console.log("비밀번호 변경 에러");
				}
			});
	}
	

	
</script>
</head>
<body>


<div class="container margin-bottom-200px" id="member" style="display: block; padding:7%;">
	<!--======= log_in_page =======-->

	<div id="log-in" class="site-form log-in-form box-shadow border-radius-10">
		<ul id="memCheckedBar" class="ul1">
			<li class="lit" onclick="membershow()">일반</li>
			<li class="li1" onclick="desshow()">디자이너</li>
		</ul>
		<ul id="desCheckedBar" class="ul1" style="display: none;">
			<li class="li1" onclick="membershow()">일반</li>
			<li class="lit" onclick="desshow()">디자이너</li>
		</ul>
		<div class="form-output">
				<div class="form-group label-floating">
					<label class="control-label">이름</label>
					<input id="name" name="name" class="form-control" placeholder="이름을 입력해주세요!" type="text">
				</div>
				<div class="form-group label-floating">
					<form action="" id="m_frm">
					<label class="control-label">핸드폰 번호</label>
					<input class="form-control" placeholder="핸드폰번호입력 '-'는 빼고 입력해주세요." type="text" name="hp" id="hp" min="11" maxlength="11" onblur="realhpcheck()" onchange="checkExistUserByIdHp()">
					<input style="width: 80%; display: flex; float: left;" class="form-control" placeholder="인증번호" type="text" name="hpcheck" id="hpcheck"
						onchange="smsCheck()">
					<input type="hidden" id="mhppass" name="hppass" value="unChecked">
					</form>
					<button type="button" class="hpcheckbtn1" id="hpcheckbtn" name="hpcheckbtn" onclick="hpcheckbtn()">인증하기</button>
					<font id="chkNotice" size="2"></font>
				</div>
				<button type="button" onclick="getId()" class="btn btn-md btn-primary full-width">아이디 찾기</button>
		</div>
	</div>
</div>
	
<div id="getIdDiv" class="site-form log-in-form box-shadow border-radius-10" style="display: none;">
	<div class="form-output">
		<div class="form-group label-floating">
			<strong>고객님의 아이디는 <b><getId id="getId"></getId></b></strong>	
		</div>
		<button type="button" onclick="nextpage()" class="btn btn-md btn-primary full-width">비밀번호 찾기</button>
	</div>
</div>
	

<div id="updatePwDiv" class="site-form log-in-form box-shadow border-radius-10" style="display: none;margin-bottom: 200px;">
	<div class="form-output">
			<div class="form-group label-floating">
				<label class="control-label">Password</label> <input class="form-control" placeholder="비밀번호 입력" type="password" id="pw" onchange="sendpassword()" name="pw">
					<input type="hidden" id="passwordpass" name="passwordpass" value="unChecked">
					<p>'숫자', '문자' 무조건 1개 이상, '최소 8자에서 최대 20자' 허용 <br>(특수문자는 정의된 특수문자만 사용 가능)</p>
					<div style="text-align: left">
				<font id="chkNoticeP" size="2"></font>
				
			</div>
			</div>
			<div class="form-group label-floating">
				<label class="control-label">Password Check</label> <input class="form-control" placeholder="비밀번호 확인" type="password" id="pw2" name="pw2">
					<input type="hidden" id="passwordCheck" name="passwordCheck" value="unChecked">
			</div>
			<div style="text-align: left">
				<font id="chkNoticeP2" size="2"></font>
			<button type="button" onclick="updatePw()" class="btn btn-md btn-primary full-width">비밀번호 변경</button>
	</div>
</div>

	

			
</div>

</body>
</html>