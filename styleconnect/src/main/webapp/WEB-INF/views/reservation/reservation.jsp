<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Foogra - Discover & Book the best restaurants at the best price">
    <meta name="author" content="Ansonika">
    <title>Foogra - Discover & Book the best restaurants at the best price</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/reservationreso/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/reservationreso/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/reservationreso/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/reservationreso/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/reservationreso/img/apple-touch-icon-144x144-precomposed.png">

     <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/reservationreso/css/bootstrap_customized.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/reservationreso/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="${pageContext.request.contextPath}/resources/reservationreso/css/detail-page.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/reservationreso/css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function finddate() {
		var week = new Array('sun','mon','tue','wed','thu','fri','sat');
		var currentday =$("td[class*='ui-datepicker-current-day']");
		var day = currentday.text();
		var month = currentday.attr("data-month");
		var year = currentday.attr("data-year");
		var date = new Date(year, month, day);
		var weekLabel = week[date.getDay()];
		console.log(weekLabel);
		return weekLabel;
	}
	function findTime() {
		var desData = {
				id : "des05",
				week : finddate()
		}
		$.ajax({
			url:"workTime.do",
			type:"post",
			data:desData,
			success: function(data) {
				for ( var time of data) {
					console.log(time);
				}
			},
			error : function(err) {
				console.log(err);
			}
		})
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
		                        <a id="tab-A" href="#pane-A" class="nav-link active" data-toggle="tab" role="tab">Information</a>
		                    </li>
		                    <li class="nav-item">
		                        <a id="tab-B" href="#pane-B" class="nav-link" data-toggle="tab" role="tab">Reviews</a>
		                    </li>
		                </ul>

		                <div class="tab-content" role="tablist">
		                    <div id="pane-A" class="card tab-pane fade show active" role="tabpanel" aria-labelledby="tab-A">
		                        <div class="card-header" role="tab" id="heading-A">
		                            <h5>
		                                <a class="collapsed" data-toggle="collapse" href="#collapse-A" aria-expanded="true" aria-controls="collapse-A">
		                                    Information
		                                </a>
		                            </h5>
		                        </div>
		                        <div id="collapse-A" class="collapse" role="tabpanel" aria-labelledby="heading-A">
		                            <div class="card-body info_content">
		                            	<p>Mei at intellegat reprehendunt, te facilisis definiebas dissentiunt usu. Choro delicata voluptatum cu vix. Sea error splendide at. Te sed facilisi persequeris definitiones, ad per scriptorem instructior, vim latine adipiscing no. Cu tacimates salutandi his, mel te dicant quodsi aperiri. Unum timeam his eu.</p>
		                            	<p>An malorum ornatus nostrum vel, graece iracundia laboramus cu ius. No pro mazim blandit instructior, sumo voluptaria has et, vide persecuti abhorreant ne est.</p>
		                            	<div class="add_bottom_25"></div>
		                                <h2>Pictures from our users</h2>
		                                <!-- /pictures -->
		                                <h2>Da Alfredo Menu</h2>
		                                <h3>Starters</h3>
		                                <div class="menu_item">
		                                    <em>€9.90</em>
		                                    <h4>Imported Salmon Steak</h4>
		                                    <p>Base de arroz, aguacate, salmón noruego, semillas de sésamo, edamame, wakame y soja light</p>
		                                </div>
		                                <div class="menu_item">
		                                    <em>€7.90</em>
		                                    <h4>Poke bol</h4>
		                                    <p>Queso de cabra light, dátiles, jamón serrano y rúcula</p>
		                                </div>
		                                <div class="menu_item">
		                                    <em>€8.90</em>
		                                    <h4>Ensalada cesar</h4>
		                                    <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso proteínico y salsa césar 0%</p>
		                                </div>
		                                <hr>
		                                <h3>Main Course</h3>
		                                <div class="menu_item">
		                                    <em>€15.90</em>
		                                    <h4>Oriental</h4>
		                                    <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
		                                </div>
		                                <div class="menu_item">
		                                    <em>€11.90</em>
		                                    <h4>Vegan Burguer</h4>
		                                    <p>Medio pollo asado acompañado de arroz o patatas al toque masala</p>
		                                </div>
		                                <div class="menu_item">
		                                    <em>€10.90</em>
		                                    <h4>Indio Fit</h4>
		                                    <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso proteínico y salsa césar 0%</p>
		                                </div>
		                                <div class="content_more">
		                                    <div class="menu_item">
		                                        <em>€15.90</em>
		                                        <h4>Oriental</h4>
		                                        <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
		                                    </div>
		                                    <div class="menu_item">
		                                        <em>€11.90</em>
		                                        <h4>Vegan Burguer</h4>
		                                        <p>Medio pollo asado acompañado de arroz o patatas al toque masala</p>
		                                    </div>
		                                    <div class="menu_item">
		                                        <em>€10.90</em>
		                                        <h4>Indio Fit</h4>
		                                        <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso proteínico y salsa césar 0%</p>
		                                    </div>
		                                </div>
		                                <!-- /content_more -->
		                                <a href="#0" class="show_hide" data-content="toggle-text">Read More</a>
		                                <hr>
		                                <h3>Dessert</h3>
		                                <div class="menu_item">
		                                    <em>€15.90</em>
		                                    <h4>Oriental</h4>
		                                    <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
		                                </div>
		                                <div class="menu_item">
		                                    <em>€11.90</em>
		                                    <h4>Vegan Burguer</h4>
		                                    <p>Medio pollo asado acompañado de arroz o patatas al toque masala</p>
		                                </div>
		                                <div class="menu_item">
		                                    <em>€10.90</em>
		                                    <h4>Indio Fit</h4>
		                                    <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso proteínico y salsa césar 0%</p>
		                                </div>
		                                <div class="content_more">
		                                    <div class="menu_item">
		                                        <em>€15.90</em>
		                                        <h4>Oriental</h4>
		                                        <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
		                                    </div>
		                                    <div class="menu_item">
		                                        <em>€11.90</em>
		                                        <h4>Vegan Burguer</h4>
		                                        <p>Medio pollo asado acompañado de arroz o patatas al toque masala</p>
		                                    </div>
		                                    <div class="menu_item">
		                                        <em>€10.90</em>
		                                        <h4>Indio Fit</h4>
		                                        <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso proteínico y salsa césar 0%</p>
		                                    </div>
		                                </div>
		                                <!-- /content_more -->
		                                <a href="#0" class="show_hide" data-content="toggle-text">Read More</a>
		                                <div class="add_bottom_45"></div>
		                                <div class="special_offers add_bottom_45">
		                                    <h2>Special Offers</h2>
		                                    <div class="menu_item">
		                                        <em>€10.90</em>
		                                        <h4>Indio Fit</h4>
		                                        <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso proteínico y salsa césar 0%</p>
		                                    </div>
		                                    <div class="menu_item">
		                                        <em>€15.90</em>
		                                        <h4>Oriental</h4>
		                                        <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
		                                    </div>
		                                    <div class="menu_item">
		                                        <em>€11.90</em>
		                                        <h4>Vegan Burguer</h4>
		                                        <p>Medio pollo asado acompañado de arroz o patatas al toque masala</p>
		                                    </div>
		                                    <div class="menu_item">
		                                        <em>€10.90</em>
		                                        <h4>Indio Fit</h4>
		                                        <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso proteínico y salsa césar 0%</p>
		                                    </div>
		                                </div>
		                                <!-- /special_offers -->

		                                <div class="other_info">
		                                <h2>How to get to Pizzeria Alfredo</h2>
		                                <div class="row">
		                                	<div class="col-md-4">
		                                		<h3>Address</h3>
		                                		<p>27 Old Gloucester St, 4530<br><a href="https://www.google.com/maps/dir//Assistance+%E2%80%93+H%C3%B4pitaux+De+Paris,+3+Avenue+Victoria,+75004+Paris,+Francia/@48.8606548,2.3348734,14z/data=!4m15!1m6!3m5!1s0x47e66e1de36f4147:0xb6615b4092e0351f!2sAssistance+Publique+-+H%C3%B4pitaux+de+Paris+(AP-HP)+-+Si%C3%A8ge!8m2!3d48.8568376!4d2.3504305!4m7!1m0!1m5!1m1!1s0x47e67031f8c20147:0xa6a9af76b1e2d899!2m2!1d2.3504327!2d48.8568361" target="blank"><strong>Get directions</strong></a></p>
		                                		<strong>Follow Us</strong><br>
		                                		<p class="follow_us_detail"><a href="#0"><i class="social_facebook_square"></i></a><a href="#0"><i class="social_instagram_square"></i></a><a href="#0"><i class="social_twitter_square"></i></a></p>
		                                	</div>
		                                	<div class="col-md-4">
		                                		<h3>Opening Time</h3>
		                                		<p><strong>Lunch</strong><br> Mon. to Sat. 11.00am - 3.00pm<p>
		                                		<p><strong>Dinner</strong><br> Mon. to Sat. 6.00pm- 1.00am</p>
		                                		<p><span class="loc_closed">Sunday Closed</span></p>
		                                	</div>
		                                	<div class="col-md-4">
		                                		<h3>Services</h3>
		                                		<p><strong>Credit Cards</strong><br> Mastercard, Visa, Amex</p>
		                                		<p><strong>Other</strong><br> Wifi, Parking, Wheelchair Accessible</p>
		                                	</div>
		                                </div>
		                                <!-- /row -->
		                            	</div>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- /tab -->

		                    <div id="pane-B" class="card tab-pane fade" role="tabpanel" aria-labelledby="tab-B">
		                        <div class="card-header" role="tab" id="heading-B">
		                            <h5>
		                                <a class="collapsed" data-toggle="collapse" href="#collapse-B" aria-expanded="false" aria-controls="collapse-B">
		                                    Reviews
		                                </a>
		                            </h5>
		                        </div>
		                        <div id="collapse-B" class="collapse" role="tabpanel" aria-labelledby="heading-B">
		                            <div class="card-body reviews">
		                                <div class="row add_bottom_45 d-flex align-items-center">
		                                    <div class="col-md-3">
		                                        <div id="review_summary">
		                                            <strong>8.5</strong>
		                                            <em>Superb</em>
		                                            <small>Based on 4 reviews</small>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-9 reviews_sum_details">
		                                        <div class="row">
		                                            <div class="col-md-6">
		                                                <h6>Food Quality</h6>
		                                                <div class="row">
		                                                    <div class="col-xl-10 col-lg-9 col-9">
		                                                        <div class="progress">
		                                                            <div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
		                                                        </div>
		                                                    </div>
		                                                    <div class="col-xl-2 col-lg-3 col-3"><strong>9.0</strong></div>
		                                                </div>
		                                                <!-- /row -->
		                                                <h6>Service</h6>
		                                                <div class="row">
		                                                    <div class="col-xl-10 col-lg-9 col-9">
		                                                        <div class="progress">
		                                                            <div class="progress-bar" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
		                                                        </div>
		                                                    </div>
		                                                    <div class="col-xl-2 col-lg-3 col-3"><strong>9.5</strong></div>
		                                                </div>
		                                                <!-- /row -->
		                                            </div>
		                                            <div class="col-md-6">
		                                                <h6>Location</h6>
		                                                <div class="row">
		                                                    <div class="col-xl-10 col-lg-9 col-9">
		                                                        <div class="progress">
		                                                            <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
		                                                        </div>
		                                                    </div>
		                                                    <div class="col-xl-2 col-lg-3 col-3"><strong>6.0</strong></div>
		                                                </div>
		                                                <!-- /row -->
		                                                <h6>Price</h6>
		                                                <div class="row">
		                                                    <div class="col-xl-10 col-lg-9 col-9">
		                                                        <div class="progress">
		                                                            <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
		                                                        </div>
		                                                    </div>
		                                                    <div class="col-xl-2 col-lg-3 col-3"><strong>6.0</strong></div>
		                                                </div>
		                                                <!-- /row -->
		                                            </div>
		                                        </div>
		                                        <!-- /row -->
		                                    </div>
		                                </div>

		                                <div id="reviews">
		                                    <div class="review_card">
		                                        <div class="row">
		                                            <div class="col-md-2 user_info">
		                                                <h5>Lukas</h5>
		                                            </div>
		                                            <div class="col-md-10 review_content">
		                                                <div class="clearfix add_bottom_15">
		                                                    <span class="rating">8.5<small>/10</small> <strong>Rating average</strong></span>
		                                                    <em>Published 54 minutes ago</em>
		                                                </div>
		                                                <h4>"Great Location!!"</h4>
		                                                <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros eirmod scaevola sea. Et nec tantas accusamus salutatus, sit commodo veritus te, erat legere fabulas has ut. Rebum laudem cum ea, ius essent fuisset ut. Viderer petentium cu his. Tollit molestie suscipiantur his et.</p>
		                                                <ul>
		                                                    <li><a href="#0"><i class="icon_like"></i><span>Useful</span></a></li>
		                                                    <li><a href="#0"><i class="icon_dislike"></i><span>Not useful</span></a></li>
		                                                    <li><a href="#0"><i class="arrow_back"></i> <span>Reply</span></a></li>
		                                                </ul>
		                                            </div>
		                                        </div>
		                                        <!-- /row -->
		                                    </div>
		                                    <!-- /review_card -->
		                                    <div class="review_card">
		                                        <div class="row">
		                                            <div class="col-md-2 user_info">
		                                                <h5>Lukas</h5>
		                                            </div>
		                                            <div class="col-md-10 review_content">
		                                                <div class="clearfix add_bottom_15">
		                                                    <span class="rating">8.5<small>/10</small> <strong>Rating average</strong></span>
		                                                    <em>Published 10 Oct. 2019</em>
		                                                </div>
		                                                <h4>"Awesome Experience"</h4>
		                                                <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros eirmod scaevola sea. Et nec tantas accusamus salutatus, sit commodo veritus te, erat legere fabulas has ut. Rebum laudem cum ea, ius essent fuisset ut. Viderer petentium cu his. Tollit molestie suscipiantur his et.</p>
		                                                <ul>
		                                                    <li><a href="#0"><i class="icon_like"></i><span>Useful</span></a></li>
		                                                    <li><a href="#0"><i class="icon_dislike"></i><span>Not useful</span></a></li>
		                                                    <li><a href="#0"><i class="arrow_back"></i> <span>Reply</span></a></li>
		                                                </ul>
		                                            </div>
		                                        </div>
		                                        <!-- /row -->
		                                    </div>
		                                    <!-- /review_card -->
		                                    <div class="review_card">
		                                        <div class="row">
		                                            <div class="col-md-2 user_info">
		                                                <h5>Marika</h5>
		                                            </div>
		                                            <div class="col-md-10 review_content">
		                                                <div class="clearfix add_bottom_15">
		                                                    <span class="rating">9.0<small>/10</small> <strong>Rating average</strong></span>
		                                                    <em>Published 11 Oct. 2019</em>
		                                                </div>
		                                                <h4>"Really great dinner!!"</h4>
		                                                <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros eirmod scaevola sea. Et nec tantas accusamus salutatus, sit commodo veritus te, erat legere fabulas has ut. Rebum laudem cum ea, ius essent fuisset ut. Viderer petentium cu his. Tollit molestie suscipiantur his et.</p>
		                                                <ul>
		                                                    <li><a href="#0"><i class="icon_like"></i><span>Useful</span></a></li>
		                                                    <li><a href="#0"><i class="icon_dislike"></i><span>Not useful</span></a></li>
		                                                    <li><a href="#0"><i class="arrow_back"></i> <span>Reply</span></a></li>
		                                                </ul>
		                                            </div>
		                                        </div>
		                                        <!-- /row -->
		                                        <div class="row reply">
		                                            <div class="col-md-2 user_info">
		                                            </div>
		                                            <div class="col-md-10">
		                                                <div class="review_content">
		                                                    <strong>Reply from Foogra</strong>
		                                                    <em>Published 3 minutes ago</em>
		                                                    <p><br>Hi Monika,<br><br>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros eirmod scaevola sea. Et nec tantas accusamus salutatus, sit commodo veritus te, erat legere fabulas has ut. Rebum laudem cum ea, ius essent fuisset ut. Viderer petentium cu his. Tollit molestie suscipiantur his et.<br><br>Thanks</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <!-- /reply -->
		                                    </div>
		                                    <!-- /review_card -->
		                                </div>
		                                <!-- /reviews -->
		                                <div class="text-right"><a href="leave-review.html" class="btn_1">Leave a review</a></div>
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
		                    <h3>Book your table</h3>
		                    <div class="offer">Up to -40% off</div>
		                </div>
		                <!-- /head -->
		                <div class="main">
		                    <input type="text" id="datepicker_field">
		                    <div id="DatePicker"></div>
		                    <div>
			                    <div class="dropdown time">
			                        <a href="#" data-toggle="dropdown" onclick="findTime()">Hour <span id="selected_time"></span></a>
			                        <div class="dropdown-menu">
			                            <div class="dropdown-menu-content">
			                                <h4>예약가능시간</h4>
			                                <div class="radio_select add_bottom_15">
			                                    <ul>
			                                        <li>
			                                            <input type="radio" id="time_1" name="time" value="12.00am">
			                                            <label for="time_1">12.00</label>
			                                        </li>
			                                        <li>
			                                            <input type="radio" id="time_2" name="time" value="08.30pm">
			                                            <label for="time_2">12.30</label>
			                                        </li>
			                                        <li>
			                                            <input type="radio" id="time_3" name="time" value="09.00pm">
			                                            <label for="time_3">1.00</label>
			                                        </li>
			                                        <li>
			                                            <input type="radio" id="time_4" name="time" value="09.30pm">
			                                            <label for="time_4">1.30</label>
			                                        </li>
			                                    </ul>
			                                </div>
			                                <!-- /time_select -->
			                            </div>
			                        </div>
			                    </div>
		                    </div>
		                    <!-- /dropdown -->
		                    <div class="dropdown people">
		                        <a href="#" data-toggle="dropdown">People <span id="selected_people"></span></a>
		                        <div class="dropdown-menu">
		                            <div class="dropdown-menu-content">
		                                <h4>How many people?</h4>
		                                <div class="radio_select">
		                                    <ul>
		                                        <li>
		                                            <input type="radio" id="people_1" name="people" value="1">
		                                            <label for="people_1">1<em>-40%</em></label>
		                                        </li>
		                                        <li>
		                                            <input type="radio" id="people_2" name="people" value="2">
		                                            <label for="people_2">2<em>-40%</em></label>
		                                        </li>
		                                        <li>
		                                            <input type="radio" id="people_3" name="people" value="3">
		                                            <label for="people_3">3<em>-40%</em></label>
		                                        </li>
		                                        <li>
		                                            <input type="radio" id="people_4" name="people" value="4">
		                                            <label for="people_4">4<em>-40%</em></label>
		                                        </li>
		                                    </ul>
		                                </div>
		                                <!-- /people_select -->
		                            </div>
		                        </div>
		                    </div>
		                    <!-- /dropdown -->
		                    <a href="#" class="btn_1 full-width mb_5" onclick="finddate()">Reserve Now</a>
		                   <div class="text-center"><small>No money charged on this steps</small></div>
		                </div>
		            </div>
		            <!-- /box_booking -->
		            <ul class="share-buttons">
		                <li><a class="fb-share" href="#0"><i class="social_facebook"></i> Share</a></li>
		                <li><a class="twitter-share" href="#0"><i class="social_twitter"></i> Share</a></li>
		                <li><a class="gplus-share" href="#0"><i class="social_googleplus"></i> Share</a></li>
		            </ul>
		        </div>

		    </div>
		    <!-- /row -->
		</div>
		<!-- /container -->
		
	</main>
	<!-- /main -->

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<h3 data-target="#collapse_1">Quick Links</h3>
					<div class="collapse dont-collapse-sm links" id="collapse_1">
						<ul>
							<li><a href="submit-rider.html">Become a Rider</a></li>
							<li><a href="submit-restaurant.html">Add your restaurant</a></li>
							<li><a href="help.html">Help</a></li>
							<li><a href="account.html">My account</a></li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="contacts.html">Contacts</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3 data-target="#collapse_2">Categories</h3>
					<div class="collapse dont-collapse-sm links" id="collapse_2">
						<ul>
							<li><a href="grid-listing-filterscol.html">Top Categories</a></li>
							<li><a href="grid-listing-filterscol-full-masonry.html">Best Rated</a></li>
							<li><a href="grid-listing-filterscol-full-width.html">Best Price</a></li>
							<li><a href="grid-listing-filterscol-full-masonry.html">Latest Submissions</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
						<h3 data-target="#collapse_3">Contacts</h3>
					<div class="collapse dont-collapse-sm contacts" id="collapse_3">
						<ul>
							<li><i class="icon_house_alt"></i>97845 Baker st. 567<br>Los Angeles - US</li>
							<li><i class="icon_mobile"></i>+94 423-23-221</li>
							<li><i class="icon_mail_alt"></i><a href="#0">info@domain.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
						<h3 data-target="#collapse_4">Keep in touch</h3>
					<div class="collapse dont-collapse-sm" id="collapse_4">
						<div id="newsletter">
							<div id="message-newsletter"></div>
							<form method="post" action="assets/newsletter.php" name="newsletter_form" id="newsletter_form">
								<div class="form-group">
									<input type="email" name="email_newsletter" id="email_newsletter" class="form-control" placeholder="Your email">
									<button type="submit" id="submit-newsletter"><i class="arrow_carrot-right"></i></button>
								</div>
							</form>
						</div>
						<div class="follow_us">
							<h5>Follow Us</h5>
							<ul>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- /row-->
			<hr>
			<div class="row add_bottom_25">
				<div class="col-lg-6">
					<ul class="footer-selector clearfix">
						<li>
							<div class="styled-select lang-selector">
								<select>
									<option value="English" selected>English</option>
									<option value="French">French</option>
									<option value="Spanish">Spanish</option>
									<option value="Russian">Russian</option>
								</select>
							</div>
						</li>
						<li>
							<div class="styled-select currency-selector">
								<select>
									<option value="US Dollars" selected>US Dollars</option>
									<option value="Euro">Euro</option>
								</select>
							</div>
						</li>
					</ul>
				</div>
				<div class="col-lg-6">
					<ul class="additional_links">
						<li><a href="#0">Terms and conditions</a></li>
						<li><a href="#0">Privacy</a></li>
						<li><span>© Foogra</span></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!--/footer-->

	<div id="toTop"></div><!-- Back to top button -->
	
	<div class="layer"></div><!-- Opacity Mask Menu Mobile -->
	
	<!-- Sign In Modal -->
	<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
		<div class="modal_header">
			<h3>Sign In</h3>
		</div>
		<form>
			<div class="sign-in-wrapper">
				<a href="#0" class="social_bt facebook">Login with Facebook</a>
				<a href="#0" class="social_bt google">Login with Google</a>
				<div class="divider"><span>Or</span></div>
				<div class="form-group">
					<label>Email</label>
					<input type="email" class="form-control" name="email" id="email">
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="password" id="password" value="">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-left">
						<label class="container_check">Remember me
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="float-right"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<div class="text-center">
					<input type="submit" value="Log In" class="btn_1 full-width mb_5">
					Don’t have an account? <a href="account.html">Sign up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label>
						<input type="email" class="form-control" name="email_forgot" id="email_forgot">
						<i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to reset your password to a new preferred one.</p>
					<div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
				</div>
			</div>
		</form>
		<!--form -->
	</div>
	<!-- /Sign In Modal -->
	
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
</html>