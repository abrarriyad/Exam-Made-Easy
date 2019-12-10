<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.exam.easy.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Instructor - Edit quiz - Fixed layout</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Simplebar -->
    <link type="text/css" href="assets/vendor/simplebar.css" rel="stylesheet">

    <!-- Material Design Icons  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Roboto Web Font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">

    <!-- MDK -->
    <link type="text/css" href="assets/vendor/material-design-kit.css" rel="stylesheet">

    <!-- Sidebar Collapse -->
    <link type="text/css" href="assets/vendor/sidebar-collapse.min.css" rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css" href="assets/css/style.css" rel="stylesheet">


    <!-- Touchspin -->
    <link rel="stylesheet" href="assets/css/bootstrap-touchspin.css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="assets/css/nestable.css">
    
        <link rel="stylesheet" href="../cdn.jsdelivr.net/fontawesome/4.5.0/css/font-awesome.min.css">
    <!-- Bootstrap Datepicker -->
    <link rel="stylesheet" href="assets/css/bootstrap-datepicker.css">
    <!-- Summernote WYSIWYG -->
    <link rel="stylesheet" href="assets/css/summernote.css">
    <!-- Nestable -->
    <link rel="stylesheet" href="assets/css/nestable.css">



</head>

<body class="ls-top-navbar">


    <!-- Navbar -->
    <nav class="navbar navbar-expand navbar-dark bg-primary m-0 fixed-top">

        <!-- Toggle sidebar -->
        <button class="navbar-toggler d-block" data-toggle="sidebar" type="button">
    <span class="material-icons">menu</span>
  </button>

        <!-- Brand -->
        <a href="fixed-instructor-dashboard.html" class="navbar-brand"><i class="material-icons">school</i>Online Exam</a>


        <div class="navbar-spacer"></div>
<section></section>
   

        <!-- Menu -->
        <ul class="nav navbar-nav">
            <!-- User dropdown -->
            <li class="nav-item dropdown">
                <a class="nav-link active dropdown-toggle" data-toggle="dropdown" href="#" role="button"><img src="img/teacher.png" alt="Avatar" class="rounded-circle" width="40"></a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">
      <i class="material-icons">edit</i> Edit Account
    </a>
                    <a class="dropdown-item" href="#">
      <i class="material-icons">person</i> Public Profile
    </a>
                    <a class="dropdown-item" href="newboston.html">
      <i class="material-icons">lock</i> Logout
    </a>
                </div>
            </li>
            <!-- // END User dropdown -->
        </ul>
    </nav>
    <!-- // END Navbar -->

    <div class="container">

        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="fixed-instructor-dashboard.html">Home</a></li>
            <li class="breadcrumb-item"><a href="fixed-instructor-quizzes.html">Teacher Panel</a></li>
        </ol>
        <div>
             
        <h1 class="page-heading h2">Set Question Paper</h1>
       
      
        </div>
          <div class="card">
            <div class="card-header">
                <h4 class="card-title">Basic Info</h4>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/ExamControllerServlet" method="post">
                    <div class="form-group row">
                        <label for="course_title" class="col-sm-3 col-form-label">Exam Title:</label>
                        <div class="col-sm-9 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon" id="sizing-addon2">#</span>
                                <input name="examName" type="text" class="form-control" placeholder="Exam Name" aria-describedby="sizing-addon2">
                            </div>
                        </div>
                    </div>
                        <div class="form-group row">
                        <label for="course_title" class="col-sm-3 col-form-label">Exam Code:</label>
                        <div class="col-sm-9 col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon" id="sizing-addon2">#</span>
                                <input name="examCode" type="text" class="form-control" placeholder="Exam Code" aria-describedby="sizing-addon2">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="course_title" class="col-sm-3 col-form-label">Course:</label>
                        <div class="col-sm-9 col-md-4">
                            <select class="custom-select form-control">
            <option value="#">Java &amp; Mobile Application</option>
            <option value="#">Database Management System</option>
            <option value="#" selected>Electronics &amp; Devices</option>
          </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="time_toggle" class="col-sm-3 col-form-label">Timeframe</label>
                        <div class="col-sm-9">
                            <div class="switch">
                                <input id="cmn-toggle" class="switch-toggle switch-toggle-round" type="checkbox" checked>
                                <label for="cmn-toggle"></label>
                            </div>
                            <div class="form-inline">
                                <div class="form-group">
                                    <input name="timeFrame" type="text" class="form-control text-center" value="20" style="width:50px;">
                                </div>
                                <div class="form-group">
                                    <select class="custom-select">
                <option value="minutes"selected>Minutes</option>
              </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-lg"style="float: right">Save</button>
                </form>
            </div>
        </div>
        </div>
        <div class="row">
            <div class=col-md-8>
            
                       <div class="form-group">
                            <label for="details">Description</label>
                            <div id="summernote">
                           </div>
                        </div>
                <footer>
                <button type="button" class="btn btn-success">Add Question</button>
                <button type="button" class="btn btn-danger">Reset</button>
                </footer>
                
                
            </div>
            
            <div class=col-md-4>
            
                <form>
  <div class="form-group">
      <level> Options</level>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Option 1">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Option 2">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Option 3">
  </div>
<div class="form-group">
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Option 4">
  </div>
<div class="form-group">
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Correct Answer">
  </div>
</form>
            
            </div>
         

        
        
        

        <div class="footer">
            Copyright &copy; 2018 - <a>Rashid Abrar</a>
        </div>
    </div>




    <div class="mdk-drawer js-mdk-drawer" id="default-drawer">
        <div class="mdk-drawer__content ls-top-navbar-xs-up">
            <div class="sidebar sidebar-left sidebar-light bg-white o-hidden">
                <div class="sidebar-p-y" data-simplebar data-simplebar-force-enabled="true">
 \
                    <div class="sidebar-heading">Teacher</div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i> Exam Results
            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">help</i> Exam Manager
            </a>
                        </li>
        
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="newboston.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">lock_open</i> Logout
            </a>
                        </li>
                    </ul>
                    <!-- Components menu -->
                   
            </div>
        </div>
    </div>


   
    
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



    <div class="modal fade" id="editQuiz">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Add/Edit Question</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                </div>
                <div class="modal-body">
                    <form action="#">
                        <div class="form-group row">
                            <label for="" class="col-form-label col-md-3">Title:</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" value="Database Access">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-form-label col-md-3">Type:</label>
                            <div class="col-md-4">
                                <select class="custom-control custom-select form-control">
                
                <option value="1">Input</option>
                <option value="2">Textarea</option>
                <option value="3">Checkbox</option>
                <option value="3">Radio</option>
              </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-form-label col-md-3">Answers:</label>
                            <div class="col-md-9">
                                <a href="#" class="btn btn-default"><i class="material-icons">add</i> Add Answer</a>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-form-label col-md-3">Question Score:</label>
                            <div class="col-md-4">
                                <input id="touch-spin-2" data-toggle="touch-spin" data-min="0" data-max="100" data-step="5" type="text" value="50" name="demo2" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-8 offset-md-3">
                                <button type="submit" class="btn btn-success">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>


<!-- Mirrored from learnplus.frontendmatter.com/fixed-instructor-quiz-edit.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Apr 2018 15:59:39 GMT -->
</html>