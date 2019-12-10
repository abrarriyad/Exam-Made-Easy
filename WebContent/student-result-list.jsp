<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.exam.easy.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="resources/css/teacher_style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title>Result List</title>
   <link rel="icon" type="image/x-icon" href="logo.png" />
  </head>
  <body>
    
    
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Exam Made Easy</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse " id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="StudentHomeServlet">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="StudentResultListServlet">Result List <span class="sr-only">(current)</span></a>
      </li>
      
 
 	<%
 	//HttpSession session = request.getSession();
 
 	%>
  </div>
      <div class="d-flex flex-row-reverse bd-highlight">
       
 	<a type="submit" href="LogoutServlet" class="btn btn-warning float-right mr-3">Log Out</a>
 	<li class="nav-item">
      <span class="badge badge-pill badge-primary mt-2 ml-5 mr-2">Student</span>
      <span class="badge badge-info mr-2"><%= session.getAttribute("name") %></span>
      <span class="badge badge-success mr-5"><%= session.getAttribute("id") %></span>
      </li>
 	</div>
    
</nav>
     
 <section class="teacher-home">           

<section class="container">
	
	<div class="table-responsive p-3">
        <table class="table table-hover table-dark ">
  <thead>
    <tr>
      <th scope="col">Exam ID</th>
      <th scope="col">Exam Name</th>
      <th scope="col">Score</th>
    </tr>
        
          </thead>
  <tbody>
  
    <%!int data=1;%>
        <%
            ArrayList<Result> resultList = (ArrayList<Result>) request.getAttribute("resultList");
        	
           for(Result result : resultList){
        %>
       <tr>
    	
      		
      
      <td><%=result.getExamId() %></td>
       <td><%=result.getExamName() %></td>
		<td><%=result.getScore() %> </td>     
      
    </tr>  
      <%
           }
      %>

  </tbody>
</table>
     </div> 
      
</section>
     </section> 

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </body>
</html>