<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
                            <h1 class="font-weight-300">Add Listing</h1>
                        </div>
                    </div>
                    <!-- // Page Title -->

                    <div class="margin-tb-45px full-width">
                        <div class="padding-30px background-white border-radius-20 box-shadow">
                            <h3><i class="far fa-list-alt margin-right-10px text-main-color"></i> Basic Informations </h3>
                            <hr>
                            <form>
                                <div class="form-group margin-bottom-20px">
                                    <label><i class="far fa-list-alt margin-right-10px"></i> Listing Title</label>
                                    <input type="text" class="form-control form-control-sm" id="ListingTitle" placeholder="Listing Title">
                                </div>
                                <div class="form-group margin-bottom-20px">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label><i class="far fa-folder-open margin-right-10px"></i> Category</label>
                                            <select class="form-control form-control-sm">
                                              <option>All Category</option>
                                              <option>Doctors</option>
                                              <option>Clinics</option>
                                              <option>Labs</option>
                                              <option>Pharmacies</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label><i class="far fa-map margin-right-10px"></i> Location</label>
                                            <select class="form-control form-control-sm">
                                              <option>West Virginia</option>
                                              <option>New Hampshire</option>
                                              <option>Connecticut</option>
                                              <option>Rhode Island</option>
                                              <option>South Dakota</option>
                                              <option>North Dakota</option>
                                              <option>Wisconsin</option>
                                              <option>North Carolina</option>
                                              <option>Tennessee</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group margin-bottom-20px">
                                    <label><i class="far fa-flag margin-right-10px"></i> Keywords</label>
                                    <input type="text" class="form-control form-control-sm" id="ListingKeywords" placeholder="Keywords">
                                </div>
                                <div class="row">
                                    <div class="col-md-6 margin-bottom-20px">
                                        <label><i class="fas fa-mobile-alt margin-right-10px"></i> Phone</label>
                                        <input type="text" class="form-control form-control-sm" placeholder="002229456987">
                                    </div>
                                    <div class="col-md-6 margin-bottom-20px">
                                        <label><i class="far fa-envelope-open margin-right-10px"></i> Email</label>
                                        <input type="text" class="form-control form-control-sm" placeholder="info@yourname.com">
                                    </div>
                                    <div class="col-md-6">
                                        <label><i class="fas fa-link margin-right-10px"></i> Website</label>
                                        <input type="text" class="form-control form-control-sm" placeholder="www.your-site.com">
                                    </div>
                                    <div class="col-md-6">
                                        <label><i class="fas fa-info margin-right-10px"></i> Description</label>
                                        <input type="text" class="form-control form-control-sm" placeholder="description">
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>

                    <div class="margin-bottom-45px full-width">
                        <div class="padding-30px background-white border-radius-20 box-shadow">
                            <h3><i class="far fa-list-alt margin-right-10px text-main-color"></i> Description </h3>
                            <hr>
                            <div class="margin-bottom-20px">
                                <textarea class="form-control" placeholder="Enter  Admin Message  here" id="exampleTextarea" rows="3"></textarea>
                            </div>
                            <div class="row">
                                <div class="col-md-6 margin-bottom-20px">
                                    <label><i class="fas fa-video margin-right-10px"></i> Video URL</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="http://www.">
                                </div>
                                <div class="col-md-6 margin-bottom-20px">
                                    <label ><i class="far fa-images margin-right-10px"></i> Image URL</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="http://www.">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="margin-bottom-45px full-width">
                        <div class="padding-30px background-white border-radius-20 box-shadow">
                            <h3><i class="far fa-list-alt margin-right-10px text-main-color"></i> Socials links </h3>
                            <hr>
                            <div class="row">
                                <div class="col-md-6 margin-bottom-20px">
                                    <label><i class="fab fa-facebook margin-right-10px"></i> Facebook</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="http://www.facebook.com">
                                </div>
                                <div class="col-md-6 margin-bottom-20px">
                                    <label><i class="fab fa-twitter margin-right-10px"></i> Twitter</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="http://www.twitter.com">
                                </div>
                                <div class="col-md-6 margin-bottom-20px">
                                    <label><i class="fab fa-youtube margin-right-10px"></i> Youtube</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="http://www.youtube.com">
                                </div>
                                <div class="col-md-6 margin-bottom-20px">
                                    <label><i class="fab fa-google-plus-g margin-right-10px"></i> Google Pluse</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="http://www.google-plus.com">
                                </div>
                                <div class="col-md-6 margin-bottom-20px">
                                    <label><i class="fab fa-whatsapp margin-right-10px"></i> Whatsapp</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="http://www.whatsapp.com">
                                </div>

                            </div>
                        </div>
                    </div>
                    <a href="#" class="btn btn-lg border-2  btn-primary btn-block border-radius-15 padding-15px box-shadow">Add Listing</a>
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <footer class="sticky-footer">
                <div class="container">
                    <div class="text-center">
                        <span>© 2018 tabib Health Directory | All Right Reserved <a class="text-grey-2 margin-left-15px" href="https://themeforest.net/user/nile-theme/portfolio" target="_blank">Powered by : Nile Theme</a></span>
                    </div>
                </div>
            </footer>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
              <i class="fa fa-angle-up"></i>
            </a>
            <!-- Logout Modal-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                    </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="page-login.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>