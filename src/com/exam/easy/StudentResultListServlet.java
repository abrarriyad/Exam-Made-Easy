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
import javax.servlet.http.HttpSession;

@WebServlet("/StudentResultListServlet")

public class StudentResultListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentResultListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection connection = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");

			HttpSession session = request.getSession();

			String studentId = session.getAttribute("id").toString();
			String query = "select * from result where studentId = " + "'" + studentId + "'";

			Statement statement = connection.createStatement();
			statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			ArrayList<Result> resultList = new ArrayList<>();

			while (resultSet.next()) {

				Result result = new Result();

				result.setExamId(resultSet.getString(1));
				result.setExamName(resultSet.getString(2));
				result.setStudentId(resultSet.getString(3));
				result.setScore(resultSet.getString(4));

				resultList.add(result);

			}
			request.setAttribute("resultList", resultList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/student-result-list.jsp");
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
