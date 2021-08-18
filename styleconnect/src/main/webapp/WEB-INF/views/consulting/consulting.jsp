<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 


<!-- 1.(1)state가 예약확정 (2)현재시간으로부터 10분 후 이내면 버튼으로 변경 및 활성화-->
<!-- 	1-1.버튼 클릭 DB update(state: 상담중) -->
<!-- 2. 나머지 경우 state -->
<!-- 서버 컴퓨터 하드코딩 괜찮은가... -->
<!-- 제시간이 아니면 버튼 없이 state로만 표시 -->
<!-- 테스트 주석 -->

<style>

p{
margin:0;
}

.note {
color:red;
}
#consulting-history-box-top{
display: flex;
justify-content: space-between;
padding:10px;
}

.active{
background-color: #584ccb;
color:white;
}

.unactive{
background-color: #dedede;
}

#consulting-history-box-middle{
text-align:left;
padding:20px;
}
#consulting-history-box-middle-content-title{
color:#584ccb;
font-weight:bold;
}


#consulting-history-box-low{
text-align:right;
padding:10px;
}

#entire-container-for-width{
width:70%;
}

#consulting-history-box{
width:70%;
}


</style>

<script>
function goChatting(conNo) {
	//ajax 사용할지 페이지 이동할지 아니면 새로운 페이지를 띄울지 결정
	window.location.href = 'https://192.168.0.15:8443/chatting.do?conNo=' + conNo;
	
	$.ajax({
		url:'conHistoryAttendUpdate.do',
		type:'POST',
		data: {
			conNo : conNo
		},
		success:function(){
			console.log('success');
		},error:function(r){
			console.log('fail');
		}
	});
}
</script>			


	<br><br><br><br>

<div align="center">
	<div id="entire-container-for-width">

	<c:if test="${fn:length(conHistoryList)==0}">
		<p>참여할 수 있는 상담이 없습니다.</p>
	</c:if>
	
	<c:if test="${fn:length(conHistoryList)!=0}">	
		<c:forEach var="conHistory" items="${conHistoryList}">
		
			<!-- consulting-history-box-->
			<div id="consulting-history-box" class="margin-bottom-30px box-shadow">
	    		<div class="background-white">
	    			<!-- consulting-history-box-top  -->
	    				<!-- 비활성화된 상담의 box-top -->
	    			<c:if test = "${conHistory.remainingTime le -30 || conHistory.remainingTime ge 10}">
	    			<div class="unactive" id="consulting-history-box-top">
			    		<div><span>${conHistory.title}</span></div>
			    		<div><span>${conHistory.day} ${conHistory.time}</span></div>
	    			</div>
		    		</c:if>
		    			<!-- 활성화된 상담의 box-top -->
		    		<c:if test = "${conHistory.remainingTime ge -30 && conHistory.remainingTime le 10}">
		    		<div class="active" id= "consulting-history-box-top">
			    		<div><span>${conHistory.title}</span></div>
			    		<div><span>${conHistory.day} ${conHistory.time}</span></div>
	    			</div>
		    		</c:if>
		    		<!-- consulting-history-box-top 끝-->
		    		
		    		<!-- consulting-history-box-middle-->
					<div id="consulting-history-box-middle">
		    		<p id="consulting-history-box-middle-content-title">상담 상세내용</p>
		    		<p id="consulting-history-box-middle-content">${conHistory.detail}</p>
		    		
		    		<p id="consulting-history-box-middle-content-title">회원 코멘트</p>
		    		<c:if test="${conHistory.memComment != null && conHistory.memComment != ''}">
		    			<p id="consulting-history-box-middle-content">${conHistory.memComment}</p>
		    		</c:if>
		    		<c:if test="${conHistory.memComment == null || conHistory.memComment == ''}">
		    			<p id="consulting-history-box-middle-content">없음</p>
		    		</c:if>
		    		
		    		<p id="consulting-history-box-middle-content-title">디자이너 코멘트</P>
		    		<c:if test="${conHistory.desComment != null && conHistory.desComment != ''}">
		    			<p id="consulting-history-box-middle-content">${conHistory.desComment}</p>
		    		</c:if>
		    		<c:if test="${conHistory.desComment == null || conHistory.desComment == ''}">
		    			<p id="consulting-history-box-middle-content">없음</p>
		    		</c:if>
	    			</div>
	    			<!-- consulting-history-box-middle 끝-->
	    			
					<!-- 남은 시간 
		    		<h1>남은 시간</h1>
		    		<c:out value="${conHistory.remainingTime}" />
		    		-->
		    		
		    		<!-- consulting-history-box-low-->
		    		<c:if test = "${conHistory.remainingTime le -30 || conHistory.remainingTime ge 10}">
		    			<div id="consulting-history-box-low">
		    				<p>${conHistory.state}</p>
		    				<p><span class="note">*</span>상담시간 10분 전부터 상담 참여 가능합니다.</p>
		    			</div>
		    		</c:if>
		    		
		    		<c:if test = "${conHistory.remainingTime ge -30 && conHistory.remainingTime le 10}">
		    			<div id="consulting-history-box-low">
		    				<p>${conHistory.state}</p>
		    				<button type="button" onclick="goChatting(${conHistory.conNo});">상담 참여 생성 테스트</button>
		    			</div>
		    		</c:if>
		    		<!-- consulting-history-box-low 끝-->
		    	</div>
		    	
		    </div>
		    <!-- consulting-history-box 끝-->
		</c:forEach>
	</c:if>
	
	</div>
</div>
	