<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너마이페이지 - 스케쥴 관리</title>
<!-- fullcalender -->
<link href='resources/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />
<script src='resources/fullcalendar-5.9.0/lib/main.js'></script>
<style type="text/css">
#calendar{
	width:800px; 
}

</style>
<script> 
 	//캘린터만 띄우기
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });
 	

</script>
</head>

<body>
<!-- 달력 -->
<div id='calendar'>

<!-- 달력 -->
</div>
</body>
</html>