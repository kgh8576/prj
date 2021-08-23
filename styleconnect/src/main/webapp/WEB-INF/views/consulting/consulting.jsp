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

div.active{
background-color: #584ccb;
color:white;
}

li.active{

}

.unactive{
background-color: #dedede;
}

#consulting-history-box-top{
padding:30px;
font-size : 25px;
font-weight:bold;
}

#consulting-history-box-middle{
text-align:left;
padding:40px 40px 0px 40px;
font-size : 20px;
}
#consulting-history-box-middle-title{
color:#584ccb;
font-weight:bold;
font-size : 20px;
margin-bottom: 10px;

}
#consulting-history-box-middle-content{
font-size : 15px;
margin-bottom: 30px;
}


#consulting-history-box-low{
text-align:right;
padding:0px 30px 30px 30px;
font-size : 15px;
}

#container-for-width{
width:80%;
}

#consulting-history-box{
width:70%;
}


</style>

<script>
function goChatting(conNo) {
	var id = '${id}';
	var did = '${did}';
	var userkey;
	//ajax 사용할지 페이지 이동할지 아니면 새로운 페이지를 띄울지 결정
	if(id != null && id !=""){
		userkey = "member";
	}else{
		userkey = "desinder";
	}
	window.location.href = 'https://192.168.0.15:8443/chatting.do?conNo=' + conNo + '&user=' + userkey;
	
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


	<br><br><br><br><br>




<div align="center">
	<div id="container-for-width">
	
	<div align="left">
		<div id="page-title" class="padding-tb-30px gradient-white">
	        <div class="container">
	            <ol class="breadcrumb opacity-5">
	                <li><a href="main.do">Home<svg class="svg-inline--fa fa-angle-right fa-w-8" data-fa-pseudo-element=":after" aria-hidden="true" data-prefix="fas" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z"></path></svg><!-- <i class="fas" data-fa-pseudo-element=":after"></i> --></a></li>
	                <li class="active"><a href="#">상담하기</a></li>
	            </ol>
	            <h1 class="font-weight-300">상담하기</h1>
	        </div>
	    </div>
	</div>

	<c:if test="${fn:length(conHistoryList)==0}">
		<div style="background-color:#e2e2e2; margin-top:15%; width:50%; padding:30px;">
			<h3>참여할 수 있는 상담이 없습니다.</h3>
		</div>
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
		    		<p id="consulting-history-box-middle-title">상담 상세내용</p>
		    		<p id="consulting-history-box-middle-content">${conHistory.detail}</p>
		    		
		    		<p id="consulting-history-box-middle-title">회원 코멘트</p>
		    		<c:if test="${conHistory.memComment != null && conHistory.memComment != ''}">
		    			<p id="consulting-history-box-middle-content">${conHistory.memComment}</p>
		    		</c:if>
		    		<c:if test="${conHistory.memComment == null || conHistory.memComment == ''}">
		    			<p id="consulting-history-box-middle-content">없음</p>
		    		</c:if>
		    		
		    		<p id="consulting-history-box-middle-title">디자이너 코멘트</P>
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
		    				<button type="button" class="btn btn-info" onclick="goChatting(${conHistory.conNo});">상담 참여</button>
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
	