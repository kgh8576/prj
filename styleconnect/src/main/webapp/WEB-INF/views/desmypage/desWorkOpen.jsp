<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.li1{
	 display: inline-block;
	 border: 1px solid white;
	width: 150px;
    text-align: center;
    height: 50px;
    padding-top: 10px;
    margin: 0px;
    font-size: 18px;
	
	}
	.lit{
	 display: inline-block;
	 border: 1px solid white;
	width: 150px;
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
	
#times input[type=checkbox]+label {
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
	background-color: #333;
	color: #fff;
}
#times input[type=checkbox]:checked+label {
	background-color: #fff;
	color: #333;
}
</style>
<script>
	
	var targetDay; // 1. 내가 바꿀 요일 지정, 2. 탭 기능에 사용
	var id = '${id }'; 
		
	$(function(){
		show('mon');
	});
	
	// 탭 넘어가는 기능
	function show(exceptionLi) {
		$('ul#checkBar li').attr('class', 'li1');
		$('#'+exceptionLi).attr('class', 'lit');
		targetDay = $('ul#checkBar .lit').attr('id');
		switch (targetDay){
			case 'mon':
				init('${schedules.mon }');
				break;
			case 'tue':
				init('${schedules.tue }');
				break;
			case 'wed':
				init('${schedules.wed }');
				break;
			case 'tur':
				init('${schedules.thu }');
				break;
			case 'fri':
				init('${schedules.fri }');
				break;
			case 'sat':
				init('${schedules.sat }');
				break;
			case 'sun':
				init('${schedules.sun }');
				break;
		}
		$("#weeked").val(exceptionLi);
	}
	
	function init(times){
		$('#times').html(''); // 비우기
		var sliced = times.split(','); // 시간 별로 ,로 자르기
		var compareTime = $('input:checkbox[name="compareTime"]'); // 시간 비교군 배열
		var slicedCompareTime = new Array();
		compareTime.each(function(index, el){
			slicedCompareTime.push(el.value); // 시간 비교군 배열에 값 담기
		});
		console.log(sliced);
		console.log(slicedCompareTime);
		for(var i = 0; i < slicedCompareTime.length; i++){ // DB 데이터와 시간 비교군 배열이 일치하지 않으면 'none'을 넣어서 array 요소 갯수를 맞추는 작업
			if ( sliced[i] != slicedCompareTime[i] ){
				sliced.splice(i, 0, 'none');
			}
		}
		console.log(sliced);
		for(var i = 0; i < sliced.length; i++){ // 그 맞춰진 요소 갯수로 for문. Btn 생성 과정
			if ( sliced[i] != 'none' ){ // 요소값이 none이 아니면 셀렉티드 버튼 만들어주고
				$('#times').append($("<input class='check' type='checkbox' style='display: none;' name='time' id="+slicedCompareTime[i]+" value="+slicedCompareTime[i]+" checked> <label style='width: 60px;' for="+slicedCompareTime[i]+">"+slicedCompareTime[i]+"</label>"));
			}
			else { // 요소값이 none이면 언셀렉티드 버튼 생성
				$('#times').append($("<input class='check' type='checkbox' style='display: none;' name='time' id="+slicedCompareTime[i]+" value="+slicedCompareTime[i]+"> <label style='width: 60px;' for="+slicedCompareTime[i]+">"+slicedCompareTime[i]+"</label>"));
			}
		}
	}
	
	function submit(){
		var checked = $('input:checkbox[name=time]:checked');
		var times = new Array();
		var sliced = '';
		checked.each(function (index, el){
			sliced += el.value;
			if(index){
				sliced += ',';
			}
		});
		console.log(sliced);
		
		$.ajax({
			url:'desWorkOpenUpdate.do',
			data:{
				id : id,
				targetDay : targetDay,
				times : sliced
			},
			success:function(result){
				console.log(result);
			},
			error:function(err){
				console.log(err);
			}
		});
		
	}
	
</script>
</head>
<body><br><br><br><br><br><br>
	<button onclick="test()">테스트</button>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div>
				<ul id="checkBar" class="ul1">
					<li class="lit" id="mon" onclick="show('mon')">월</li>
					<li class="li1" id="tue" onclick="show('tue')">화</li>
					<li class="li1" id="wed" onclick="show('wed')">수</li>
					<li class="li1" id="tur" onclick="show('tur')">목</li>
					<li class="li1" id="fri" onclick="show('fri')">금</li>
					<li class="li1" id="sat" onclick="show('sat')">토</li>
					<li class="li1" id="sun" onclick="show('sun')">일</li>
				</ul>
			</div>
			<form action="desWorkOpenUpdate.do" id="weekfrm">
			<input type="hidden" id="weeked" name ="weeked" value="">
				<div id="times" style="border: 1px solid black;">
					
				</div>
				<button>수정</button>
			</form>
			<div id="ComparativeGroup" style="display:none;">
				<input class='check' type='checkbox' name='compareTime' value="09:00">
				<input class='check' type='checkbox' name='compareTime' value="09:30"> 
				<input class='check' type='checkbox' name='compareTime' value="10:00"> 
				<input class='check' type='checkbox' name='compareTime' value="10:30">
				<input class='check' type='checkbox' name='compareTime' value="11:00">
				<input class='check' type='checkbox' name='compareTime' value="11:30">
				<input class='check' type='checkbox' name='compareTime' value="13:00"> 
				<input class='check' type='checkbox' name='compareTime' value="13:30"> 
				<input class='check' type='checkbox' name='compareTime' value="14:00"> 
				<input class='check' type='checkbox' name='compareTime' value="14:30">
				<input class='check' type='checkbox' name='compareTime' value="15:00">
				<input class='check' type='checkbox' name='compareTime' value="15:30"> 
				<input class='check' type='checkbox' name='compareTime' value="16:00">
				<input class='check' type='checkbox' name='compareTime' value="16:30">
				<input class='check' type='checkbox' name='compareTime' value="17:00"> 
				<input class='check' type='checkbox' name='compareTime' value="17:30">
			</div>
			
		</div>
		<div class="col-md-2"></div>
	</div>
<br>

</body>
</html>