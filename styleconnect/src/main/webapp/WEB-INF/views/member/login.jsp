
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style type="text/css">
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
</style>
</head>
<script>
//맴버(개인회원) 로그인 스크립트
	$(function() {
		$('#loginCheck').click(
				function() {
					if ($('#mid').val() == "") {
						alert('아이디를 입력하세요.');
						$('#mid').focus();
						return;
					}
					if ($('#mpw').val() == "") {
						alert('비밀번호를 입력하세요.');
						$('#mpw').focus();
						return;
					}
					$.ajax({
						url : 'loginCheck.do',
						data : {
							id : $('#mid').val(),
							pw : $('#mpw').val(),
						},
						type : 'post',
						success : function(data) {
							console.log(data);
							if (data == 1) {
								console.log(data);
								location.href = "main.do";
							} else {
								$('#chkNotice').html('비밀번호 일치하지 않음<br><br>')
										.attr('color', '#f82a2aa3');
							}
						},
						error : function(err) {
							console.log(err);
							console.log("로그인 에러");
						}
					});
				});
	});
	
	//디자이너 로그인
	$(function() {
		$('#desloginCheck').click(
				function() {
					if ($('#did').val() == "") {
						alert('아이디를 입력하세요.');
						$('#did').focus();
						return;
					}
					if ($('#dpw').val() == "") {
						alert('비밀번호를 입력하세요.');
						$('#dpw').focus();
						return;
					}
					$.ajax({
						url : 'desloginCheck.do',
						data : {
							id : $('#did').val(),
							pw : $('#dpw').val(),
						},
						type : 'post',
						success : function(data) {
							console.log(data);
							if (data == 1) {
								console.log(data);
								location.href = "main.do";
							} else {
								$('#chkNotice').html('비밀번호 일치하지 않음<br><br>')
										.attr('color', '#f82a2aa3');
							}
						},
						error : function(err) {
							console.log(err);
							console.log("로그인 에러");
						}
					});
				});
	});
	//회원로그인 분리 클릭액션
	function membershow() {
		document.getElementById("member").style.display = 'block';
		//document.getElementById("member").style.backgroundColor = '#d8d8d8';
		
		document.getElementById("des").style.display = 'none';
	}
	function desshow() {
		document.getElementById("des").style.display = 'block';
		//document.getElementById("des").setAttribute( 'background-color', '#d8d8d8' )

		document.getElementById("member").style.display = 'none';
	}
</script>
<br>
<br>
<br>
<br>
<br>

<div class="container margin-bottom-100px" id="member">
	<!--======= log_in_page =======-->

	<div id="log-in"
		class="site-form log-in-form box-shadow border-radius-10">
		<ul class="ul1">
			<li class="lit"  onclick="membershow()">일반</li>
			<li class="li1" onclick="desshow()">디자이너</li>
		</ul>
		<div class="form-output">
			<form>
				<div class="form-group label-floating">
					<label class="control-label">Your MEMBER ID</label> <input id="mid"
						name="id" class="form-control" placeholder="아이디를 입력해주세요!"
						type="text">
				</div>
				<div class="form-group label-floating">
					<label class="control-label">Your Password</label> <input
						class="form-control" placeholder="비밀번호를 입력해주세요." type="password"
						id="mpw" name="pw">
				</div>

				<div class="remember">
					<div class="checkbox">
						<label> <input name="optionsCheckboxes" type="checkbox">
							Remember Me
						</label>
					</div>
					<a href="#" class="forgot">Forgot my Password</a>
				</div>
				<div style="text-align: left">
					<font id="chkNotice" size="2"></font>
				</div>

				<button type="button" id="loginCheck"
					class="btn btn-md btn-primary full-width">Login</button>
			</form>

			<div class="or"></div>

			<a href="#" class="btn btn-md bg-facebook full-width btn-icon-left"><i
				class="fab fa-facebook margin-right-8px" aria-hidden="true"></i>
				Login with Facebook</a> <a href="#"
				class="btn btn-md bg-twitter full-width btn-icon-left"><i
				class="fab fa-twitter margin-right-8px" aria-hidden="true"></i>
				Login with Twitter</a>


			<p>
				Don't you have an account? <a href="page-sign-up.html">Register
					Now!</a>
			</p>
		</div>
	</div>
	<!--======= // log_in_page =======-->

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
			<form>
				<div class="form-group label-floating">
					<label class="control-label">Your ID</label> <input id="did"
						name="id" class="form-control" placeholder="아이디를 입력해주세요!"
						type="text">
				</div>
				<div class="form-group label-floating">
					<label class="control-label">Your Password</label> <input
						class="form-control" placeholder="비밀번호를 입력해주세요." type="password"
						id="dpw" name="pw">
				</div>

				<div class="remember">
					<div class="checkbox">
						<label> <input name="optionsCheckboxes" type="checkbox">
							Remember Me
						</label>
					</div>
					<a href="#" class="forgot">Forgot my Password</a>
				</div>
				<div style="text-align: left">
					<font id="chkNotice" size="2"></font>
				</div>

				<button type="button" id="desloginCheck"
					class="btn btn-md btn-primary full-width">Login</button>
			</form>

			<div class="or"></div>

			<a href="#" class="btn btn-md bg-facebook full-width btn-icon-left"><i
				class="fab fa-facebook margin-right-8px" aria-hidden="true"></i>
				Login with Facebook</a> <a href="#"
				class="btn btn-md bg-twitter full-width btn-icon-left"><i
				class="fab fa-twitter margin-right-8px" aria-hidden="true"></i>
				Login with Twitter</a>


			<p>
				Don't you have an account? <a href="page-sign-up.html">Register
					Now!</a>
			</p>
		</div>
	</div>
	<!--======= // log_in_page =======-->

</div>

