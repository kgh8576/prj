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
	    	success:function(isCrawl){ // ũ�Ѹ� ���̸� java���� 1 ����
	    		if(isCrawl == 1){
	    			$('#hiddenProgressRun').val('true');
    				$('#progressDiv').css('display', 'block'); // ����� ����� div show
    				var getCrawlProgress = setInterval(function(){
	    				$.ajax({
	    					url : 'getCrawlProgress.do',
	    					method:'post',
	    					success : function(progress) {
	    						console.log(progress);
	    						if ( progress == 100 ) {
	    							$('#hiddenProgressRun').val('false');
	    						} else {
	    							$('#progressBar').text(progress+'% �Ϸ��');
	    						}
	    					},
	    					error : function(err) {
	    						console.log(err);
	    					}
	    				});
		    			if( $('#hiddenProgressRun').val() == 'false' ){
		    				clearInterval(getCrawlProgress);	
		    				$('#progressBar').text('�Ϸ�!');
		    			}
	    			}, 4000);
	    		}
	    	},
	    	error:function(err){
	    		console.log(err);
	    	}
	    })
	});

	// ��ư ������ ũ�Ѹ�
	function crawl(gender) {
		$('#hiddenProgressRun').val('true');
		$('#progressDiv').css('display', 'block'); // ����� ����� div show
		$.ajax({
			url : 'crawl.do',
			method:'post',
			data : {gender : gender},
			success : function(isDone) {
				console.log(isDone);
				$('#progressBar').text('�Ϸ�!');
				$('#hiddenProgressRun').val('false'); // ������ ������ �� ���� ���� ��ٷȾ ���� ó�� 
			},
			error : function(err) {
				console.log(err);
			}
		});
		
		var getCrawlProgress = setInterval(function(){ // ajax �ȿ� ������ ũ�Ѹ� ���� �� ������ ������� �����ֹǷ� �ٱ����� ������
			$.ajax({
				url : 'getCrawlProgress.do',
				method:'post',
				success : function(progress) {
					console.log(progress);
					if ( progress == 100 ) {
						$('#hiddenProgressRun').val('false'); 
					} else {
						$('#progressBar').text(progress+'% �Ϸ��');
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
			if( $('#hiddenProgressRun').val() == 'false' ){
				clearInterval(getCrawlProgress);
				$('#progressBar').text('�Ϸ�!');
			}
		}, 4000);
		
		
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