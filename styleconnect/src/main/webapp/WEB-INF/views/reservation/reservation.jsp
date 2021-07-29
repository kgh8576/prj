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

     <!-- GOOGLE WEB FONT -->

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
		                            	<p>Mei at intellegat reprehendunt, te facilisis definiebas dissentiunt usu. Choro delicata voluptatum cu vix. Sea error splendide at. Te sed facilisi persequeris definitiones, ad per scriptorem instructior, vim latine adipiscing no. Cu tacimates salutandi his, mel te dicant quodsi aperiri. Unum timeam his eu.</p>
		                            	<p>An malorum ornatus nostrum vel, graece iracundia laboramus cu ius. No pro mazim blandit instructior, sumo voluptaria has et, vide persecuti abhorreant ne est.</p>
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
								            <h1 class="font-weight-300">디자이너 이름 디자이너</h1>
								        </div>
								        <!-- 프로필(경력) -->
					                    <div class="margin-bottom-30px box-shadow">
					                        <div class="padding-30px background-white">
					                            <h3><i class="far fa-hospital margin-right-10px text-main-color"></i> 경력 </h3>
					                            <hr>
					                            <p class="text-grey-2">${designer.career }</p>
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
													<c:set var="majors" value="${fn:split(designer.major,',')}"></c:set>
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
		                    <input type="hidden" id="courNo" name="courNo" value="${courNo}">
		                    <a href="#" class="btn_1 full-width mb_5">예약하기</a>
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
