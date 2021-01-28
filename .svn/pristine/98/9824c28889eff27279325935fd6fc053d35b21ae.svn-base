<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		//alert('hiii');
		//if (window.history && window.history.pushState) {
		//alert('inside if condition   ');
		//window.history.pushState('forward', null, null);
		// $(window).on('popstate', function () {
		//	alert('back');
		//  window.location.href = 'http://stackoverflow.com';
		// });
		//}

		/*   window.onpopstate = function(event){
		  	history.pushState({page: 1}, "title 1", "?page=1");
		  }; */
		/* window.onpopstate = function(event) {
			alert('hii');
			  alert("location: " + document.location + ", state: " + JSON.stringify(event.state));
			}; */
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
 $('#loginbtn').click(function() {

			var userName = $('#userName').val();

			if (userName == "") {
				$('#userName').focus().css('outline', 'solid red 2px');
				return false;
			}
			$('#loginForm').attr("action", "Resetpassword");
			$('#loginForm').attr("method", "POST");
			$('#loginForm').submit();

		});
	});
</script>
<script type="text/javascript">
	function removeError(id) {
		$('#' + id).css('outline', '#B0C4DE');
	}
</script>
<style>

button#loginbtn {
    border-color: #112048;
    background: #112046;
}


#signupbtn {
	background: transparent;
	border: 0;
	color: #112145;
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
									title="Payyed - HTML Template">
									<img src="/images/adminlogo/${adminId}/${adminLogo}" style="width:300px;"
									alt="Payyed"></a> <br>
								<h3 class="font-weight-400 mb-2 text-center">Welcome back.</h3>
								<form id="signform">
									<%-- <input type="hidden" name="modeOfPayment" id="modeOfPayment"
										value="${modeOfPayment}"> <input type="hidden"
										id="paymentType" name="paymentType" value="${paymentType}">
									<input type="hidden" id="toCountry" name="receivingBranch"
										value="${receivingBranch}" /> <input type="hidden"
										id="fromCountry" name="sendingBranch" value="${sendingBranch}" />
									<input type="hidden" id="adminId" name="adminId"
										value="${adminId}" /> <input type="hidden" name="page"
										value="${page}" /> <input type="hidden" name="sendingAmount"
										value="${sendingAmount}" /> <input type="hidden"
										name="deliveryTime" value="${deliveryTime}">
									<input type="hidden" name="receivingAmount" value="${receivingAmount}"/>
									<input type="hidden" name="msidnInformationId" value="${msidnInformationId}">  
									<input type="hidden" name="destination_currency" id="destination_currency" value="${destination_currency}"> 
								    <input type="hidden" name="product_requested" id="product_requested" value="${product_requested}">
									<input type="hidden" name="retail_price" id="retail_price" value="${retail_price}">
									<input type="hidden" name="operator" id="operator" value="${operator}">
									<input type="hidden" name="operatorid" id="operatorid" value="${operatorid}">
									<input type="hidden" name="country" id="country" value="${country}"> 
									<input type="hidden" name="countryid" id="countryid" value="${countryid}">
									<input type="hidden" name="destination_msisdn" value="${destination_msisdn}"> --%>
									
<!-- 									<p class="text-center mb-4">
										New to QuiqSend? <a href="#"><button id="signupbtn">Sign
												up</button></a>
									</p>
 -->								</form>
								<form id="loginForm">
										
									<div class="form-group">
										<input type="text" class="form-control"
					                        id="username" name="username"
											onkeyup="removeError('userName')" required
											placeholder="Your Email address or Mobile Number">
									</div>
              	<button class="btn btn-primary btn-block my-4" type="button"
										id="loginbtn">Submit </button>
									<!-- <div class="row mb-4">
										<div class="col-sm">
											<div class="form-check custom-control custom-checkbox">
												<input id="remember-me" name="remember"
													class="custom-control-input" type="checkbox"> <label
													class="custom-control-label" for="remember-me">Remember
													this device</label>
											</div>
										</div>
									 -->	<!-- <div class="col-sm text-right">
											<a class="btn-link" href="forgotpassword">Forgot Password
												?</a>
										</div> -->
									</div>
									<!--  <a href="#" class="btn btn-sm btn-secondary btn-block">
                <i class="fab fa-facebook-square float-left"></i>
                Connect with Facebook</a>
                <a href="#" class="btn btn-sm btn-secondary btn-block">
                <i class="fab fa-google float-left"></i>
                Connect with Google</a>
                 -->
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