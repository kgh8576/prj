<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.btnw {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    /* padding: .375rem .75rem; */
    /* font-size: 1rem; */
    /* line-height: 1.5; */
    border-radius: .25rem;
    transition: background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
    }

.hpchange {
	font-family: sans-serif;
	font-weight: 600;
	float: right;
	color: #110202;
}

.looksNotBtn {
	padding: 0;
	border: none;
	background: none;
	outline: none;
}

.looksNotBtn:focus {
	padding: 0;
	border: none;
	background: none;
	outline: none;
}

.looksNotBtn:hover {
	color: #FB522D;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(
			function() {

				//현재 휴대폰번호 비교 후 다를때 휴대폰인증
				var hpnumber = document.getElementById("hp");
				var hiddenhp = document.getElementById("hiddenhp").value;

				hpnumber.onchange = function(e) {
					$.ajax({
						url : 'realhpcheck.do',
						data : {
							hp : $('#hp').val(),
						},
						type : 'post',
						success : function(data) {
							var hpno = document.getElementById("hp").value;
							if (data == 1) {
								if (hiddenhp == hpno) {

									$('#NoticeHP')
											.html('핸드폰번호가 같습니다 사용할수없습니다.')
											.attr('color', '#f82a2aa3');
									$('#hp').val('');
									frm.hp.focus();
								} else {
									$('#NoticeHP').html('입력완료 인증번호받기를 눌러주세요.')
											.attr('color', '#007bff');
									$('#hiddenpass').val('Checked');
								}

							} else {
								$('#NoticeHP').html('휴대폰번호 형식이 맞지않습니다.').attr(
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
				//인증번호확인
				var hpnumber = document.getElementById("hppass");
				hpnumber.onchange = function(e) {
					$.ajax({
						url : 'checkSMS.do',
						data : {
							insertCode : $('#hppass').val(),
						},
						type : 'post',
						success : function(data) {
							console.log(data);
							if (data == 1) {
								$('#hppasschk').val('Checked');
								$('#NoticeHP').html('인증이 완료되었습니다.').attr(
										'color', '#007bff');
							} else {
								$('#hppasschk').val('unChecked');
								$('#NoticeHP').html('인증번호가 틀렸습니다.').attr(
										'color', '#f82a2aa3');
							}
						},
						error : function(err) {
							console.log(err);
							console.log("핸드폰번호 인증 에러");
						}
					})
				};
			});
	function hpchange() {
		document.getElementById("phoneNochange").style.display = 'block';
	}
	function hppasscancle() {
		document.getElementById("phoneNochange").style.display = 'none';
	}
	function siche_next() {
		if (document.getElementById("hp").value.length == 11) {
			document.getElementById("hppass").focus();
		}
		if (document.getElementById("hppass").value.length == 4) {
			document.getElementById("hpfinalcheck").focus();
		}
	}
	//핸드폰인증 번호전송
	function hpbtn() {
		var button_joinus = document.getElementById('hpcheckbtn');
		if (frm.hp.value == "") {
			alert("핸드폰번호를 입력해주세요.");
		}
		if (document.getElementById("hiddenpass").value == "unChecked") {
			alert("핸드폰번호를 정상적으로 입력했는지 확인해주세요.");
		} else {
			$.ajax({
				url : 'sendSMS.do',
				data : {
					hp : $('#hp').val(),
				},
				type : 'post',
				success : function(data) {
					frm.hppass.focus();
					button_joinus.disabled = true;
					$('#NoticeHP').html('인증번호가 전송되었습니다.').attr('color',
							'#007bff');

				},
				error : function(err) {
					console.log(err);
					console.log("휴대폰 인증에러");
				}
			})
		}
	};
	function hpsubmit() {
		if (frm.hppasschk.value == "unChecked") {
			alert("인증번호를 다시 한번 입력해주세요");
			return false;
		} else {
			frm.submit();
		}
	}
</script>
</head>
<body>
	<div class="content-wrapper">
		<div class="container-fluid overflow-hidden">
			<div class="row margin-tb-90px margin-lr-10px sm-mrl-0px">
				<!-- Page Title -->
				<div id="page-title"
					class="padding-30px background-white full-width">
					<div class="container">
						<ol class="breadcrumb opacity-5">
							<li><a href="main.do">홈으로</a></li>
							<li class="active">나의 프로필</li>
						</ol>
						<h1 class="font-weight-300">나의 프로필</h1>
					</div>
				</div>
				<!-- // Page Title -->

				<div class="row margin-tb-45px full-width">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-6 margin-bottom-20px">
								<label><i class="far fa-user margin-right-10px"></i>${user.name }
									님 반갑습니다.</label> <input type="hidden" id="hiddenhp" value="${user.hp }">
								<input type="hidden" id="hiddenpass" value="unChecked">
							</div>
							<div class="col-md-6 margin-bottom-20px">
								<label><i class="fas fa-mobile-alt margin-right-10px"></i>
									연락처 : ${user.hp }
									<button type="button" class="btnw btn-primary" style="margin-left: 25px" onclick="hpchange()">수정</button></label>
								<form id="frm" action="hpchange.do" method="post">
									<input type="hidden" id="hppasschk" name="hppasschk"
										value="unChecked">
									<div id="phoneNochange" style="display: none;">
										<strong>변경할 연락처</strong>
										<p></p>
										<input style="float: left; width: 75%; margin-right: 20px;"
											class="form-control" min="11" maxlength="11" type="text"
											id="hp" name="hp" placeholder="변경할 연락처를 입력해주세요"
											onkeyup='siche_next()'>

										<button type="button" class="btnw btn-primary" id="hpcheckbtn"
											name="hpcheckbtn" style="padding: .375rem .75rem;" onclick="hpbtn()">전송</button>

										<br> <br>
										<div style="text-align: left">
											<font id="NoticeHP" size="2"></font>
										</div>
										<p></p>
										<strong>인증번호 입력</strong>
										<p></p>
										<input style="width: 50%;" class="form-control" min="4"
											maxlength="4" type="text" id="hppass" name="hppass"
											placeholder="인증번호" onkeyup='siche_next()'>
										<p></p>
										<button class="btnw btn-primary" type="button" onclick="hppasscancle()">수정취소</button>
										<button class="btnw btn-primary" type="button" class="hpfinalcheck" id="hpfinalcheck"
											name="hpfinalcheck" style="margin-left: 30px;"
											onclick="hpsubmit()">수정완료</button>
									</div>
								</form>
							</div>
							<div class="col-md-6" style="margin-bottom: 20px">
								<label><i class="fas fa-link margin-right-10px"></i> 가입
									하신날짜 : ${user.regday }</label>
							</div>
							<div class="col-md-6" style="margin-bottom: 20px">
								<label><i class="fas fa-info margin-right-10px"></i> 현재
									보유중인 적립금 : ${user.point } POINT</label>
							</div>
							<div class="col-md-6 margin-bottom-20px">
								<label><i class="fas fa-lock margin-right-10px"></i></label> <a
									href="pwchangepage.do">비밀번호 변경하기</a>
							</div>
							<div class="col-md-6 margin-bottom-20px">
								♥&nbsp;&nbsp;&nbsp;
								<button type="button" class="looksNotBtn" data-toggle="modal"
									data-target="#preferenceFrmModal">관심 분야 변경</button>
							</div>
							<div class="col-md-6 margin-bottom-20px">
								<label><svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" fill="currentColor"
										class="bi bi-emoji-expressionless-fill" viewBox="0 0 16 16">
								  <path
											d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM4.5 6h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm5 0h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm-5 4h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1z" />
								</svg></label>&nbsp;&nbsp;&nbsp;<a href="conallList.do">모든신청내역</a>
							</div>
							<div class="col-md-6 margin-bottom-20px">
								<label><svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" fill="currentColor"
										class="bi bi-emoji-expressionless-fill" viewBox="0 0 16 16">
								  <path
											d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM4.5 6h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm5 0h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm-5 4h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1z" />
								</svg></label>&nbsp;&nbsp;&nbsp;<a href="noshow.do">Noshow</a>
							</div>
						</div>
						<hr class="margin-tb-40px">
						<div class="row" style="background-color: #e1e1e133;">
							<div class="col-md-6">
								<strong> 가장 가까운 예약목록 </strong>><br> <br>
								<c:choose>
									<c:when test="${!empty conhis}">
										<c:forEach var="conhis" begin="0" end="0" items="${conhis }">
											
											<c:if 
												test="${conhis.codecontent eq '예약중' || conhis.codecontent eq '예약확정' || conhis.codecontent eq '상담중'}">
												<div>
													<h3>${conhis.title }</h3>
													<p>예약날짜 : ${conhis.day }</p>
													<p>예약시간 : ${conhis.time }</p>
													<p>예약신청한날짜 : ${conhis.reservateDate }</p>
													<p>디자이너 : ${conhis.desName }</p>
													<p>상세정보 : ${conhis.detail }</p>
												</div>
												<div style="text-align: center;">
												<button type="button" class="btnw btn-primary" style="margin-left: 25px" onclick="location.href='consulting.do' ">상담하러가기</button>
												<button type="button" class="btnw btn-primary" style="margin-left: 25px" onclick="location.href='conhispage.do' ">더보기</button>	
												</div>
											</c:if>
									

										</c:forEach>
									</c:when>
									<c:otherwise>
										<div>
											<p>아직까지 예약된 내역이없습니다!</p>
											<p>나에게 맞는 선생님을 찾으러 가볼까요?</p>
											<button type="button" class="btnw btn-primary" onclick="location.href='category.do' ">찾으러가기!</button>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-md-6">
								<strong> 상담이 끝난 목록</strong>><br> <br>
								<c:choose>
									<c:when test="${!empty conccode005}">
										<c:forEach var="conccode005" begin="0" end="0"
											items="${conccode005 }">
											<c:if test="${conccode005.codecontent eq '상담완료'}">
												<div>
													<h3>${conccode005.title }</h3>
													<p>예약날짜 : ${conccode005.day }</p>
													<p>예약시간 : ${conccode005.time }</p>
													<p>예약신청한날짜 : ${conccode005.reservateDate }</p>
													<p>디자이너 : ${conccode005.desName }</p>
													<p>상세정보 : ${conccode005.detail }</p>
												</div>
												<div style="text-align: center;">
												<button type="button" class="btnw btn-primary" onclick="location.href='confinish.do' ">더보기!</button>
												</div>
											</c:if>
											
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div>
											<p>아직까지 컨설팅 받은 내역이없습니다!</p>
											<p>나에게 맞는 선생님을 찾으러 가볼까요?</p>
											<button type="button" class="btnw btn-primary" onclick="location.href='category.do' ">찾으러가기!</button>
										</div>
									</c:otherwise>
								</c:choose>
							</div>

							<!-- Modal -->
							<div class="modal fade" id="preferenceFrmModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Modal
												title</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<form id="preferenceFrm" action="memDetailInsert.do"
												method="post">
												<h5>내가 필요한 서비스는...</h5>
												<h6 align="right" style="color: grey;">다중 선택 가능</h6>
												<div class="select" style="text-align: center;"
													id="needService">
													<input class="check" type="checkbox" name="YesorNo"
														id="makeupyn1" value="Y"><label
														style="width: 60px;" for="makeupyn1"> 메이크업 </label> <input
														class="finalcheck" type="hidden" id="makeupyn"
														name="makeupyn"> <input class="check"
														type="checkbox" name="YesorNo" id="cutyn1" value="Y"><label
														style="width: 60px;" for="cutyn1"> 커트 </label> <input
														class="finalcheck" type="hidden" id="cutyn" name="cutyn">
													<input class="check" type="checkbox" name="YesorNo"
														id="permyn1" value="Y"><label style="width: 60px;"
														for="permyn1"> 펌 </label> <input class="finalcheck"
														type="hidden" id="permyn" name="permyn"> <input
														class="check" type="checkbox" name="YesorNo" id="dyeyn1"
														value="Y"> <label style="width: 60px;"
														for="dyeyn1"> 염색 </label> <input class="finalcheck"
														type="hidden" id="dyeyn" name="dyeyn">
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												onclick="preFrmSubmit()">제출</button>
										</div>
									</div>
								</div>
							</div>


						</div>
						<div style="text-align: left; margin-top: 200px">
							<p>
								새로운 사람이 되어서 더이상 이용 하시지 않으시려면? <a href="exitpage.do"
									style="color: red;"> 회원탈퇴 바로가기 ☜ </a>
							</p>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid-->
</body>
</html>