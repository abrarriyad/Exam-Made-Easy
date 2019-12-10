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
    <title>Student List</title>
   <link rel="icon" type="image/x-icon" href="logo.png" />
  </head>
  <body>
    
   <nav class="navbar navbar-expand-lg  navbar-dark bg-dark ">
  <a class="navbar-brand heading" href="#" >Exam Made Easy</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse " id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item ">
        <a class="nav-link " href="ExamListServlet">Home</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="StudentListServlet">Student List <span class="sr-only"></span></a>
      </li>
 	      <li class="nav-item">
        <a class="nav-link" href="ResultListServlet">Result List <span class="sr-only"></span></a>
      </li>
 	
      <li class="nav-item">
        
        <!-- Button trigger modal -->
<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#exampleModalCenter">
  Create Exam
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
     
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
 
                  <div class="card">
            <div class="card-header" style="background-color: 	#d9534f;">
                <h4 class="card-title" style="color: #f9f9f9;">Create A Exam!</h4>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/ExamControllerServlet" method="get">
                
                <input type="hidden" name="command" value="ADD"/>
                
                    <div class="form-group row">
                        <label for="course_title" class="col-sm-3 col-form-label">Exam Title:</label>
                        <div class="col-sm-9 col-md-4">
                            <div class="input-group">
                                
                                <input name="examName" type="text" class="form-control" placeholder="Exam Name" aria-describedby="sizing-addon2" required>
                            </div>
                        </div>
                    </div>
                        <div class="form-group row">
                        <label for="course_title" class="col-sm-3 col-form-label">Exam Id:</label>
                        <div class="col-sm-9 col-md-4">
                            <div class="input-group">
                                
                                <input name="examId" type="text" class="form-control" placeholder="Exam Code" aria-describedby="sizing-addon2" required>
                            </div>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="time_toggle" class="col-sm-3 col-form-label">Duration</label>
                        <div class="col-sm-9">
                          
                            <div class="form-inline">
                                <div class="form-group">
                                    <input name="examDuration" type="text" class="form-control text-center" value="20" style="width:50px;">
                                </div>
                                <div class="form-group">
                                    <select class="custom-select">
                <option value="minutes"selected>Minutes</option>
              </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                     <button type="submit" class="btn btn-success">Create Exam</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
                </form>
            </div>
        </div>
        
      </div>
     
    </div>
  </div>
</div>
        
    </ul>
    
  </div>
       <div class="d-flex flex-row-reverse bd-highlight">
       
 	<a type="submit" href="LogoutServlet" class="btn btn-warning float-right mr-3">Log Out</a>
 	<li class="nav-item">
      <span class="badge badge-pill badge-primary mt-2 ml-5 mr-2">Teacher</span>
      <span class="badge badge-info mr-5"><%= session.getAttribute("name") %></span>
      </li>
 	</div>
    
</nav>
     
 <section class="teacher-home p-3">           

<section class="container">
	
	<div class="table-responsive">
        <table class="table table-hover table-dark">
  <thead>
    <tr>
      <th scope="col">Student ID</th>
      <th scope="col">Student Name</th>
      <th scope="col">Depertment</th>
      <th scope="col">Session</th>
    </tr>
        
          </thead>
  <tbody>
  
    <%!int data=1;%>
        <%
            ArrayList<Student> studentList = (ArrayList<Student>) request.getAttribute("studentList");
        	
           for(Student student : studentList){
        %>
       <tr>
    <c:url var="result" value="StudentResultListServlet2">
      	<c:param name="studentId" value="<%=student.getId() %>"/>
      </c:url>
    
      <td><%=student.getId() %></td>
       <td><%=student.getFirstName() %></td>
       <td><%=student.getDepertment() %></td>
		<td><%=student.getSession() %> </td>     
      <td><a class="btn btn-outline-info mr-3" href="${result}">Show Result</a></td>
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