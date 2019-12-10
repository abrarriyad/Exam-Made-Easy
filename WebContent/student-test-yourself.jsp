<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.exam.easy.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Test Yourself</title>


<meta name="robots" content="noindex">
<meta http-equiv="Refresh" content="${duration};url=result-sheet.jsp">
<link type="text/css" href="style.css" rel="stylesheet">


<link type="text/css" href="assets/vendor/simplebar.css"
	rel="stylesheet">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">


<link type="text/css" href="assets/vendor/material-design-kit.css" rel="stylesheet">

<link type="text/css" href="assets/vendor/sidebar-collapse.min.css" rel="stylesheet">

<link type="text/css" href="assets/css/style.css" rel="stylesheet">

<link rel="icon" type="image/x-icon" href="logo.png" />

<script src="http://code.jquery.com/jquery-latest.js"></script>


</head>



<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Exam Made Easy</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse " id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="StudentHomeServlet">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="StudentResultListServlet">Result List <span
						class="sr-only">(current)</span></a></li>
			</ul>

		</div>
		<div class="d-flex flex-row-reverse bd-highlight">

			<a type="submit" href="LogoutServlet"
				class="btn btn-warning float-right mr-3">Log Out</a>
			<li class="nav-item"><span
				class="badge badge-pill badge-primary mt-2 ml-5 mr-2">Student</span>
				<span class="badge badge-info mr-2"><%=session.getAttribute("name")%></span>
				<span class="badge badge-success mr-5"><%=session.getAttribute("id")%></span>
			</li>
		</div>

	</nav>


	<div class="mdk-drawer-layout js-mdk-drawer-layout flex" data-fullbleed
		data-push data-has-scrolling-region>
		<div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
			<div class="container-fluid">


				<div class="card-group border border-primary rounded p-2">
					<div class="card">
						<div class="card-body text-center">
							<h4 class="mb-0">
								<strong>${total}</strong>
							</h4>
							<small class="text-muted-light">TOTAL</small>
						</div>
					</div>

					<%! int i = 0;
					int marks = 0;
					int j = i + 1; %>
					
					
					<div class="card ">
						<div class="card-body text-center">
							<h4 class="text-primary mb-0">
								<strong>${exam.examName}</strong>
							</h4>
							<small class="text-muted-light">Exam Name</small>
						</div>
					</div>


					<div class="card">
						<div class="card-body text-center">
							<h4 class="text-success mb-0">
								<strong>${exam.duration} min</strong>
							</h4>
							<small class="text-muted-light">Duration</small>
						</div>
					</div>
					<div class="card">
						<div class="card-body text-center">
							<div class="sidebar-heading">Time left</div>

							<div id="timeLeft" class="countdown sidebar-p-x a"
								data-value="${exam.duration}" data-unit="minute"></div>

						</div>
					</div>

				</div>


				<form action="${pageContext.request.contextPath}/ResultServlet"
					method="get">
					<input type="hidden" name="score" id="score" value="0" /> <input
						type="hidden" name="examName" value="${exam.examName}" /> <input
						type="hidden" name="examCode" value="${exam.examCode}" />
					<Button type="submit" class="btn btn-success">Show Result</Button>
				</form>


				<div class="card " id="aaa">


					<input type="hidden" name="command" value="TEST-QUES" />



					<%
						ArrayList<QuestionPaper> quesList = (ArrayList<QuestionPaper>) request.getAttribute("quesList");

						if (quesList != null && i < quesList.size()) {

							// String correctAns = quesList.get(i).getCorrectAns();
					%>

					<script>
						var cnt = 0;
						function submitAnswer() {
							var radios = document.getElementsByName("selected");
							var k = 0, len = radios.length;
							var checked = false;
							var userAnswer;

							var ans = document.getElementsByName("c");

							for (; k < len; k++) {
								if (radios[k].checked) {
									checked = true;
									userAnswer = radios[k].value;
									//alert(userAnswer);
								}
							}
							
							if (!checked) {
								alert("please select choice answer");
								return;
							}
							
							if (userAnswer === ans[0].value) {

								cnt++;
								// document.getElementById("score").value = cnt;
								//alert(cnt);
								// document.getElementById("score").innerHTML = cnt;
								//// alert(document.getElementById("score").value);
							}
						
							else {
								alert("Answer is wrong!");
							}
							document.getElementById("score").value = cnt;
						}
					</script>



					<div class="card-header bg-white">
						<div class="media align-items-center">
							<div class="media-left">
								<h4 class="mb-0">
									<strong><%=j++%></strong>
								</h4>
							</div>
							<div class="media-body">
								<h4 class="card-title">

									<%=quesList.get(i).getDescription()%>
								</h4>
							</div>
						</div>
					</div>


					<div class="card-body">
						<div class="form-group">
							<label class="custom-control custom-radio mb-0"> <input
								name="c" type="hidden"
								value="<%=quesList.get(i).getCorrectAns()%>" /> <input
								name="selected" type="radio"
								class="custom-control-input font-weight-light"
								value="<%=quesList.get(i).getOptionA()%>"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description"><%=quesList.get(i).getOptionA()%></span>
							</label>
						</div>
						
						<div class="form-group">
							<label class="custom-control custom-radio mb-0"> <input
								name="selected" type="radio"
								class="custom-control-input font-weight-light"
								value="<%=quesList.get(i).getOptionB()%>"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description"><%=quesList.get(i).getOptionB()%></span>
							</label>
						</div>
						
						<div class="form-group">
							<label class="custom-control custom-radio mb-0"> <input
								name="selected" type="radio"
								class="custom-control-input font-weight-light"
								value="<%=quesList.get(i).getOptionC()%>"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description"><%=quesList.get(i).getOptionC()%></span>
							</label>
						</div>
						
						<div class="form-group">
							<label class="custom-control custom-radio mb-0"> <input
								name="selected" type="radio"
								class="custom-control-input font-weight-light"
								value="<%=quesList.get(i).getOptionD()%>"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description"><%=quesList.get(i).getOptionD()%></span>
							</label>
						</div>
						
					</div>

					<div class="card-footer">

						<a onclick="jQuery('#aaa').load(' #aaa');" class="btn btn-danger">Skip</a>
						<a type="submit" onclick="jQuery('#aaa').load(' #aaa');"
							class="btn btn-secondary text-white float-right" <%i++;%>>Next<i
							class="material-icons btn__icon--right">send</i></a>
						<button class="btn btn-success float-right mr-3"
							onclick="submitAnswer()">Submit Answer</button>
					</div>

				</div>



				<%
					} else {

						j = 0;
						i = 0;
				%>

				<div class="alert alert-success p-3 m-3" role="alert">

					<h4 class="alert-heading">Well done!</h4>
					<p>Your Exam Is Finished</p>
					<hr>
					<p class="mb-0">CLick on Show Result button for result</p>
				</div>




				<%
					}
				%>
			</div>
		</div>





	
		<script src="assets/vendor/jquery.min.js"></script>

		<script src="assets/vendor/popper.min.js"></script>
		<script src="assets/vendor/bootstrap.min.js"></script>

	
		<script src="assets/vendor/simplebar.js"></script>

		<script src="assets/vendor/dom-factory.js"></script>
		<script src="assets/vendor/material-design-kit.js"></script>

		<script src="assets/vendor/sidebar-collapse.js"></script>

		<script src="assets/js/main.js"></script>


		<!-- Required by countdown -->
		<script src="assets/vendor/moment.min.js"></script>
		<!-- Easy Countdown -->
		<script src="assets/vendor/jquery.countdown.min.js"></script>
		<script src="assets/js/countdown.js"></script>
</body>


</html>