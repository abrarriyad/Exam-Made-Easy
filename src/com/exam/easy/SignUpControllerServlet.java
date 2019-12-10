package com.exam.easy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginControllerServlet")

public class SignUpControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignUpControllerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String role = request.getParameter("role");

		if (role.equals("Student")) {

			StudentDbUtil studentDbUtil = new StudentDbUtil();
			Student student = new Student();

			student.setId(request.getParameter("studentId"));
			student.setFirstName(request.getParameter("firstName"));
			student.setLastName(request.getParameter("lastName"));
			student.setEmail(request.getParameter("email"));
			student.setPassword(request.getParameter("password"));
			student.setDepertment(request.getParameter("depertment"));
			student.setSession(request.getParameter("session"));

			studentDbUtil.connect();
			try {
				studentDbUtil.addStudent(student);
			} catch (Exception e) {

			}
		}

		if (role.equals("Teacher")) {

			TeacherDbUtil teacherDbUtil = new TeacherDbUtil();
			Teacher teacher = new Teacher();

			teacher.setFirstName(request.getParameter("firstName"));
			teacher.setLastName(request.getParameter("lastName"));
			teacher.setEmail(request.getParameter("email"));
			teacher.setPassword(request.getParameter("password"));
			teacher.setDepertment(request.getParameter("depertment"));

			teacherDbUtil.connect();
			try {
				teacherDbUtil.addTeacher(teacher);
			} catch (Exception e) {

			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);

	}

}
