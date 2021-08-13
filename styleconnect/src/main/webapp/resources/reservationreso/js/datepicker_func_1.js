// Datepicker
var dates = {}
dates[new Date('10/23/2019')] = '-40%';
dates[new Date('12/14/2019')] = '-20%';
dates[new Date('01/25/2020')] = '-30%';

$('#DatePicker').datepicker({
	dateFormat: "yy-mm-dd",
	
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	
    showButtonPanel: false,
    inline: true,
    altField: '#datepicker_field',
    minDate: 0,
    beforeShowDay: function(date) {
        var hlText = dates[date];
        var date2 = new Date(date);
        var tglAja = date2.getDate();
        if (hlText) {
            updateDatePickerCells(tglAja, hlText);
            return [true, "", hlText];
        } else {
            return [true, '', ''];
        }
    },
	onSelect: function(dateString , dateobj){
		frm.day.value = dateString;
		var week = new Array('sun','mon','tue','wed','thu','fri','sat');
		var date = new Date(dateString);
		var weekLabel = week[date.getDay()];
		var courno = $("#courNo").val();
		var desId = $("#desId").val();
		var desData = {
				courNo : courno,
				week : weekLabel,
				searchDate : dateString,
				desId : desId
		}
		$.ajax({
			url:"workTime.do",
			type:"post",
			data:desData,
			success: function(data) {
				$(".can_reservation_time").html("");
				var i = 1;
				for (var time of data) {
					var today = new Date();
					var date = new Date(dateString);
					today.setHours(0);
					today.setMinutes(0);
					today.setSeconds(0);
					today.setMilliseconds(0);
					date.setHours(0);
					if (today.getTime() == date.getTime()){
						var today = new Date();
						date.setHours(time.split(':')[0]);
						date.setMinutes(time.split(':')[1]);
						if(date > today){
							$(".can_reservation_time").append("<li><input type='radio' id='time_"+i+"' onclick='selectTime(\""+time+"\")' name='time' value='"+time+"'><label for='time_"+i+"'>"+time+"</label></li>");		
						}
					}else{
						$(".can_reservation_time").append("<li><input type='radio' id='time_"+i+"' onclick='selectTime(\""+time+"\")' name='time' value='"+time+"'><label for='time_"+i+"'>"+time+"</label></li>");	
					}
					i = i+1;
				}
			},
			error : function(err) {
				console.log(err);
			}
		})
				
	}

});

function updateDatePickerCells(a, b) {

    var num = parseInt(a);

    setTimeout(function() {

        $('.ui-datepicker td > *').each(function(idx, elem) {

            if ((idx + 1) == num) {
                value = b;
            } else {
                value = 0;
            }

            var className = 'datepicker-content-' + CryptoJS.MD5(value).toString();

            if (value == 0)
                addCSSRule('.ui-datepicker td a.' + className + ':after {content: "\\a0";}'); //&nbsp;
            else
                addCSSRule('.ui-datepicker td a.' + className + ':after {content: "' + value + '";}');

            $(this).addClass(className);
        });
    }, 0);
}
var dynamicCSSRules = [];

function addCSSRule(rule) {
    if ($.inArray(rule, dynamicCSSRules) == -1) {
        $('head').append('<style>' + rule + '</style>');
        dynamicCSSRules.push(rule);
    }
}

$('#datepicker_field').on('change', function() {
    $('#DatePicker').datepicker('setDate', $(this).val());
});

