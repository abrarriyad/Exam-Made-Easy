<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.exam.easy.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link
	href="http://fonts.googleapis.com/css?family=Lato:100,300,400,300italic"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="vendors/css/normalize.css">
<link rel="stylesheet" type="text/css" href="vendors/css/grid.css">

<link rel="icon" type="image/x-icon" href="logo.png" />

<title>EXAM MADE EASY!</title>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#selectTeacher").click(function() {

			$("#inputstudentId").attr("disabled", true);
			$("#inputstudentId").attr("disabled", true);

		});

		$("#selectStudent").click(function() {

			$("#inputstudentId").removeAttr("disabled");
			$("#inputSession").removeAttr("disabled");

		});

	});
</script>


</head>

<body>

	<header>
		<div>
			<div class="website-logo col span-1-0f-2">
				<img src="resources/img/logo.png" alt="Exam Made Easy Logo"
					class="logo">
				<h1>Exam Made Easy</h1>
			</div>

			<nav class="navbar span">
				<div class="row">
					<ul class="main-nav">
						<li>
							<form action="${pageContext.request.contextPath}/LoginServlet"
								method="post">
								<div class="form-row">
									<div class="col">
										<input name="email" type="email"
											class="form-control form-control form-control-sm"
											placeholder="Email">
									</div>
									<div class="col">
										<input name="password" type="password"
											class="form-control form-control form-control-sm"
											placeholder="Password">
									</div>
									<div class="col">
										<button type="submit" class="btn btn-outline-success btn-sm">LOG
											IN</button>
									</div>
								</div>
							</form>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		
		<div class="motto-text-box">
			<h1>
				Goodbye Papers! <i class="ion-happy-outline"></i>
			</h1>
			
			<a class="bttn btn-full" href="#sign-up">Sign Up</a> <a
				class="bttn btn-ghost" href="#">About Us</a>
		</div>
		
	</header>


	<section class="section-sign-up row" id="sign-up">
		<div class="row">
			<h2 class="font-weight-bold">Sign Up Now!</h2>
		</div>

		<form
			action="${pageContext.request.contextPath}/SignUpControllerServlet"
			method="post" class="form-sign-up">
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<input name="firstName" type="text" class="form-control"
						id="inputFirstName" placeholder="First Name" required>
				</div>

				<div class="form-group col-md-6">
					<input name="lastName" type="text" class="form-control"
						id="inputLastName" placeholder="Last Name">
				</div>
			</div>


			<div class="form-row">
				<div class="form-group col-md-6">
					<input name="email" type="email" class="form-control"
						id="inputEmail4" placeholder="Email" required>
				</div>
				<div class="form-group col-md-6">
					<input name="password" type="password" class="form-control"
						id="inputPassword4" placeholder="Password" required>

				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<select name="role" id="role" class="form-control" required>
						<option selected>Select Role</option>
						<option id="selectStudent">Student</option>
						<option id="selectTeacher">Teacher</option>
					</select>
				</div>

				<div class="form-group col-md-6">
					<select name="depertment" id="inputState2" class="form-control"
						required>
						<option selected>Depertment</option>
						<option>CSE</option>
						<option>ICT</option>
						<option>TE</option>
						<option>BMB</option>
						<option>BGE</option>
						<option>CPS</option>
						<option>CHE</option>
						<option>PHY</option>
						<option>MTH</option>
						<option>PHA</option>
						<option>ECO</option>
						<option>BBA</option>
					</select>
				</div>


			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<input name="studentId" type="text" class="form-control"
						id="studentId" placeholder="Student Id" required>
				</div>

				<div class="form-group col-md-6">
					<input name="session" type="text" class="form-control" id="session"
						placeholder="Session" required>
				</div>
			</div>






			<div class="form-group">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="gridCheck"
						required>
					<h6 style="color: #fff">I agree to the terms and conditions</h6>
				</div>
			</div>

			<button type="submit"
				class="btn btn-primary btn-lg btn-block float-right">Sign
				Up</button>


		</form>
	</section>

	<!-- Section: Team v.2 -->
	<section class="about-us">
		<h2 class="h1-responsive font-weight-bold my-5 ">Our amazing team</h2>
		<div class="row team-section text-center mb-5">

			<!-- Section heading -->
			<!-- Section description -->
			<p class="grey-text w-responsive mx-auto mb-5">We are from
				Mawlana Bhasani Science and Technology University. This project is
				develped as a third year software project.</p>

			<!-- Grid row -->
			<div class="row text-center">

				<!-- Grid column -->
				<div class="col-md-5">
					<div class="avatar  mr-5">
						<img src="resources/img/DSC_0190.jpg" class="profile"
							alt="Sample avatar">
					</div>
					<h6 class="font-weight-light dark-grey-text my-4">RASHID ABRAR</h6>
					<small class="text-uppercase grey-text mb-3"><strong>Web
							Developer</strong></small>
					<!--Linkedin -->
					<div class="row">
						<div class="col span-1-of-3">
							<a href="#"><i class="ion-social-facebook social-icon"></i></a>
						</div>

						<div class=" col span-1-of-3">
							<a href=#><i class="ion-social-twitter social-icon"></i></a>
						</div>

						<div class=" col span-1-of-3">
							<a href="#"><i class="ion-social-skype social-icon"></i></a>
						</div>
					</div>
				</div>
				<!-- Grid column -->


				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-7">
					<div class="avatar mx-auto">
						<img src="resources/img/hadifur_sir.jpg" class="profile"
							alt="Sample avatar">
					</div>
					<h6 class="font-weight-light dark-grey-text my-4">MD. HADIFUR
						RAHMAN</h6>
					<small class="text-uppercase grey-text mb-3"><strong>Supervisor</strong></small>

					<div class="row pr-4 pl-4">
						<div class="col span-1-of-3">
							<a href="#"><i class="ion-social-facebook social-icon"></i></a>
						</div>

						<div class=" col span-1-of-3">
							<a href=#><i class="ion-social-twitter social-icon"></i></a>
						</div>

						<div class=" col span-1-of-3">
							<a href="#"><i class="ion-social-skype social-icon"></i></a>
						</div>
					</div>
				</div>
				<!-- Grid column -->

			</div>
			<!-- Grid row -->

		</div>
	</section>
	<!-- Section: Team v.2 -->

	<footer class="foot">
		<div class="footer-left">
			<small> <i class="far fa-copyright"></i> 2018 Rashid Abrar
				Riyad
			</small>
		</div>

		<div class="footer-right">

			<div class="row">
				<div class="col span-1-of-3">
					<a href="#"><i class="ion-social-github" style="color: #363636"></i></a>
				</div>

				<div class=" col span-1-of-3">
					<a href=#><i class="ion-social-linkedin-outline"
						style="color: #363636"></i></a>
				</div>

				<div class=" col span-1-of-3">
					<a href="#"><i class="ion-email" style="color: #363636"></i></a>
				</div>
			</div>




		</div>
	</footer>

	<script type="text/javascript">
		$(function() {
			$("#role").change(function() {

				if ($("#role option:selected").text() == "Teacher") {

					$("#studentId").hide();
					$("#session").hide();
				}

				else {

					$("#studentId").show();
					$("#session").show();

				}

			});

		});
	</script>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

</body>
</html>