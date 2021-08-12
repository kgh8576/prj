<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>


	// ������ �ε� �� ũ�Ѹ� ������ �˻�
	$(function() {
	    $.ajax({
	    	url:'isCrawlRunning.do',
	    	method:'post',
	    	success:function(result){
	    		if(result == 1){
	    			$('#hiddenProgressRun').val('true');
	    			var getCrawlProgress = setInterval(function(){
	    				$('#progressDiv').css('display', 'block'); // ����� ����� div show
	    				$.ajax({
	    					url : 'getCrawlProgress.do',
	    					method:'post',
	    					success : function(result) {
	    						console.log(result);
	    						$('#progressBar').attr('width', result);
	    						$('#progressBar').text(result+'% �Ϸ��');
	    					},
	    					error : function(err) {
	    						console.log(err);
	    					}
	    				});
	    			}, 5000);
	    			
	    			if()
	    			
	    		}
	    	},
	    	error:function(err){
	    		console.log(err);
	    	}
	    })
	});

	// ��ư ������ ũ�Ѹ�
	function crawl(gender) {
		$.ajax({
			url : 'crawl.do',
			method:'post',
			data : {gender : gender},
			success : function(result) {
				$('#progressBar').text('�Ϸ�!');
				$('#hiddenProgressRun').val('false');
			},
			error : function(err) {
				console.log(err);
			}
		});
		setInterval(getCrawlProgress, 5000); // ajax �ȿ� ������ ũ�Ѹ� ���� �� ������ ������� �����ֹǷ� �ٱ����� ������
	}
	
	
</script>
</head>
<body>
	<br><br><br><br><br><br><br><br><br><br><br>
	<button onclick="crawl('MALE')">���� ��� ũ�Ѹ�</button>
	<div class="progress" id="progressDiv" style="height:15px; width:200px; display:none;">
		<input type="hidden" id="hiddenProgressRun" value="false">
  		<div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" id="progressBar" style="width: 100%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">�غ��!</div>
	</div>
</body>
</html>