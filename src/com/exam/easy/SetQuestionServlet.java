package com.exam.easy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SetQuestionServlet")
public class SetQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SetQuestionServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String examName = (String) request.getParameter("examName");
		String examId = (String) request.getParameter("examId");

		String examCode = examName.concat(examId);

		CreateQuesDbUtil createQuesDbUtil = new CreateQuesDbUtil();
		createQuesDbUtil.connect();

		Exam exam = createQuesDbUtil.getExam(examId);

		ArrayList<QuestionPaper> questionList = (ArrayList<QuestionPaper>) request.getAttribute("quesList");

		request.setAttribute("THE_EXAM", exam);
		request.setAttribute("quesList", questionList);

		QuestionPaper questionPaper = new QuestionPaper();

		questionPaper.setDescription(request.getParameter("description"));
		questionPaper.setOptionA(request.getParameter("optionA"));
		questionPaper.setOptionB(request.getParameter("optionB"));
		questionPaper.setOptionC(request.getParameter("optionC"));
		questionPaper.setOptionD(request.getParameter("optionD"));
		questionPaper.setCorrectAns(request.getParameter("correctAns"));

		createQuesDbUtil.addQuestion(examCode, questionPaper);

		try {
			createQuesDbUtil.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/set-question.jsp");
		dispatcher.forward(request, response);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");

			String examName = (String) request.getParameter("examName");
			String examCode = (String) request.getParameter("examId");

			// String examId = request.getParameter("examId");
			String code = examName.concat(examCode);

			String query = "select * from " + code;

			statement = connection.createStatement();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);

			ArrayList<QuestionPaper> questionList = new ArrayList<>();

			while (resultSet.next()) {

				QuestionPaper questionPaper = new QuestionPaper();

				questionPaper.setNumber(resultSet.getInt(1));
				questionPaper.setDescription(resultSet.getString(2));
				questionPaper.setOptionA(resultSet.getString(3));
				questionPaper.setOptionB(resultSet.getString(4));
				questionPaper.setOptionC(resultSet.getString(5));
				questionPaper.setOptionD(resultSet.getString(6));
				questionPaper.setCorrectAns(resultSet.getString(7));

				questionList.add(questionPaper);
			}
			request.setAttribute("quesList", questionList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
