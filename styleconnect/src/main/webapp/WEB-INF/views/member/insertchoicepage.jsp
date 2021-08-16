<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style>
.login-head {
    width: 100%;
    height: 140px;
    padding: 40px 0;
    text-align: center;
    box-sizing: border-box;
    background-image: url(../images/bg-login.png);
    background-repeat: no-repeat;
    }
    .login-head strong {
    margin: 0;
    color: black;
    font-size: 24px;
    font-weight: 700;
    }
    .login-head p {
    margin: 0;
    color: black;
    font-size: 16px;
    font-weight: 500;
    }
    .join-wrap {
    position: relative;
    width: 100%;
    overflow: hidden;
    box-sizing: border-box;
    border: 1px solid #e6e6e6;
    }
    .bdt-no {
    border-top: none !important;
    }
    .bdb-no {
    border-bottom: none !important;
    }
    .join-form.join-idv {
    float: left;
    padding: 60px 80px;
    width: 50%;
    height: auto;
    box-sizing: border-box;
    border-right: 1px solid #e6e6e6;
    }
    .join-form.join-ent {
    float: right;
    padding: 60px 80px;
    width: 50%;
    height: auto;
    box-sizing: border-box;
    }
    .box-gray {
    position: relative;
    padding: 30px;
    background-color: #f5f5f5;
    text-align: center;
    }
    .join-form.join-ent .join-area {
    height: 212px;
    background-repeat: no-repeat;
    }
    .join-form.join-idv .join-area {
    height: 212px;
    background-repeat: no-repeat;
    }
    .join-form .join-area {
    position: relative;
    margin: 0 auto;
    width: 420px;
    overflow: hidden;
    }
</style>

</head>
<div>
<div class="login-top">
		<div class="login-head">
			<strong>개인회원과 디자이너 회원 중 원하는 유형을 선택해주세요.</strong>
			<p class="min-txt">개인회원과 디자이너의 두 개의 유형으로 회원가입이 가능합니다.</p>
		</div>
		<div class="join-wrap bdb-no">
			<!-- 개인회원 -->
			<div class="join-form join-idv">
				<div class="join-area">
					<a href="memberinsertpage.do" class="button blue"><img src="../insa/resources/assets/img/1.PNG"></a>
				</div>
			</div>
			
			<!-- 기업회원 -->
			<div class="join-form join-ent">
				<div class="join-area">
					<a href="desinsertpage.do" class="button navy"><img src="../insa/resources/assets/img/2.png"></a>
				</div>
			</div>
		</div>
		<div class="join-wrap bdt-no">
			<div class="join-form join-idv pd00">
				<div class="box-gray">
					<ul class="dot-list v1 v2">
						<li class="mt05" style="display: inline;">나만의 스타일을 찾기위한 회원!</li>
					</ul>
				</div>
			</div>
			<div class="join-form join-ent pd00">
				<div class="box-gray">
					<ul class="dot-list v1 w50pc float-l">
						<li class="mt05" style="display: inline;">고객의 미용을 책임지기 위한 회원! </li>
					</ul> 
				</div>
			</div>
		</div>
	</div>
	</div>