<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.multi{
    width: 73px;
    padding-top: 0px;
    padding-bottom: 0px;
    padding-right: 0px;
    padding-left: 0px;
    margin-left: 20px;
	}

	.my_button {
		display: inline-block;
		width: 200px;
		text-align: center;
		padding: 10px;
		background-color: #006BCC;
		color: #fff;
		text-decoration: none;
		border-radius: 5px;
	}
	
	.imgs_wrap {
		border: 2px solid #A8A8A8;
		margin-top: 30px;
		margin-bottom: 30px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.imgs_wrap img {
		max-width: 150px;
		margin-left: 10px;
		margin-right: 10px;
	}
	.MultiFile-list{
		font-size: 20px;
    	margin-left: 20px;
    	margin-top: 20px;
	}
	
</style>
<script	src="${pageContext.request.contextPath}/resources/assets/js/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>

<script type="text/javascript">
$(function () {
	 $(".my_button").click(function () {
		 console.log("fileUploadAction");
		    $(".multi:eq(0)").click();
	})
	
})
	
</script>



</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark z-index-9  fixed-top" id="mainNav">

        <div class="collapse navbar-collapse" id="navbarResponsive">

            <ul class="navbar-nav navbar-sidenav background-main-color admin-nav" id="admin-nav">
                <li class="nav-item">
                    <span class="nav-title-text">Main</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                    <a class="nav-link" href="dashboard-home.html">
                        <i class="fas fa-fw fa-home"></i><span class="nav-link-text">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My items">
                    <a class="nav-link" href="dashboard-my-listings.html">
                <i class="fa fa-fw fa-table"></i>
                <span class="nav-link-text">My Listings</span>
              </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My Favorites">
                    <a class="nav-link" href="dashboard-my-favorites.html">
                <i class="fa fa-fw fa-heart"></i>
                <span class="nav-link-text">My Favorites</span>
              </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
                    <a class="nav-link" href="dashboard-reviews.html">
                <i class="fa fa-fw fa-star"></i>
                <span class="nav-link-text">Reviews</span>
              </a>
                </li>
                <li class="nav-item">
                    <span class="nav-title-text">Example Pages</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookings">
                    <a class="nav-link active" href="dashboard-bookings.html">
                        <i class="far fa-fw fa-bookmark"></i>
                        <span class="nav-link-text">Bookings</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Listing">
                    <a class="nav-link" href="dashboard-add-listing.html">
                        <i class="fa fa-fw fa-plus-circle"></i>
                        <span class="nav-link-text">Add Listing</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Packages">
                    <a class="nav-link" href="dashboard-packages.html">
                        <i class="far fa-fw fa-list-alt"></i>
                        <span class="nav-link-text">Packages</span>
                    </a>
                </li>

                <li class="nav-item">
                    <span class="nav-title-text">User Area</span>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My Profile">
                    <a class="nav-link" href="dashboard-my-profile.html">
                        <i class="fa fa-fw fa-user-circle"></i>
                        <span class="nav-link-text">My Profile</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Sing Out">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal">
                        <i class="fa fa-fw fa-sign-out-alt"></i>
                        <span class="nav-link-text">Sing Out</span>
                    </a>
                </li>
            </ul>

        </div>
    </nav>
	<br>
	<br>
	<form method="post" action="uploadTest.do" enctype="multipart/form-data">
		<input type="file" id="file" name="file" class="multi" />
		<br> 
		<input type="submit">
	</form>
	<br>
	<br>
	<br>
</body>
</html>