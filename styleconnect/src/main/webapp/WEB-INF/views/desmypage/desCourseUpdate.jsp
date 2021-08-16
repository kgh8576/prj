<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
//파일이미지 미리보기
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
//글자수 카운트
$(document).ready(function(){
	$("textarea").keyup(function(e){
		console.log(" 키업확인");
		
		 var content = $(this).val();
		$('#counter').html("("+content.length+" / 최대 300자)");   //글자수 실시간 카운팅
		
		if(content.length > 300){
			alert("최대 300자까지 입력 가능합니다.");
		$(this).val(content.substring(0, 300));
        $('#counter').html("(300/ 최대 300자)");
		}
	});
});
</script>
<meta charset="UTF-8">
<title>디자이너마이페이지/상담수정</title>
</head>
<body>
        <div class="content-wrapper">
            <div class="container-fluid overflow-hidden">
                <div class="row margin-tb-90px margin-lr-10px sm-mrl-0px">
                    <!-- Page Title -->
                    <div id="page-title" class="padding-30px background-white full-width">
                        <div class="container">
                            <ol class="breadcrumb opacity-5">
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Dashboard</a></li>
                                <li class="active">Add Listing</li>
                            </ol>
                            <h1 class="font-weight-300">상담수정</h1>
                        </div>
                    </div>
                    <!-- // Page Title -->

                    <div class="margin-tb-45px full-width">
                        <div class="padding-30px background-white border-radius-20 box-shadow">
                            <h3><i class="far fa-list-alt margin-right-10px text-main-color"></i>${course.courNo } 상담관련 정보 입력란 </h3>
                            <hr>
                            <form method="post" action="desCourseUp.do?courno=${course.courNo }" enctype="multipart/form-data">
                            <input type="hidden" name="id" id="id" value="${course.id }" >
                            <input type="hidden" id="courNo" name="courNo" value="${course.courNo }"> 
                                <div class="form-group margin-bottom-20px">
                                    <label><i class="far fa-list-alt margin-right-10px"></i> 상담제목</label>
                                    <input type="text" class="form-control form-control-sm" id="title" name="title" value="${course.title }">
                                </div>
                                 <div class="form-group margin-bottom-20px">
                                    <label><i class="far fa-list-alt margin-right-10px"></i> 상담상세정보 </label> <span style="color:#aaa;" id="counter">(0 / 최대 300자)</span>
                                     <textarea class="form-control" id="detail" name="detail" rows="6">${course.detail }</textarea>
                                </div>
                                <div class="row">
                                  <div class="col-md-6 margin-bottom-20px">
                                    <label ><i class="far fa-images margin-right-10px"></i> 썸네일 사진</label>
                                    <input type="hidden" value="${course.fileUuid}" name="fileUuid">${course.fileUuid}
                             		<input type="file" name="file" onchange="readURL(this);" >
                            	  <img id="preview" src="${pageContext.request.contextPath}/resources/img/${course.fileUuid}" alt="">
                                  </div>
                                  <div class="col-md-6">
                                     <label><i class="fas fa-info margin-right-10px"></i> 가격(원)</label>
                                     <input type="number" class="form-control form-control-sm" value="${course.price }" id="price" name="price">
                                  </div>
                                </div>
                   				 <button type="submit" class="btn btn-lg border-2  btn-primary btn-block border-radius-15 padding-15px box-shadow">상담수정</button>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
              <i class="fa fa-angle-up"></i>
            </a>
           
        </div>
    </body>
</html>