  <%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
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

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
		      <link rel="icon" type="image/x-icon" href="logo.png" />
        <title>Invalid Login!</title>
      </head>
      <body>

          <section class="container p-5 mt-3">

              <div class="alert alert-danger" role="alert">
      <h4 class="alert-heading">Invalid Login!</h4>
      <p>The email address or password that you've entered doesn't match any account.</p>
      <hr>
      <p class="mb-0">Please enter correct email address and password to login</p>
              
              </div>
              
                                      <form  class="p-5" action="${pageContext.request.contextPath}/LoginServlet" method="get">
                              <div class="form-row">
                                <div class="col">
                                  <input name="email" type="email" class="form-control form-control form-control-sm border border-danger" placeholder="Email">
                                </div>
                                <div class="col">
                                  <input name="password" type="password" class="form-control form-control form-control-sm border border-danger" placeholder="Password">
                                </div>
                                <div class="col">
                                    <button type="submit" class="btn btn-outline-success btn-sm">LOG IN</button>
                                </div>
                              </div>
                            </form>
          </section>

          

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
      </body>
    </html>