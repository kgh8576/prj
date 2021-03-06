<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<title>Tabib HTML5 Health Directory Template</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style>
body {
	font-family: 'Gothic A1', sans-serif;
}

.wrapper {
	padding-top: 120px;
}

.card-body {
	text-align: center;
	box-shadow: 0px 15px 15px -8px rgba(0, 0, 0, 0.5)
}

.card-body h6 {
	font-size: 14px;
}

.card-title {
	text-transform: uppercase;
	font-weight: bold;
	font-size: 24px;
}

@media ( max-width : 800px) {
	.mx-30 {
		margin-bottom: 30px;
	}
}

#searchBox {
	width: 100%;
	margin-left: 0px;
	margin-right: 0px;
}
section .container img{
    height: 255px;
}
.padding-30px{
	height: 156px;
}
	.li1{
	 display: inline-block;
	 border: 1px solid white;
	width: 49%;
    text-align: center;
    height: 40px;
    padding-top: 10px;
    margin: 0px;
    font-size: 18px;
	
	}
	.lit{
	 display: inline-block;
	 border: 1px solid white;
	width: 49%;
    text-align: center;
    height: 40px;
    background-color: #584ccb;
    color:white; 
    font-weight:bold;
    padding-top: 10px;
    margin: 0px;
    font-size: 18px;
	
	}
	.ul1{
	display: block;
    list-style-type: disc;
	}

.modal-dialog {
    transform: translate(0, -50%);
    top: 30%;
    margin: 0 auto;
}
.title text-right {
	text-align:right;
}
.form-control {
	border-top-left-radius:10px;
	border-bottom-left-radius:10px;
	border: 0;
	box-shadow:0px 4px 10px -1px rgb(0 0 0 / 50%);
}

.text-main-color{
	color:black;
}

#main-search-button{
	background-color:black;
	border-top-right-radius:10px;
	border-bottom-right-radius:10px;
	border: 0;
	
}

.card-title, .card-titleH5 {
	display:inline;
}

.font-weight-1000{
 font-weight:1000;
}

.font-weight-800{
font-weight:800;
}

.margin-bottom-50{
margin-bottom:50px;
}

.margin-top-50 {
margin-top:50px;
}

.text-second-color{
color:black;
}
/*
.btn-info {
background-color:#6f60fc;
border:0;
}

.btn-info:hover {
    color: #fff;
    background-color: #6f60fc;
}
*/

</style>
<script>	
// ????????? ?????? ??? cut ????????????(????????????) ????????? ?????????
$(function() {
	topDesChange('cut');
	topDesChange('makeUp');
});

	// ?????? ?????? ??? ???????????? top3 ?????????, ??????, ?????????, ??? ?????? ???, ??????, ????????? ?????? ???????????? ajax    		
	function topDesChange(keyword) {
		$.ajax({
					url : 'ajaxTopDesChange.do',
					data : {
						keyword : keyword
					},
					success : function(result) {
						console.log(result);
						if (keyword != 'makeUp') {
							var targetKeyword = 'Hair';
						} else {
							var targetKeyword = 'MakeUp';
						}
						for (var i = 0; i < result.length; i++) {
							$('#target' + targetKeyword + 'Name' + (i + 1))
									.text(result[i].name); // ?????? ??????
							$('#target' + targetKeyword + 'Star' + (i + 1))
									.html(''); // ?????? ??? ?????????
							for (var j = 0; j < result[i].rate; j++) { // ?????? ??????
								$('#target' + targetKeyword + 'Star' + (i + 1))
										.append('<li class="active"></li>');
							}
							for (var j = 1; j <= 5-result[i].rate; j++){
								$('#target' + targetKeyword + 'Star' + (i + 1))
								.append('<li></li>');
							}
							$('#target' + targetKeyword + 'Image' + (i + 1))
									.attr(
											'src',
											'${pageContext.request.contextPath}/resources/img/'
													+ result[i].fileUuid); // ?????? ????????? ??????
							$('#target' + targetKeyword + 'ATag' + (i + 1))
									.attr(
											'href',
											'desListSelect.do?id='
													+ result[i].id); // A?????? ?????? ??????
							var sliced = result[i].major.split(',');
							$('#target' + targetKeyword + 'HashTag' + (i + 1))
									.html('');
							for (var j = 0; j < sliced.length; j++) { // ???????????? ??????????????? ?????? ??????
								$(
										'#target' + targetKeyword + 'HashTag'
												+ (i + 1))
										.append(
												'<a href="searchList.do?search='
														+ sliced[j]
														+ '"> <span class="text-grey-2">#'
														+ sliced[j]
														+ '</span> </a>');
							}
							$('#target' + targetKeyword + 'HashTag' + (i + 1))
									.append('');
							for (var j = 0; j < result.length; j++) { // ??? ?????? ?????? ??????
								$('#target' + targetKeyword + 'ReviewCnt' + (i + 1)).text(
										'??? ?????? ??? ' + result[i].count + '???');
							}
							console.log(i)
						}
						
					},
					error : function(err) {
						console.log(err);
					}
				});
	}
	function preFrmSubmit() {
		if ($("input:checkbox[name=YesorNo]:checked").length == 0) {
			alert("????????? ???????????? ???????????????");
			return false;
		}
		if (location == 'false') {
			alert("????????? ??????????????????");
			return false;
		}

		var locations = $('#location option:selected').val();
		var yncheck = document.getElementsByName("YesorNo");
		for (var i = 0; i < yncheck.length; i++) {
			if (yncheck[i].checked) {
				yncheck[i].value = "Y";
			} else {
				yncheck[i].value = "N";
			}
		}
		var permYn = $('#permyn1').val();
		var cutYn = $('#cutyn1').val();
		var dyeYn = $('#dyeyn1').val();
		var makeUpYn = $('#makeupyn1').val();

		$.ajax({
			url : 'memDetailInsert.do',
			method : 'post',
			data : {
				permYn : permYn,
				cutYn : cutYn,
				dyeYn : dyeYn,
				makeupYn : makeUpYn,
				location : locations
			},
			success : function(result) {
				alert('???????????????!');
				location.reload();
			},
			error : function(err) {
				console.log(err);
			}

		});
	}
	
	
	// ???????????? ??? ????????? ??????
	function show(exceptionLi) {
		$('ul#checkBar li').attr('class', 'li1');
		$('#'+exceptionLi).attr('class', 'lit');
		var gender = $('ul#checkBar .lit').attr('id');
		$.ajax({
			url:'getCrawlData.do',
			method:'post',
			data:{
				gender:gender
			},
			success:function(result){
				console.log(result);
				$('#hashTagOne').text('1. '+result.one);
				$('#hashTagTwo').text('2. '+result.two);
				$('#hashTagThree').text('3. '+result.three);
				$('#hashTagFour').text('4. '+result.four);
				$('#hashTagFive').text('5. '+result.five);
			},
			error:function(err){
				console.log(err)
			}
		});
	}
	/*
	   function searchKeywords(t){
		      var searchVal = $('#search').val();
		      if ( isNaN(searchVal) ) { // ????????? ?????????
		         $.ajax({
		            url : 'searchKeywordsList.do',
		            type : 'post',
		            data : {inputKeywords : searchVal },
		            success : function(result){
		               console.log(result);
		               if(result != null){
		                  var sourceList = [];
		                  for(var i = 0; i < result.length; i++){
		                     sourceList.push(result[i].planeKeyword);
		                  }
		                  console.log(sourceList);
		                  $("#search").autocomplete({  //?????? ???????????? ??????
		                     source: sourceList,
		                     focus : function(event, ui) { // ???????????? ?????????????????? ?????? ???????????? ????????????   
		                        return false;
		                     }
		                     //disabled: true, //???????????? ?????? ??????
		                  });
		               }
		            }, error: function(err){
		               console.log(err);
		            }
		         });
		      }
		   }
	*/
	
	
</script>
</head>

<body>





	<section class="banner padding-tb-200px sm-ptb-80px background-overlay"
		style="background-image: url('resources/assets/img/designTest/mainTestImg4.png');
			   padding-top: 0px; padding-bottom: 400px;">
		<div class="container z-index-2 position-relative">
		<div class="row justify-content-center margin-tb-60px">
				<div class="col-lg-2"></div>
				<div class="col-lg-7" style="padding-top: 0px; padding-bottom: 50px;">
					<div class="listing-search">
						<form id="frm" action="searchList.do" method="post">
							<div class="margin-top-20px">
								<div id="searchBox" style="height:80px;"> <!-- class="padding-30px background-white border-radius-10" ?????? : "height:180px" -->
									<!--  
									<h4>
										<i class="fas fa-search margin-right-10px text-main-color"></i>
										Search
									</h4>
									
									<hr>
									-->
									<div class="input-group mb-3">
										<input type="text" name="search" id="search"
											placeholder="???????????? ???????????????."
											class="form-control border-radius-0">
										<div class="input-group-append">
											<button
												class="btn btn-outline-secondary text-white background-main-color border-radius-0"
												id="main-search-button"
												type="submit">Search</button>
										</div>
									</div>
										<div align="center">
											<a href="searchList.do?search=?????????" class="text-primary">#?????????</a>&nbsp;&nbsp;&nbsp;
											<a href="searchList.do?search=?????????" class="text-primary">#?????????</a>&nbsp;&nbsp;&nbsp; 
											<a href="searchList.do?search=?????????" class="text-primary">#?????????</a>&nbsp;&nbsp;&nbsp;
										</div>
									
								</div>
							</div>
						</form>

						
					</div>
				</div>
				<div class="col-lg-3">
					<div class="hashTagList"
						style="display: inline-block; width: 200px; overflow: auto;">
						<h4 style="text-align:center"><strong>??????????????? ?????? ?????? ??????</strong></h4>
						<ul id="checkBar" class="ul1" style="padding-left: 0px;">
							<li class="lit" id="MALE" onclick="show('MALE')">??????</li>
							<li class="li1" id="FEMALE" onclick="show('FEMALE')">??????</li>
						</ul>
						<div class="list-group">
							<a class="list-group-item list-group-item-action" id="hashTagOne">1. ${hashTag.one }</a>
							<a class="list-group-item list-group-item-action" id="hashTagTwo">2. ${hashTag.two }</a>
							<a class="list-group-item list-group-item-action" id="hashTagThree">3. ${hashTag.three }</a>
							<a class="list-group-item list-group-item-action" id="hashTagFour">4. ${hashTag.four }</a>
							<a class="list-group-item list-group-item-action" id="hashTagFive">5. ${hashTag.five }</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<div class="title text-right">
				<p class="text-title-large font-weight-1000 margin-bottom-15px">STYLE
					CONNECT</p>
				<p class="font-weight-800 text-up-small">?????????
					?????? ??????????????? ???????????????!</p>
			</div>
			<!-- ????????? -->
			
		</div>
		<!-- ????????? ??? -->

	<!-- ???????????? ?????? div -->
	<div></div>
	</section>
	<div class="row justify-content-center margin-bottom-50 margin-top-50">
		<!-- ???????????? ?????? ?????? -->
		<c:if test="${empty memDetail && not empty id && id ne 'admin'}">
			<!-- modal Btn -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#preferenceFrmModal">??? ?????? ????????? ????????? ????????? ?????????
				????????????!</button>

			<!-- Modal -->
			<div class="modal fade" id="preferenceFrmModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="preferenceFrm" action="memDetailInsert.do"
								method="post">
								<h6 align="right" style="color: grey;">?????? ?????? ??????</h6>
								<div class="select" style="text-align: center;" id="needService">
									<input class="check" type="checkbox" name="YesorNo"	id="makeupyn1" value="Y"><label style="width: 60px;" for="makeupyn1"> ???????????? </label>
									<input class="finalcheck" type="hidden" id="makeupyn" name="makeupyn">
									<input class="check" type="checkbox" name="YesorNo" id="cutyn1"	value="Y"><label style="width: 60px;" for="cutyn1"> ?????? </label>
									<input class="finalcheck" type="hidden" id="cutyn" name="cutyn">
									<input class="check" type="checkbox" name="YesorNo" id="permyn1" value="Y"><label style="width: 60px;" for="permyn1"> ??? </label>
									<input class="finalcheck" type="hidden" id="permyn" name="permyn">
									<input class="check" type="checkbox" name="YesorNo" id="dyeyn1" value="Y"><label style="width: 60px;" for="dyeyn1"> ?????? </label>
									<input class="finalcheck" type="hidden" id="dyeyn" name="dyeyn">
								</div>

								<div class="input-group mb-3">
									<select class="custom-select" id="location" name="location" style="margin: auto;">
										<option disabled="disabled" selected="selected" value="false">????????? ??????</option>
										<optgroup label="???">
											<option value="??????">??????</option>
											<option value="??????">??????</option>
											<option value="??????">??????</option>
											<option value="??????">??????</option>
											<option value="??????">??????</option>
											<option value="??????">??????</option>
											<option value="??????">??????</option>
										</optgroup>
										<optgroup label="???">
											<option value="?????????">?????????</option>
											<option value="?????????">?????????</option>
											<option value="?????????">?????????</option>
											<option value="?????????">?????????</option>
											<option value="?????????">?????????</option>
										</optgroup>
									</select>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="preFrmSubmit()">??????</button>
						</div>
					</div>
				</div>
			</div>

		</c:if>
		<c:if test="${not empty memDetail }">


			<div class="wrapper">
				<div class="container">
					<h2
						class="text-title-large text-main-color font-weight-200 margin-bottom-15px"
						align="center">???????????? ??? ?????? ????????????</h2>
					<br>
					<br>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<a href="desListSelect.do?id=${rcmdDesByConHis.id}">
								<div class="card mx-30">
									<img
										src="${pageContext.request.contextPath}/resources/img/${rcmdDesByConHis.fileUuid }"
										onerror="this.src='${pageContext.request.contextPath}/resources/img/0.png';"
										class="card-img-top" />
									<div class="card-body">
										<h5 class="card-titleH5">????????? ?????????&nbsp;&nbsp;</h5><h4 class="card-title">${rcmdDesByConHis.name }</h4>
										<h6>
											<c:set var="majors"
												value="${fn:split(rcmdDesByConHis.major,',')}"></c:set>
											<c:forEach var="major" items="${majors}">
												<a href="searchList.do?search=${major }"> <span
													class="text-secondary">#${major}</span>
												</a>
											</c:forEach>


										</h6>
										<p class="card-text">
											<div class="rating clearfix">
												<strong class="float-center"
													id="rcmdDesByConHisReviewCnt"> ??? ?????? ??????
													${rcmdDesByConHis.count } ??? </strong>
											</div>
										</p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-6 col-lg-4">
							<a href="desListSelect.do?id=${rcmdDesByRate.id}">
								<div class="card mx-30">
									<img src="${pageContext.request.contextPath}/resources/img/${rcmdDesByRate.fileUuid }"
									onerror="this.src='${pageContext.request.contextPath}/resources/img/0.png';"
										class="card-img-top" />
									<div class="card-body">
										<h5 class="card-titleH5">?????? ?????? 1???&nbsp;&nbsp;</h5><h4 class="card-title">${rcmdDesByRate.name }</h4>
										<h6>
											<c:set var="majors2"
												value="${fn:split(rcmdDesByRate.major,',')}"></c:set>
											<c:forEach var="major2" items="${majors2}">
												<a href="searchList.do?search=${major2 }"> <span
													class="text-secondary">#${major2}</span>
												</a>
											</c:forEach>
										</h6>
										<p class="card-text">
										<div class="rating clearfix" style="display: inline-block;">
											<ul class="float-left" id="rcmdDesByRateStar">
												<c:forEach begin="1" end="${rcmdDesByRate.rate }">
													<li class="active"></li>
												</c:forEach>
												<c:forEach begin="${rcmdDesByRate.rate+1}" end="5">
													<li></li>
												</c:forEach>
											</ul>
											<small class="float-right text-grey-2"
												id="rcmdDesByRateReviewCnt"></small>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>


		</c:if>
	</div>

	<section class="padding-tb-100px">
		<div class="container">
			<!-- Title -->
			<div class="row justify-content-center margin-bottom-45px">
				<div class="col-lg-10">
					<div class="row">
						<div class="col-md-4 wow fadeInUp">
							<h1	class="text-second-color font-weight-300 text-sm-center text-lg-left margin-tb-15px">????????? ?????? ????????????</h1>
							<h1	class="text-second-color font-weight-300 text-sm-center text-lg-left margin-tb-15px">TOP3</h1>
							<button type="button" class="btn btn-info"
								onclick="topDesChange('cut')">???</button>
							<button type="button" class="btn btn-info"
								onclick="topDesChange('perm')">???</button>
							<button type="button" class="btn btn-info"
								onclick="topDesChange('dye')">??????</button>
						</div>
						<div class="col-md-6 wow fadeInUp" data-wow-delay="0.4s">
							<p class="text-grey-2"></p>
						</div>
						<div class="col-md-2 wow fadeInUp" data-wow-delay="0.4s">
							<a href="category.do" class="text-main-color margin-tb-15px d-inline-block"><span
								class="d-block float-left margin-right-10px margin-top-5px">??????	??????</span> <i
								class="far fa-arrow-alt-circle-right text-large margin-top-7px"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
					<div class="background-white box-shadow wow fadeInUp"
						data-wow-delay="0.2s">
						<div class="thum">
							<a href="#" id="targetHairATag1"><img id="targetHairImage1"
								src="http://placehold.it/400x400" onerror="this.src='${pageContext.request.contextPath}/resources/img/0.png';"></a>
						</div>
						<div class="padding-30px" align="center">
							<h5 class="margin-tb-15px">
								<a class="text-dark" href="#" id="targetHairName1">?????? ??????</a>
							</h5>
							<div id="targetHairHashTag1"></div>
							<div class="rating clearfix">
								<ul class="float-left" id="targetHairStar1">
								</ul>
								<small class="float-right text-grey-2" id="targetHairReviewCnt1">?????????</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
					<div class="background-white box-shadow wow fadeInUp"
						data-wow-delay="0.2s">
						<div class="thum">
							<a href="#" id="targetHairATag2"><img id="targetHairImage2"
								src="http://placehold.it/400x400" onerror="this.src='${pageContext.request.contextPath}/resources/img/0.png';"></a>
						</div>
						<div class="padding-30px" align="center">
							<h5 class="margin-tb-15px">
								<a class="text-dark" href="#" id="targetHairName2">?????? ??????</a>
							</h5>
							<div id="targetHairHashTag2"></div>
							<div class="rating clearfix">
								<ul class="float-left" id="targetHairStar2">
								</ul>
								<small class="float-right text-grey-2" id="targetHairReviewCnt2">?????????</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
					<div class="background-white box-shadow wow fadeInUp"
						data-wow-delay="0.2s">
						<div class="thum">
							<a href="#" id="targetHairATag3"><img id="targetHairImage3"
								src="http://placehold.it/400x400" onerror="this.src='${pageContext.request.contextPath}/resources/img/0.png';" ></a>
						</div>
						<div class="padding-30px" align="center">
							<h5 class="margin-tb-15px">
								<a class="text-dark" href="#" id="targetHairName3">?????? ??????</a>
							</h5>
							<div id="targetHairHashTag3"></div>
							<div class="rating clearfix">
								<ul class="float-left" id="targetHairStar3">
								</ul>
								<small class="float-right text-grey-2" id="targetHairReviewCnt3">?????????</small>
							</div>
						</div>
					</div>
				</div>




			</div>

			<!-- // Title -->

			<div class="row justify-content-center margin-bottom-45px margin-top-45px">
				<div class="col-lg-10">
					<div class="row">
						<div class="col-md-4 wow fadeInUp">
							<h1	class="text-second-color font-weight-300 text-sm-center text-lg-left margin-tb-8px">????????????	????????????</h1>
							<h1	class="text-second-color font-weight-300 text-sm-center text-lg-left margin-tb-8px">TOP3</h1>
						</div>
						<div class="col-md-6 wow fadeInUp" data-wow-delay="0.4s">
							<p class="text-grey-2"></p>
						</div>
						<div class="col-md-2 wow fadeInUp" data-wow-delay="0.4s">
							<a href="makeupList.do" class="text-main-color margin-tb-15px d-inline-block"><span
								class="d-block float-left margin-right-10px margin-top-5px">??????
									??????</span> <i
								class="far fa-arrow-alt-circle-right text-large margin-top-7px"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
					<div class="background-white box-shadow wow fadeInUp"
						data-wow-delay="0.2s">
						<div class="thum">
							<a href="#" id="targetMakeUpATag1"><img
								id="targetMakeUpImage1" src="http://placehold.it/400x400" onerror="this.src='${pageContext.request.contextPath}/resources/img/0.png';"></a>
						</div>
						<div class="padding-30px" align="center">
							<h5 class="margin-tb-15px">
								<a class="text-dark" href="#" id="targetMakeUpName1">?????? ??????</a>
							</h5>
							<div id="targetMakeUpHashTag1"></div>
							<div class="rating clearfix">
								<ul class="float-left" id="targetMakeUpStar1">
								</ul>
								<small class="float-right text-grey-2"
									id="targetMakeUpReviewCnt1">?????????</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
					<div class="background-white box-shadow wow fadeInUp"
						data-wow-delay="0.2s">
						<div class="thum">
							<a href="#" id="targetMakeUpATag2"><img
								id="targetMakeUpImage2" src="http://placehold.it/400x400" onerror="this.src='${pageContext.request.contextPath}/resources/img/0.png';"></a>
						</div>
						<div class="padding-30px" align="center">
							<h5 class="margin-tb-15px">
								<a class="text-dark" href="#" id="targetMakeUpName2">?????? ??????</a>
							</h5>
							<div id="targetMakeUpHashTag2"></div>
							<div class="rating clearfix">
								<ul class="float-left" id="targetMakeUpStar2">
								</ul>
								<small class="float-right text-grey-2"
									id="targetMakeUpReviewCnt2">?????????</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 hvr-bob sm-mb-45px">
					<div class="background-white box-shadow wow fadeInUp"
						data-wow-delay="0.2s">
						<div class="thum">
							<a href="#" id="targetMakeUpATag3"><img
								id="targetMakeUpImage3" src="http://placehold.it/400x400" onerror="this.src='${pageContext.request.contextPath}/resources/img/0.png';"></a>
						</div>
						<div class="padding-30px" align="center">
							<h5 class="margin-tb-15px">
								<a class="text-dark" href="#" id="targetMakeUpName3">?????? ??????</a>
							</h5>
							<div id="targetMakeUpHashTag3"></div>
							<div class="rating clearfix">
								<ul class="float-left" id="targetMakeUpStar3">
								</ul>
								<small class="float-right text-grey-2"
									id="targetMakeUpReviewCnt3">?????????</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>
