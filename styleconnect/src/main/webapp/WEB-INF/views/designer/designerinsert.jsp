
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style>
.select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
</style>
</head>

<script>
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
					$('#chkNotice2').html('사용가능한 아이디 입니다.').attr('color',
					'#f82a2aa3');
					$('#idCheck').val('Checked');
				}
			},
			error : function(err) {
				console.log(err);
				console.log("중복검사 에러");
			}
		})
	};
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
		if(frm.hp.value =="") {
			alert("핸드폰 번호를 입력해주세요.");
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

		if (frm.passwordCheck.value == 'unChecked') {
			alert("비밀번호를 다시 한번 똑같이 입력해주세요.");
			frm.pw2.focus();
			return false;
		}
		frm.submit();
	}
			
	function nextpage() {
		
		document.getElementById("1step").style.display = 'none';
		document.getElementById("2step").style.display = 'block';
		document.getElementById("3step").style.display = 'none';
		
	}
	function backpage() {
		document.getElementById("1step").style.display = 'block';
		document.getElementById("2step").style.display = 'none';
		document.getElementById("3step").style.display = 'none';
	}
	function next2page() {
		
		document.getElementById("1step").style.display = 'none';
		document.getElementById("2step").style.display = 'none';
		document.getElementById("3step").style.display = 'block';
		
	}
	function back2page() {
		
		document.getElementById("1step").style.display = 'none';
		document.getElementById("2step").style.display = 'block';
		document.getElementById("3step").style.display = 'none';
		
	}
	// 주소
	function execDaumPostcode() {
		
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("roadAddress").value = roadAddr;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
			
				}).open();
	}
	
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="container margin-bottom-100px">
	<!--======= log_in_page =======-->
	<div id="log-in"
		class="site-form log-in-form box-shadow border-radius-10">

		<div class="form-output">

			<form id="frm" action="memberInsert.do" method="post">
			<div id="1step">
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
						id="birth" name="birth" max="9999-12-31">
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
						class="form-control" placeholder="핸드폰번호입력" type="text" name="hp"
						id="hp">
				</div>

				<button type="button" onclick="nextpage()" class="btn btn-md btn-primary full-width">다음단계</button>

				<p>
					you have an account? <a href="page-login.html"> Sing in !</a>
				</p>
				</div>
				
				<!-- 1step end -->
				
				<div id="2step" style="display: none;">
				
				<div class="form-group label-floating">
					<label class="control-label">근무지 주소</label> <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"
					class="form-control required"
					style="color: #8054c5; background-color: #ffd888;"> <input
					type="text" id="postcode" name="postcode" placeholder="우편번호"
					readonly class="form-control required"> <input type="text"
					id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly
					class="form-control required"> <input type="text"
					id="extraAddress" name="extraAddress" placeholder="참고항목" readonly
					class="form-control required"> <input type="text"
					id="detailAddress" name="detailAddress" placeholder="상세주소"
					class="form-control required"> <span id="guide"
					style="color: #999; display: none"></span>
				</div>
				<div class="form-group label-floating">
					<label class="control-label">전문분야</label>
					<div class="select">
					<input type="radio" name="majorgender" id="majorgender" value="MALE" ><label for="select">남자</label>
					<input type="radio" name="majorgender" id="majorgender" value="FEMALE"><label for="select2">여자</label>
					<input type="radio" name="majorgender" id="majorgender" value="ALL"><label for="select3">성별무관</label>
					</div> 
						
				</div>
				<div style="text-align: left">
					<font id="chkNotice2" size="2"></font>
				</div>
				<div class="form-group label-floating">
					<label class="control-label">Password</label> <input
						class="form-control" placeholder="비밀번호 입력" type="password" id="pw"
						name="pw">
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
						id="birth" name="birth" max="9999-12-31">
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
						class="form-control" placeholder="핸드폰번호입력" type="text" name="hp"
						id="hp">
				</div>

				<button type="button" onclick="backpage()" class="btn btn-md btn-primary full-width">이전단계</button>
				<button type="button" onclick="next2page()" class="btn btn-md btn-primary full-width">다음단계</button>

				<p>
					you have an account? <a href="page-login.html"> Sing in !</a>
				</p>
				</div>
				
				<!-- 2step end -->
				
				<div id="3step" style="display: none;">
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
						id="birth" name="birth" max="9999-12-31">
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
						class="form-control" placeholder="핸드폰번호입력" type="text" name="hp"
						id="hp">
				</div>

				<button type="button" onclick="back2page()" class="btn btn-md btn-primary full-width">이전단계</button>
				<button style="background-color: #141d86;"type="button" id="desloginCheck"
					class="btn btn-md btn-primary full-width">가입하기</button>
			

				<p>
					you have an account? <a href="page-login.html"> Sing in !</a>
				</p>
				</div>
				
			</form>

		</div>
	</div>
</div>
<!--======= // log_in_page =======-->