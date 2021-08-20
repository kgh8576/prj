
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta name="google-signin-client_id"
	content="1094388177317-s2url1migf5dp566d9ssg48lrrd6cjcl.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
<style type="text/css">
.li1 {
	display: inline-block;
	border: 1px solid white;
	width: 205px;
	text-align: center;
	height: 50px;
	padding-top: 10px;
	margin: 0px;
	font-size: 18px;
}

.lit {
	display: inline-block;
	border: 1px solid white;
	width: 205px;
	text-align: center;
	height: 50px;
	background-color: #d8d8d8;
	padding-top: 10px;
	margin: 0px;
	font-size: 18px;
	background-color: #584ccb;
    color: white;
    font-weight: bold;
}

.ul1 {
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
//Cookie SameSite 설정하기
document.cookie = "safeCookie1=foo; SameSite=Lax"; 
document.cookie = "safeCookie2=foo"; 
document.cookie = "crossCookie=bar; SameSite=None; Secure";


	//맴버(개인회원) 로그인 스크립트
	$(function() {
		$('#loginCheck')
				.click(
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
							$
									.ajax({
										url : 'loginCheck.do',
										data : {
											id : $('#mid').val(),
											pw : $('#mpw').val(),
										},
										type : 'post',
										success : function(data) {
											console.log(data.result);
											if (data.result == 1) {
												console.log(data.result);
												location.href = "main.do";
											} else {
												$('#chkNotice')
														.html(
																'아이디나 비밀번호가 일치하지 않음<br>개인회원과 디자이너 회원의 구분을 확인해보세요.<br>')
														.attr('color',
																'#f82a2aa3');
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
		$('#desloginCheck')
				.click(
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
							$
									.ajax({
										url : 'desloginCheck.do',
										data : {
											id : $('#did').val(),
											pw : $('#dpw').val(),
										},
										type : 'post',
										success : function(data) {
											console.log(data.result);
											if (data.result == 1) {
												console.log(data.result);
												location.href = "main.do";
											} else {
												$('#chkNotice2')
														.html(
																'아이디나 비밀번호가 일치하지 않음<br>개인회원과 디자이너 회원의 구분을 확인해보세요.<br>')
														.attr('color',
																'#f82a2aa3');
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
	$(function() {
		$("#login_form").keypress(function(e) {
			if (e.keyCode === 13) {
				$('#loginCheck').click()
			}
		});
		$("#dlogin_form").keypress(function(e) {
			if (e.keyCode === 13) {
				$('#desloginCheck').click()
			}
		});
	})
/* 	//구글로그인
	function init() {
		gapi
				.load(
						'auth2',
						function() {
							gapi.auth2.init();
							options = new gapi.auth2.SigninOptionsBuilder();
							options.setPrompt('select_account');
							// 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
							options
									.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
							// 인스턴스의 함수 호출 - element에 로그인 기능 추가
							// GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
							gapi.auth2.getAuthInstance().attachClickHandler(
									'GgCustomLogin', options, onSignIn,
									onSignInFailure);
						})
	}

	function onSignIn(googleUser) {
		var access_token = googleUser.getAuthResponse().access_token
		$.ajax({
			// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
			url : 'https://people.googleapis.com/v1/people/me'
			// key에 자신의 API 키를 넣습니다.
			,
			data : {
				personFields : 'birthdays',
				key : 'AIzaSyDzynD1Fm1XcqGhfo70dmcsuw-JCA59k_c',
				'access_token' : access_token
			},
			method : 'GET'
		}).done(function(e) {
			//프로필을 가져온다.
			var profile = googleUser.getBasicProfile();
			console.log(profile)
		}).fail(function(e) {
			console.log(e);
		})
	}
	function onSignInFailure(t) {
		console.log(t);
	} */
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
			<li class="lit" onclick="membershow()">개인</li>
			<li class="li1" onclick="desshow()">디자이너</li>
		</ul>
		<div class="form-output">
			<form action="" id="login_form">
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
						
					</div>
					<a href="recoverIdPwPage.do?MEM" class="forgot">아이디/비밀번호를 잊으셧나요?</a>
				</div>
				<div style="text-align: left">
					<font id="chkNotice" size="2"></font>
				</div>

				<button type="button" id="loginCheck"
					class="btn btn-md btn-primary full-width">Login</button>
			</form>

			<div class="or"></div>
			<!-- <a href="javascript:void(0)" id="GgCustomLogin"
				class="btn btn-md bg-facebook full-width btn-icon-left"> Login
				with Google</a> -->
			<a id="kakao-login-btn" class="btn btn-md bg-facebook full-width btn-icon-left" style="background-color: #ffeb06; color: black;" onclick="kakaoLogin();">Login with Kakao</a>

			<p>
				아직 아이디가없다면? <a href="Insertchoice.do">지금 가입하세요!</a>
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
			<form action="" id="dlogin_form">
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
						
					</div>
					<a href="recoverIdPwPage.do?DES" class="forgot">아이디/비밀번호를 잊으셧나요?</a>
				</div>
				<div style="text-align: left">
					<font id="chkNotice2" size="2"></font>
				</div>

				<button type="button" id="desloginCheck"
					class="btn btn-md btn-primary full-width">Login</button>
			</form>

			<div class="or"></div>

			<p>
				아직 아이디가없다면? <a href="Insertchoice.do">지금 가입하세요!</a>
			</p>
		</div>
	</div>
	<!--======= // log_in_page =======-->

</div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('0e84245bac195e94931a7b3a03fed346'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  location.href = "kakaologin.do?id=" +response.id; 
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        	location.href = "main.do";
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>