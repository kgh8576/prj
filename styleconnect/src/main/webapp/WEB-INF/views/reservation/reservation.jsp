<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Foogra - Discover & Book the best restaurants at the best price">
    <meta name="author" content="Ansonika">
    <title>예약하기</title>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/reservationreso/css/bootstrap_customized.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/reservationreso/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="${pageContext.request.contextPath}/resources/reservationreso/css/detail-page.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/reservationreso/css/custom.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	function selectTime(time) {
		console.log(time)
		$("#selected_time").text(time);
	}
</script>
<script>
$(function() {
	$("#check_module").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp17015271');
		IMP.request_pay({
			pg: 'kakao', 
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: '주문명:결제테스트',
			amount: 1000,
			buyer_email: 'iamport@siot.do',
			buyer_name: '구매자이름',
			buyer_tel: '010-1234-5678',
			buyer_addr: '서울특별시 강남구 삼성동',
			buyer_postcode: '123-456',
			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
		}, function (rsp) {
			console.log(rsp);
			if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
			alert(msg);
		});
	});
})

</script>


</head>

<body>
	<br><br><br><br>
	<main>
		<div class="container margin_detail">
		    <div class="row">
		        <div class="col-lg-8">

		            <div class="tabs_detail">
		                <ul class="nav nav-tabs" role="tablist">
		                    <li class="nav-item">
		                        <a id="tab-A" href="#pane-A" class="nav-link active" data-toggle="tab" role="tab">상담 정보</a>
		                    </li>
		                    <li class="nav-item">
		                        <a id="tab-B" href="#pane-B" class="nav-link" data-toggle="tab" role="tab">전문가 정보</a>
		                    </li>
		                </ul>

		                <div class="tab-content" role="tablist">
		                    <div id="pane-A" class="card tab-pane fade show active" role="tabpanel" aria-labelledby="tab-A">
		                        <div class="card-header" role="tab" id="heading-A">
		                            <h5>
		                                <a class="collapsed" data-toggle="collapse" href="#collapse-A" aria-expanded="true" aria-controls="collapse-A">
		                                    상담 정보
		                                </a>
		                            </h5>
		                        </div>
		                        <div id="collapse-A" class="collapse" role="tabpanel" aria-labelledby="heading-A">
		                            <div class="card-body info_content">
		                            	<h2></h2>
		                            	<h2 align="left">상담 상세 정보</h2>
		                            	<p>${course.detail}</p>
		                            	<div class="add_bottom_25"></div>
		                                <h2>디자이너가 했던 사진들</h2>
		                                <div class="pictures magnific-gallery clearfix">
		                                    <figure><a href="${pageContext.request.contextPath}/resources/reservationreso/img/detail_gallery/detail_1.jpg" title="Photo title" data-effect="mfp-zoom-in"><img src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_placeholder.jpg" data-src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_1.jpg" class="lazy" alt=""></a></figure>
		                                    <figure><a href="${pageContext.request.contextPath}/resources/reservationreso/img/detail_gallery/detail_2.jpg" title="Photo title" data-effect="mfp-zoom-in"><img src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_placeholder.jpg" data-src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_2.jpg" class="lazy" alt=""></a></figure>
		                                    <figure><a href="${pageContext.request.contextPath}/resources/reservationreso/img/detail_gallery/detail_3.jpg" title="Photo title" data-effect="mfp-zoom-in"><img src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_placeholder.jpg" data-src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_3.jpg" class="lazy" alt=""></a></figure>
		                                    <figure><a href="${pageContext.request.contextPath}/resources/reservationreso/img/detail_gallery/detail_4.jpg" title="Photo title" data-effect="mfp-zoom-in"><img src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_placeholder.jpg" data-src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_4.jpg" class="lazy" alt=""></a></figure>
		                                    <figure><a href="${pageContext.request.contextPath}/resources/reservationreso/img/detail_gallery/detail_5.jpg" title="Photo title" data-effect="mfp-zoom-in"><span class="d-flex align-items-center justify-content-center">+10</span><img src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_placeholder.jpg" data-src="${pageContext.request.contextPath}/resources/reservationreso/img/thumb_detail_5.jpg" class="lazy" alt=""></a></figure>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="form-group">
                                    <label>디자이너 선생님에게 전할 말을 남겨 주세요 </label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Ex)저는 심한 곱슬이에요 / 파마를 하려고 해요!"></textarea>
                                </div>
		                    </div>
		                    <!-- /tab -->
							<!-- 디자이너 정보 탭 -->
		                    <div id="pane-B" class="card tab-pane fade" role="tabpanel" aria-labelledby="tab-B">
		                        <div class="card-header" role="tab" id="heading-B">
		                            <h5>
		                                <a class="collapsed" data-toggle="collapse" href="#collapse-B" aria-expanded="false" aria-controls="collapse-B">
		                                    전문가 정보
		                                </a>
		                            </h5>
		                        </div>
		                        <div id="collapse-B" class="collapse" role="tabpanel" aria-labelledby="heading-B">
		                            <div id="page-title" class="padding-tb-30px gradient-white">
								        <div class="container">
								            <h1 class="font-weight-300">${course.name}  이름 디자이너</h1>
								        </div>
								        <!-- 프로필(경력) -->
					                    <div class="margin-bottom-30px box-shadow">
					                        <div class="padding-30px background-white">
					                            <h3><i class="far fa-hospital margin-right-10px text-main-color"></i> 경력 </h3>
					                            <hr>
					                            <p class="text-grey-2">${course.career }</p>
					                        </div>
					                    </div>
					                    <div class="margin-bottom-30px box-shadow">
					                        <div class="padding-30px background-white">
					                            <h3><i class="far fa-hospital margin-right-10px text-main-color
					                            "></i> 전문분야 </h3>
					                          <!-- Post tags -->
					                        <hr>
					                        <div class="post-tags">
					                            <div>
													<c:set var="majors" value="${fn:split(course.major,',')}"></c:set>
														<c:forEach var="major" items="${majors}">
														<a href="#"> <span class="text-grey-2"># ${major} </span> </a>
													</c:forEach>
												</div>
					                            <!-- // Post tags -->
					                        </div>
					                        </div>
					                    </div>
							    	</div>
		                        </div>
		                    </div>
		                </div>
		                <!-- /tab-content -->
		            </div>
		            <!-- /tabs_detail -->
		        </div>
		        <!-- /col -->

		        <div class="col-lg-4" id="sidebar_fixed">
		            <div class="box_booking">
		                <div class="head">
		                    <h3>예약할 날짜를 선택해주세요</h3>
		                </div>
		                <!-- /head -->
		                <div class="main">
		                    <input type="text" id="datepicker_field">
		                    <div id="DatePicker"></div>
		                    <div>
			                    <div class="dropdown time">
			                        <a href="#" data-toggle="dropdown">Hour <span id="selected_time"></span></a>
			                        <div class="dropdown-menu">
			                            <div class="dropdown-menu-content">
			                                <h4>예약가능시간</h4>
			                                <div class="radio_select add_bottom_15">
			                                    <ul class="can_reservation_time">
													원하는 날짜를 선택하면 예약 가능한 시간이 표시됩니다.
			                                    </ul>
			                                </div>
			                                <!-- /time_select -->
			                            </div>
			                        </div>
			                    </div>
		                    </div>
		                    <!-- /dropdown -->
		                    <input type="hidden" id="courNo" name="courNo" value="${course.courNo}">
		                    <a href="#" id="check_module" class="btn_1 full-width mb_5">예약하기</a>
		                </div>
		            </div>
		            <!-- /box_booking -->
		        </div>
		    </div>
		    <!-- /row -->
		</div>
		<!-- /container -->
	</main>
	<!-- /main -->
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/reservationreso/js/common_scripts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/reservationreso/js/common_func.js"></script>
    <script src="${pageContext.request.contextPath}/resources/reservationreso/assets/validate.js"></script>
    <!-- SPECIFIC SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/reservationreso/js/sticky_sidebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/reservationreso/js/specific_detail.js"></script>
	<script src="${pageContext.request.contextPath}/resources/reservationreso/js/datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/reservationreso/js/datepicker_func_1.js"></script>

</body>
