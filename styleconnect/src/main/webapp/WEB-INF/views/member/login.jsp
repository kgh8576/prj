
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	$(function() {
		$('#loginCheck').click(function() {
			if ($('#id').val() == "") {
				alert('아이디를 입력하세요.');
				$('#id').focus();
				return;
			}
			if ($('#pw').val() == "") {
				alert('비밀번호를 입력하세요.');
				$('#pw').focus();
				return;
			}
			$.ajax({
				url : 'loginCheck.do',
				data : {
					id : $('#id').val(),
					pw : $('#pw').val(),
				},
				type : 'post',
				success : function(data) {
					console.log(data);
					if (data == 1) {
						console.log(data);
						location.href = "main.do";
					} else {
						$('#chkNotice').html('비밀번호 일치하지 않음<br><br>').attr('color',
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
</script>

<div class="container margin-bottom-100px">
	<!--======= log_in_page =======-->
	<div id="log-in"
		class="site-form log-in-form box-shadow border-radius-10">

		<div class="form-output">
			<form>
				<div class="form-group label-floating">
					<label class="control-label">Your ID</label> <input id="id"
						name="id" class="form-control" placeholder="아이디를 입력해주세요!"
						type="text">
				</div>
				<div class="form-group label-floating">
					<label class="control-label">Your Password</label> <input
						class="form-control" placeholder="비밀번호를 입력해주세요." type="password"
						id="pw" name="pw">
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
