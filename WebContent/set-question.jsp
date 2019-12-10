<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.exam.easy.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">    
    <title>Set Question</title>
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
      <li class="nav-item active">
        <a class="nav-link active" href="ExamListServlet">Home</a>
      </li>
      <li class="nav-item">
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
    

<section class="container p-3">



      
<div class="alert alert-info sticky-top" role="alert">
   <p class="text-monospace text-dark">Exam Name: ${THE_EXAM.examName}</p>
 <p class="text-monospace text-dark">Exam Code: ${THE_EXAM.examCode}</p>
</div>

<form class="mt-5" action="${pageContext.request.contextPath}/ExamControllerServlet" method="get">
        <div class="row">
            <div class=col-md-8>
            
                       <div class="form-group">
                           

                          
                           <input type="hidden" name="examName" value="${THE_EXAM.examName}"/>
                           <input type="hidden" name="examCode" value="${THE_EXAM.examCode}"/>
                           <input type="hidden" name="quesList" value="${quesList}"/>
                   	
                            <textArea  class="shadow-lg  bg-white rounded border border-warning rounded" name="description" rows="12" cols="90" required></textArea>
                        </div>
                <footer>
                <button name="command" value="AddQues" type="submit" class="btn btn-success">Add Question</button>
                <button type="button" class="btn btn-danger">Reset</button>
                </footer>
            </div>
            
            <div class=col-md-4>
            

  <div class="form-group">
      <label> Options</label>
    <input name="optionA" type="text" class="form-control border border-primary rounded" id="formGroupExampleInput" placeholder="Option 1" required>
  </div>
  <div class="form-group">
    <input name="optionB" type="text" class="form-control border border-primary rounded" id="formGroupExampleInput2" placeholder="Option 2" required>
  </div>
  <div class="form-group">
    <input name="optionC" type="text" class="form-control border border-primary rounded" id="formGroupExampleInput2" placeholder="Option 3" required>
  </div>
<div class="form-group">
    <input name="optionD" type="text" class="form-control border border-primary rounded" id="formGroupExampleInput2" placeholder="Option 4" required>
  </div>
<div class="form-group">
    <input name="correctAns" type="text" class="form-control border border-success rounded" id="formGroupExampleInput2" placeholder="Correct Answer" required>
  </div>

            
            </div>
         

      </div>  
        
  </form>

        <table class="table table-hover table-dark mt-5">
  <thead>
    <tr>
      <th scope="col">Description</th>
      <th scope="col">A</th>
      <th scope="col">B</th>
      <th scope="col">C</th>
      <th scope="col">D</th>
      <th scope="col">Correct</th>
    </tr>
        
     </thead>
     
  <tbody>
 <input type="hidden" name="command" value="LIST-QUES"/>
    <%!int data=1; int i=1;%>
        <%
            ArrayList<QuestionPaper> quesList = (ArrayList<QuestionPaper>) request.getAttribute("quesList");
        	
        if(quesList!=null){
           for(i=0; i<quesList.size(); i++,data++){
        %>
       <tr>
    	
      <td class="font-weight-light"><%=quesList.get(i).getDescription() %></td>
      <td class="font-weight-light"><%=quesList.get(i).getOptionA() %></td>
      <td class="font-weight-light"><%=quesList.get(i).getOptionB() %></td>
      <td class="font-weight-light"><%=quesList.get(i).getOptionC() %></td>
      <td class="font-weight-light"><%=quesList.get(i).getOptionD() %></td>
      <td class="font-weight-light"><%=quesList.get(i).getCorrectAns() %></td>
      
      
    </tr>  
      <%
           }
        }
      %>

  </tbody>
</table>


  
   </section>
   
     
     <!-- jQuery -->
    <script src="assets/vendor/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/vendor/popper.min.js"></script>
    <script src="assets/vendor/bootstrap.min.js"></script>

    <!-- Simplebar -->
    <!-- Used for adding a custom scrollbar to the drawer -->
    <script src="assets/vendor/simplebar.js"></script>

    <!-- MDK -->
    <script src="assets/vendor/dom-factory.js"></script>
    <script src="assets/vendor/material-design-kit.js"></script>

    <!-- Sidebar Collapse -->
    <script src="assets/vendor/sidebar-collapse.js"></script>

    <!-- App JS -->
    <script src="assets/js/main.js"></script>


    <!-- Vendor JS -->
    <script src="assets/vendor/summernote.min.js"></script>
    <script src="assets/vendor/bootstrap-datepicker.min.js"></script>
    <script src="assets/vendor/jquery.nestable.js"></script>



    <!-- Init -->
    <script src="assets/js/summernote.js"></script>
    <script src="assets/js/date-time.js"></script>
    <script src="assets/js/nestable.js"></script>
 


</body>


<!-- Mirrored from learnplus.frontendmatter.com/fixed-instructor-quiz-edit.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Apr 2018 15:59:39 GMT -->
</html>