<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	//삭제 버튼 ajax
	function deletes(target, desId){
		$.ajax({
			data:{conNo:target},
			url:'reviewDelete.do',
			type:'post',
			success:function(result){
				alert('삭제했습니다. 돌아갑니다');
				location.href = 'reviewList.do?desId='+desId;
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	// 수정 버튼은 form으로 페이지가 넘어가도록
	function modify(){
		$('#modifyFrm').submit();
	}
	// 돌아가기 버튼
	function back(desId){
		location.href='reviewList.do?desId='+desId;
	}
	
	//디자이너인 경우 답글 작성 frm 여는 버튼
	function showReplyFrm(){
		document.getElementById("hiddenReplyDiv").style.display = 'block';
		document.getElementById("replyFrmBtn").style.display = 'none';
	}
	//디자이너 답글 작성
	function replyInsert(conNo, desId){
		var contents = CKEDITOR.instances.replyContents.getData();
		$.ajax({
			url:'replyInsert.do',
			type:'post',
			data:{
				conNo : conNo,
				contents : contents
				},
			success:function(){
				alert('정상적으로 작성했습니다. 돌아갑니다');
				$('#redirectFrm').submit();
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	// 디자이너 답글 수정
	function replyModifyFrm(){
		document.getElementById("hiddenModifyDiv").style.display = 'block';
		document.getElementById("beforeContent").style.display = 'none';
		document.getElementById("modifyBtn").style.display = 'none'; // 수정 frm 여는 버튼
		document.getElementById("updateBtn").style.display = 'block'; // 실제로 ajax 호출하여 수정하는 버튼
	}
	function replyModify(conNo){
		var contents = CKEDITOR.instances.replyModifyContents.getData();
		$.ajax({
			url:'replyUpdate.do',
			type:'post',
			data:{
				contents : contents,
				conNo : conNo				
				},
			success:function(){
				alert('정상적으로 수정했습니다. 돌아갑니다');
				$('#redirectFrm').submit();
			},
			error:function(err){
				console.log(err);
			}
		});		
	}
	
	
	
</script>
</head>
<body>
<br><br><br>
<div class="row">
	<div class="col-md-3"></div>
	
	<div class="col-md-6">
		<div align="right" style="border-bottom: 1px solid black;">
			<c:if test="${id eq reviewInfo.memId }">
				<button class="btn btn-info" onclick="deletes('${reviewInfo.conNo}', '${reviewInfo.desId }')">삭제</button>
				<button class="btn btn-info" onclick="modify()">수정</button>
				<form action="reviewModify.do" id="modifyFrm" method="post">
					<input type="hidden" name="conNo" value="${reviewInfo.conNo }">
					<input type="hidden" name="memId" value="${reviewInfo.memId }">
				</form>
			</c:if>
			<br>
		</div>
		<br><br>
		<div class="rating clearfix">
			<ul class="float-left">
				<c:forEach begin="1" end="${reviewInfo.rate }">
					<li class="active"></li>
				</c:forEach>
				<c:forEach begin="${reviewInfo.rate+1}" end="5">
					<li></li>
				</c:forEach>
			</ul>
			<p align="right" style="color: grey;">${reviewInfo.stringwDate }&emsp;&emsp;&emsp; ${reviewInfo.memId }</p>
		</div>

		<div>
			<h3>${reviewInfo.reviewTitle }</h3>
			<hr>
			${reviewInfo.contents}
		</div>
		<div align="center">
			<br><button class="btn btn-info" onclick="back('${reviewInfo.desId}')">돌아가기</button>
		</div>
		
		
		
		
		<!-- 답변 영역 -->
		<div class="margin-bottom-20px padding-bottom-40px box-shadow">
			<c:if test="${id eq reviewInfo.desId && empty replyInfo }">
				<p id="replyFrmBtn">고객에게 피드백을 남길 수 있습니다.
					<button class="btn btn-info" onclick="showReplyFrm()">답변 등록하기</button>
				</p>
				<form method="post">
					<div id="hiddenReplyDiv" style="display: none;">
						<div class="margin-bottom-20px padding-bottom-40px box-shadow">
					        <div class="padding-20px background-white">
					            <textarea class="form-control" id="replyContents" name="replyContents"></textarea>
								<script type="text/javascript">
								 CKEDITOR.replace('replyContents'
								                , {height: 500,
								                	filebrowserUploadUrl: 'upload.do' 
								                 });
								</script>
					        </div><br>
					        <c:if test="${empty replyInfo}">
						        <div align="center">
						        	<button class="btn btn-info" onclick="replyInsert('${reviewInfo.conNo }', '${reviewInfo.desId }')">등록</button>
						        </div>
					        </c:if>
			   			</div>
					</div>
				</form>
			</c:if>
			<c:if test="${not empty replyInfo }">
				<div class="margin-bottom-20px padding-bottom-40px box-shadow">
			        <div class="padding-20px background-white">
			        
			        	
				        <h3>디자이너의 답변</h3>
				        <div id="beforeContent">${replyInfo.contents }</div>
				        
				        <div style="display: none;" id="hiddenModifyDiv">
							<textarea class="form-control" id="replyModifyContents" name="replyModifyContents">${replyInfo.contents }</textarea>
							<script type="text/javascript">
							 CKEDITOR.replace('replyModifyContents'
							                , {height: 500,
							                	filebrowserUploadUrl: 'upload.do' 
							                 });
							</script>
						</div>

			        </div><br>
			        <c:if test="${id eq reviewInfo.desId }">
				        <div align="center" id="modifyBtn">
				        	<button class="btn btn-info" onclick="replyModifyFrm()">수정</button>
				        </div>
				     	<div align="center" id="updateBtn" style="display: none;">
				        	<button class="btn btn-info" onclick="replyModify('${reviewInfo.conNo }')">수정</button>
				        </div>
				        
			        </c:if>
	   			</div>
			</c:if>
			<form action="reviewInfo.do" method="POST" id="redirectFrm">
				<input type="hidden" name="conNo" value="${reviewInfo.conNo }">
			</form>
			

			
		</div>
		
		
	</div>
	<div class="col-md-3"></div>
</div>
</body>
</html>