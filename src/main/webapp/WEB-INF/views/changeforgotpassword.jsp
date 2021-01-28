<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="/frontend/stylesheet1.css" />
<link rel="stylesheet" type="text/css" href="/frontend/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/frontend/style3.css" />


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/font-awesome/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/bootstrap-select/css/bootstrap-select.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/currency-flags/css/currency-flags.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/owl.carousel/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheet1.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#submitbtn').click(function(){
			var newpassword=$('#newpassword').val();
			var confirmpassword=$('#confirmpassword').val();
			if(newpassword===''){
				$('#newpassword').focus().css('outline','solid red 2px');
				return false;
			}
			if(confirmpassword===''){
				$('#confirmpassword').focus().css('outline','solid red 2px');
				return false;
			}if(newpassword!=confirmpassword){
				$('#newpassword').focus().css('outline','solid red 2px');
				$('#confirmpassword').focus().css('outline','solid red 2px');
				return false;
			}
			$('#submitForm').submit();
		});
	});
	</script>
	<script type="text/javascript">
	function removeError(id){
		$('#'+id).css('outline','#B0C4DE');	
	}
	</script>
<style>

button#submitbtn {
    border-color: #112048;
    background: #112046;
}



.hero-mask.opacity-8.bg-primary {
    background: rgba(17, 32, 70, 0.84) !important;
}


</style>
</head>
<body>
	<div id="main-wrapper" class="h-100">
		<div class="container-fluid px-0 h-100">
			<div class="row no-gutters h-100">
				<!-- Welcome Text
      ============================================= -->
				<div class="col-md-6">
					<div class="hero-wrap d-flex align-items-center h-100">
						<div class="hero-mask opacity-8 bg-primary"></div>
						<div class="hero-bg hero-bg-scroll"
							style="background-image: url('images/smartphone.jpg');"></div>
						<div class="hero-content mx-auto w-100 h-100 d-flex flex-column">
							<div class="row no-gutters">
								<div class="col-10 col-lg-9 mx-auto">
									<!--                <div class="logo mt-5 mb-5 mb-md-0"> <a class="d-flex" href="index.html" title="Payyed - HTML Template"><img src="images/logo-light.png" alt="Payyed"></a> </div>-->
								</div>
							</div>
							<div class="row no-gutters my-auto">
								<div class="col-10 col-lg-9 mx-auto">
									<!--                  <h1 class="text-11 text-white mb-4">Welcome back!</h1>-->
									<!--                  <p class="text-4 text-white line-height-4 mb-5">We are glad to see you again! Instant deposits, withdrawals & payouts trusted by millions worldwide.</p>-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Welcome Text End -->

				<!-- Login Form
      ============================================= -->
				<div class="col-md-6 d-flex align-items-center">
					<div class="container my-4">
						<div class="row">
							<div class="col-11 col-lg-9 col-xl-8 mx-auto">
								<a class="d-block text-center" href="au"
									title="Payyed - HTML Template"><img
									src="${pageContext.request.contextPath}/images/jafodetfinal-logo.png" style="width:300px;"
									alt="Payyed"></a> <br>
								<h3 class="font-weight-400 mb-2 text-center">Forgot Password.</h3>
								<form id="signform">
 -->								</form>
<form action="changeforgotpasswordupdate" id="submitForm" method="POST">
	   <input type="hidden" name="customerId" value="${customerId}">
				
													<div class="form-group">
										<input type="text" class="form-control"
					                        id="newpassword" name="newpassword"
											onkeyup="removeError('newpassword')" required
											 placeholder="Enter newpassword">
									</div>
				
																	<div class="form-group">
										<input type="text" class="form-control"
					                        id="confirmpassword" name="confirmpassword"
											onkeyup="removeError('confirmpassword')" required
											 placeholder="Enter confirmpassword">
									</div>
									              	<button class="btn btn-primary btn-block my-4" type="button"
										id="submitbtn">Submit </button>
									</form>
				
							</div>
						</div>
					</div>
				</div>
				<!-- Login Form End -->
			</div>
		</div>
	</div>

	<!-- Back to Top
============================================= -->
	<a id="back-to-top" data-toggle="tooltip" title="Back to Top"
		href="javascript:void(0)"><i class="fa fa-chevron-up"></i></a>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/theme.js"></script>
</body>
</html>