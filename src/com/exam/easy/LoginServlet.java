package com.exam.easy;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Teacher teacher = null;
		Student student = null;
		
		TeacherDbUtil teacherDbUtil = new TeacherDbUtil();
		StudentDbUtil studentDbUtil = new StudentDbUtil();
		
		teacherDbUtil.connect();
		studentDbUtil.connect();
		
		try {
			teacher = teacherDbUtil.getTeacherByEmail(email);
			if(teacher!=null) {
			if(teacher.getEmail().equals(email) && teacher.getPassword().equals(password)) {
				
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("name", teacher.getFirstName());
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/ExamListServlet");
				dispatcher.forward(request,response);
			}
				else {
					response.sendRedirect("/index.jsp");
				}
			
			}
		
		}catch (Exception e) {
	
			student = studentDbUtil.getStudentByEmail(email);
			try {
			 if(student.getEmail().equals(email) && student.getPassword().equals(password)) {
					
					HttpSession session = request.getSession();
					session.setAttribute("email", email);
					session.setAttribute("id", student.getId());
					session.setAttribute("name", student.getFirstName());
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentHomeServlet");
					dispatcher.forward(request, response);
					//response.sendRedirect("/StudentHomeServlet");
				
			}
			}
			 catch (Exception ex) {
				 RequestDispatcher dispatcher = request.getRequestDispatcher("/invalid-login.jsp");
					dispatcher.forward(request, response);
			} 
				
			
		}

	}

}
