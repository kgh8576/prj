
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style>
.select input[type=radio] {
	display: none;
}
/* .select input[type=checkbox] {
	display: none;
} */
.select input[type=radio]+label {
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

.select input[type=radio]+label {
	background-color: #fff;
	color: #333;
}

.select input[type=checkbox]+label {
	background-color: #fff;
	color: #333;
}

.select input[type=radio]:checked+label {
	background-color: #333;
	color: #fff;
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

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
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

.filebox .upload-display img {
  display: block;
  max-width: 100%;
  width: 100% \9;
  height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
  border-color: #2e6da4;
}
</style>
</head>

<script>
$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});
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
					$('#chkNotice2').html('이미 가입중이거나, 회원 탈퇴한 회원입니다.').attr(
							'color', '#f82a2aa3');
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
		if (frm.hp.value == "") {
			alert("핸드폰 번호를 입력해주세요.");
			frm.hp.focus();
			return false;
		}
		if (frm.gender.value == "") {
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
	
	function count_ck(obj){

		var chkbox = document.getElementsByName("major");
		var chkCnt = 0;
		for(var i=0;i<chkbox.length; i++){
			if(chkbox[i].checked){
				chkCnt++;
			}
		}
		if(chkCnt>3){
			alert("3개 까지만 선택이 가능합니다.");
			obj.checked = false;
			return false;
		}
	}

</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="container margin-bottom-100px">
	<!--======= log_in_page =======-->
	<div id="log-in"
		class="site-form log-in-form box-shadow border-radius-10">

		<div class="form-output">

			<form id="frm" action="memberInsert.do" method="post" enctype="multipart/form-data">
				<div id="1step">
					<div class="form-group label-floating">
						<label class="control-label">이름</label> <input
							class="form-control" placeholder="이름을 입력해주세요." type="text"
							name="name" id="name">
					</div>
					<div class="form-group label-floating">
						<label class="control-label">ID</label> <input
							class="form-control" oninput="checkId()"
							placeholder="사용 하실 아이디를 입력해주세요." type="text" name="id" id="id">
						<input type="hidden" id="idCheck" name="idCheck" value="unChecked">

					</div>
					<div style="text-align: left">
						<font id="chkNotice2" size="2"></font>
					</div>
					<div class="form-group label-floating">
						<label class="control-label">Password</label> <input
							class="form-control" placeholder="비밀번호 입력" type="password"
							id="pw" name="pw">
					</div>
					<div class="form-group label-floating">
						<label class="control-label">Password Check</label> <input
							class="form-control" placeholder="비밀번호 확인" type="password"
							id="pw2" name="pw2"> <input type="hidden"
							id="passwordCheck" name="passwordCheck" value="unChecked">
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

					<button type="button" onclick="nextpage()"
						class="btn btn-md btn-primary full-width">다음단계</button>

					<p>
						you have an account? <a href="page-login.html"> Sing in !</a>
					</p>
				</div>

				<!-- 1step end -->

				<div id="2step" style="display: none;">

					<div class="form-group label-floating">
						<label class="control-label">근무지 주소</label> <input type="button"
							onclick="execDaumPostcode()" value="우편번호 찾기"
							class="form-control required"
							style="color: #8054c5; background-color: #ffd888;"> <input
							type="text" id="postcode" name="postcode" placeholder="우편번호"
							readonly class="form-control required"> <input
							type="text" id="roadAddress" name="roadAddress"
							placeholder="도로명주소" readonly class="form-control required">
						<input type="text" id="extraAddress" name="extraAddress"
							placeholder="참고항목" readonly class="form-control required">
						<input type="text" id="detailAddress" name="detailAddress"
							placeholder="상세주소" class="form-control required"> <span
							id="guide" style="color: #999; display: none"></span>
					</div>
					<div class="form-group label-floating">
						<label class="control-label">전문분야</label>
						<div class="select" style="text-align: center;">
							<input type="radio" name="majorgender" id="majorgender"
								value="MALE"><label for="majorgender">남자</label> <input
								type="radio" name="majorgender" id="majorgender2" value="FEMALE"><label
								for="majorgender2">여자</label> <input type="radio"
								name="majorgender" id="majorgender3" value="ALL"><label
								for="majorgender3">성별무관</label>
						</div>

					</div>
					<div style="text-align: left">
						<font id="chkNotice2" size="2"></font>
					</div>
					<div class="form-group label-floating">
						<label class="control-label">다중선택가능</label>
						<div class="select" style="text-align: center; ">
							<input type="checkbox" style="display:none;" id="makeupyn" name="makeupyn" value="Y"><label style="width: 60px;" for="makeupyn"> 메이크업 </label> 
							<input type="checkbox" style="display:none;" id="cutyn" name="cutyn" value="Y"><label style="width: 60px;" for="cutyn"> 커트 </label>
							<input type="checkbox"style="display:none;"  id="permyn" name="permyn" value="Y"><label style="width: 60px;" for="permyn"> 펌 </label>
							<input type="checkbox" style="display:none;" id="dyeyn" name="dyeyn" value="Y"> <label style="width: 60px;" for="dyeyn"> 염색 </label>
						</div>
					</div>
					<div class="form-group label-floating">
						<label class="control-label">경력사항</label>
						<textarea class="textarea"
							placeholder="경력 사항을 적어주세요. &#13;&#10; ex) 청담동 OO헤어샵 2년 근무 &#13;&#10; - 디자이너 콘테스트 1등"
							id="career" name="career"></textarea>
					</div>
					<div style="text-align: left">
						<font id="chkNotice" size="2"></font>
					</div>

					<div class="form-group label-floating">
					<p>재직증명서나 미용자격증등을 첨부해주시면됩니다.</p>
						<div class="filebox bs3-primary preview-image">
							<input class="upload-name" value="파일선택" disabled="disabled"
								style="width: 200px;"> <label for="cergroupno">업로드</label>
							<input type="file" name = "cergroupno"id="cergroupno" class="upload-hidden">
						</div>


					</div>

					<button type="button" onclick="backpage()"
						class="btn btn-md btn-primary full-width">이전단계</button>
					<button type="button" onclick="next2page()"
						class="btn btn-md btn-primary full-width">다음단계</button>

					<p>
						you have an account? <a href="page-login.html"> Sing in !</a>
					</p>
				</div>

				<!-- 2step end -->

				<div id="3step" style="display: none;">
					<div class="form-group label-floating">
						<p>특별히 잘하는 스타일링이 있나요? 3개만 선택해주세요!</p>
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major1" value="탈색" onClick="count_ck(this);"><label for="major1">탈색</label>
							<input type="checkbox" style="display:none;" name="major" id="major2" value="댄디컷" onClick="count_ck(this);"><label for="major2">댄디컷</label> 
							<input type="checkbox" style="display:none;" name="major" id="major3" value="가르마펌" onClick="count_ck(this);"><label for="major3">가르마펌</label>
						</div>
					</div>
					<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major4" value="모즈 컷" onClick="count_ck(this);"><label for="major4">모즈 컷</label>
							<input type="checkbox" style="display:none;" name="major" id="major5" value="리젠트컷" onClick="count_ck(this);"><label for="major5">리젠트컷</label> 
							<input type="checkbox" style="display:none;" name="major" id="major6" value="포마드컷" onClick="count_ck(this);"><label for="major6">포마드컷</label>
						</div>
					</div>
					<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major7" value="쉐도우펌" onClick="count_ck(this);"><label for="major7">쉐도우펌</label>
							<input type="checkbox" style="display:none;" name="major" id="major8" value="메이크업" onClick="count_ck(this);"><label for="major8">메이크업</label> 
							<input type="checkbox" style="display:none;" name="major" id="major9" value="윈드펌" onClick="count_ck(this);"><label for="major9">윈드펌</label>
						</div>
					</div>
					<div class="form-group label-floating">
						 <div class="select" style="text-align: center;">
							<input type="checkbox" style="display:none;" name="major" id="major10" value="벌룬펌" onClick="count_ck(this);"><label for="major10">벌룬펌</label>
							<input type="checkbox" style="display:none;" name="major" id="major11" value="삭발" onClick="count_ck(this);"><label for="major11">삭발</label> 
							<input type="checkbox" style="display:none;" name="major" id="major12" value="투블럭" onClick="count_ck(this);"><label for="major12">투블럭</label>
						</div>
					</div>
					

					<button type="button" onclick="back2page()"
						class="btn btn-md btn-primary full-width">이전단계</button>
					<button style="background-color: #141d86;" type="button"
						id="desloginCheck" class="btn btn-md btn-primary full-width">가입하기</button>


					<p>
						you have an account? <a href="page-login.html"> Sing in !</a>
					</p>
				</div>

			</form>

		</div>
	</div>
</div>
<!--======= // log_in_page =======-->