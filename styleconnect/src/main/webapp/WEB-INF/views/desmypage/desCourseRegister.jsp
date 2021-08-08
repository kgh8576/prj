<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너마이페이지/상담생성</title>
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
                            <h1 class="font-weight-300">상담생성</h1>
                        </div>
                    </div>
                    <!-- // Page Title -->

                    <div class="margin-tb-45px full-width">
                        <div class="padding-30px background-white border-radius-20 box-shadow">
                            <h3><i class="far fa-list-alt margin-right-10px text-main-color"></i> 상담관련 정보 입력d란 ${des.id }</h3>
                            <hr>
                            <form method="post" action="desCourseInsert.do?id=${des.id }">
                            <input type="hidden" name="id" id="id" value="${des.id }" > 
                                <div class="form-group margin-bottom-20px">
                                    <label><i class="far fa-list-alt margin-right-10px"></i> 상담제목</label>
                                    <input type="text" class="form-control form-control-sm" id="title" name="title" placeholder="상담제목을 입력하세요">
                                </div>
                                 <div class="form-group margin-bottom-20px">
                                    <label><i class="far fa-list-alt margin-right-10px"></i> 상담상세정보</label>
                                     <textarea class="form-control" placeholder="상담주제에대한 설명을 입력하세요(300자 이내) " id="detail" name="detail" rows="6"></textarea>
                                </div>
                                <div class="row">
                                  <div class="col-md-6 margin-bottom-20px">
                                    <label ><i class="far fa-images margin-right-10px"></i> 썸네일 사진</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="http://www.">
                                  </div>
                                  <div class="col-md-6">
                                     <label><i class="fas fa-info margin-right-10px"></i> 가격(원)</label>
                                     <input type="text" class="form-control form-control-sm" placeholder="숫자만 입력하세요" id="price" name="price">
                                  </div>
                                </div>
                    <button type="submit" class="btn btn-lg border-2  btn-primary btn-block border-radius-15 padding-15px box-shadow">상담등록</button>>
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