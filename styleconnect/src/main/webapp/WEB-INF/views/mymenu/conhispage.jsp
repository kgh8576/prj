<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	function paycancle(con_No) {
		var senddata = {
				conNo : con_No
		};
		$.ajax({
			url : 'paycancle.do',
			data : senddata,
			type : 'post',
			success : function(date) {
				var testDate = date;
				var year = testDate.substring(0,4);
				var month = testDate.substring(5,7);
				var day = testDate.substring(8,10);
				var h = testDate.substring(11,13);
				var m = testDate.substring(14,16);
				var cancleDay = new Date(year, month*1-1, day, h, m);
				var today = new Date();
				if(today.getTime() > cancleDay.getTime()){
					$('#Noticemessage'+con_No).html('3일전에는 예약을 취소할수 없습니다.').attr('color',
					'#f82a2aa3');
				}else{
					msg ="정말 예약을 취소 하시겠어요?";
					if(confirm(msg) != 0) {
						location.href = "reservationcancle.do?conNo="+con_No;
						alert("취소가 완료 되었습니다.");
						location.href = "membermypage.do";
					}else{
						alert("취소되지 않았습니다.");
						return false;	
					}		
				}
			},
			error : function(err) {
				console.log(err);
				console.log("예약취소에러");
			}
		})
	}	


</script>
<!-- Booking item -->
<div class="col-lg-12">

	<c:forEach var="conhis" items="${conhis }">

		<c:if test="${conhis.codecontent eq '예약중' || conhis.codecontent eq '예약확정' || conhis.codecontent eq '상담중'}">
			<div style="margin: auto; width: 100%"
				class="col-lg-6 margin-bottom-45px full-width">
				<div class="background-white thum-hover box-shadow  hvr-float">
					<div class="padding-30px full-width" style="width: 800px">
						<img src="http://placehold.it/60x60"
							class="float-left margin-right-20px border-radius-60 margin-bottom-20px"
							alt="">
						<div class="margin-left-85px">
							<a class="d-block text-dark text-medium margin-bottom-5px"
								href="#">${conhis.title } </a>
							<div class="d-block padding-tb-5px">
								예약날짜 : <a href="#" class="text-main-color">${conhis.day }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약시간 : <a href="#" class="text-main-color"> ${conhis.time }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약신청한날짜 : <a href="#" class="text-main-color">${conhis.reservateDate }</a>
							</div>
							<div class="d-block padding-tb-5px">
								디자이너 : <a href="#" class="text-main-color"> ${conhis.desName }</a>
							</div>
							<div class="d-block padding-tb-5px">
								예약상태 : <a href="#" class="text-main-color"> ${conhis.codecontent }</a>
							</div>
							<p class="margin-top-15px text-grey-2">상세정보 : ${conhis.detail }</p>
							<a href="reviewList.do?desId=${conhis.desId }"
								class="d-inline-block text-grey-2 text-up-small"><i
								class="far fa-file-alt"></i> 리뷰보기</a>
							<button type="button"
								class="d-inline-block margin-lr-20px text-grey-2 text-up-small"
								onclick="paycancle('${conhis.conNo}')">
								<i class="far fa-window-close"></i> 예약취소
							</button>
							<font id="Noticemessage${conhis.conNo }" size="2"></font>
						</div>
					</div>
				</div>
			</div>
		</c:if>

	</c:forEach>

</div>
