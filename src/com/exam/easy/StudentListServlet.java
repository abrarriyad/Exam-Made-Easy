package com.exam.easy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentListServlet")
public class StudentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection connection = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");

			String query = "select * from student";

			Statement statement = connection.createStatement();
			statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			ArrayList<Student> studentList = new ArrayList<>();

			while (resultSet.next()) {
				Student student = new Student();

				student.setId(resultSet.getString(1));
				student.setFirstName(resultSet.getString(2));
				student.setLastName(resultSet.getString(3));
				student.setEmail(resultSet.getString(4));
				student.setPassword(resultSet.getString(5));
				student.setDepertment(resultSet.getString(6));
				student.setSession(resultSet.getString(7));

				studentList.add(student);
			}
			request.setAttribute("studentList", studentList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/student-list.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
