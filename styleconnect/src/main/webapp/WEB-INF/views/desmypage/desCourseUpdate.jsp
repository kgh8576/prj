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
<nav class="navbar navbar-expand-lg navbar-dark z-index-9  fixed-top" id="mainNav">
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav navbar-sidenav background-main-color admin-nav" id="admin-nav" style="margin-top:0px">
                <li class="nav-item">
                    <span class="nav-title-text">디자이너 기본정보</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                    <a href="desInfo.do" class="nav-link" href="dashboard-home.html">
                        <i class="fa fa-fw fa-user-circle"></i><span class="nav-link-text">내정보관리</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My items">
                    <a href="desMajor.do" class="nav-link" href="dashboard-my-listings.html">
                <i class="fa fa-fw fa-table"></i>
                <span class="nav-link-text">전문분야설정</span>
              </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My Favorites">
                    <a href="desStyle.do" class="nav-link" href="dashboard-my-favorites.html">
                <i class="fa fa-fw fa-table"></i>
                <span class="nav-link-text">스타일링사진 관리</span>
              </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
                    <a class="nav-link" href="desWorkOpen.do?id=${my.id }">
                <i class="fa fa-fw fa-star"></i>
                <span class="nav-link-text">스케쥴관리</span>
              </a>
                </li>
                <li class="nav-item">
                    <span class="nav-title-text">상담관련</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookings">
                    <a href="desCourse.do" class="nav-link active" href="dashboard-bookings.html">
                        <i class="far fa-fw fa-bookmark"></i>
                        <span class="nav-link-text">내상담관리</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Listing">
                    <a href="desSchedule.do" class="nav-link" href="dashboard-add-listing.html">
                        <i class="fa fa-fw fa-plus-circle"></i>
                        <span class="nav-link-text">예약관리</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
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