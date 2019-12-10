package com.exam.easy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet("/ExamControllerServlet")
public class ExamControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExamControllerServlet() {
		super();
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setHeader("Cache-Control", "no-cache, no-store, must-validate");

		try {
			String command = request.getParameter("command");

			switch (command) {
			case "LOAD":
				listQues(request, response);
				loadExam(request, response);
				break;

			case "ADD":
				addExam(request, response);
				break;

			case "LIST":
				listExam(request, response);
				break;

			case "LIST-STUDENT":
				listStudent(request, response);
				break;

			case "AddQues":
				listQues(request, response);
				addQues(request, response);
				break;

			case "LIST-QUES":
				listQues(request, response);
				break;
				
			case "TEST-QUES":
				testQues(request, response);
				break;
				
			case "DELETE":
				deleteExam(request, response);
				break;
				
			case "RESULT":
				showResult(request, response);
				break;
				
			default:
				break;
			}
		} catch (Exception e) {

		}
	}

	private void showResult(HttpServletRequest request, HttpServletResponse response) {
		
		String examName = request.getParameter("examName");
		String examCode = request.getParameter("examCode");

		Connection connection = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");

			String query = "select * from result where examId = " + "'" + examCode + "'";

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
			RequestDispatcher dispatcher = request.getRequestDispatcher("/result-list-2.jsp");
			dispatcher.forward(request, response);
		
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void testQues(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String examName = request.getParameter("examName");
		String examCode = request.getParameter("examCode");
		String se = request.getParameter("se");
		
		// System.out.println(examCode);

		Connection connection = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");

			String query = "select * from " + examCode;

			Statement statement = connection.createStatement();
			statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

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
		
			CreateQuesDbUtil createQuesDbUtil = new CreateQuesDbUtil();
			createQuesDbUtil.connect();
			Exam exam = createQuesDbUtil.getExam(examCode);
			request.setAttribute("total", questionList.size());

			int intDuration = Integer.parseInt(exam.getDuration());
			intDuration = intDuration * 60;
			String duration = Integer.toString(intDuration);

			request.setAttribute("exam", exam);
			request.setAttribute("duration", duration);
			request.setAttribute("quesList", questionList);

			// System.out.println(se);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/student-test-yourself.jsp");
			dispatcher.forward(request, response);

		}

		catch (Exception e) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}

	}

	private void deleteExam(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String examCode = request.getParameter("examCode");

		CreateQuesDbUtil createQuesDbUtil = new CreateQuesDbUtil();
		createQuesDbUtil.connect();

		createQuesDbUtil.deleteExam(examCode);
		createQuesDbUtil.deleteExamTable(examCode);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ExamListServlet");
		requestDispatcher.forward(request, response);

		/// response.sendRedirect("/ExamListServlet");

	}

	private void listQues(HttpServletRequest request, HttpServletResponse response) {

		String examName = request.getParameter("examName");
		String examCode = request.getParameter("examCode");

		// System.out.println(examCode);

		Connection connection = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");

			String query = "select * from " + examCode;

			Statement statement = connection.createStatement();
			statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

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

		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void addQues(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String examName = request.getParameter("examName");
		String examCode = request.getParameter("examCode");

		CreateQuesDbUtil createQuesDbUtil = new CreateQuesDbUtil();
		createQuesDbUtil.connect();

		QuestionPaper questionPaper = new QuestionPaper();

		int number = 0;

		questionPaper.setNumber(number);
		number++;
		questionPaper.setDescription(request.getParameter("description"));
		questionPaper.setOptionA(request.getParameter("optionA"));
		questionPaper.setOptionB(request.getParameter("optionB"));
		questionPaper.setOptionC(request.getParameter("optionC"));
		questionPaper.setOptionD(request.getParameter("optionD"));
		questionPaper.setCorrectAns(request.getParameter("correctAns"));

		createQuesDbUtil.addQuestion(examCode, questionPaper);

		Exam exam = new Exam();

		exam = createQuesDbUtil.getExam(examCode);
		request.setAttribute("THE_EXAM", exam);

		listQues(request, response);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/set-question.jsp");
		dispatcher.forward(request, response);

		// response.sendRedirect("/set-question.jsp");
	}

	private void listExam(HttpServletRequest request, HttpServletResponse response) {
		
		Connection connection = null;

		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");

			String query = "select * from exam";

			Statement statement = connection.createStatement();
			statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			ArrayList<Exam> examList = new ArrayList<>();

			while (resultSet.next()) {
				Exam exam = new Exam();
				exam.setExamCode(resultSet.getString(1));
				exam.setExamName(resultSet.getString(2));
				exam.setDuration(resultSet.getString(3));

				examList.add(exam);
			}
			
			request.setAttribute("examList", examList);

		} catch (Exception e) {

		}

	}

	private void listStudent(HttpServletRequest request, HttpServletResponse response) {
		
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

		} catch (Exception e) {

		}

	}

	private void addExam(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String examName = request.getParameter("examName");
		String examId = request.getParameter("examId");
		String examDuration = request.getParameter("examDuration");

		String examCode = examName.concat(examId);

		CreateQuesDbUtil createQuesDbUtil = new CreateQuesDbUtil();
		createQuesDbUtil.connect();

		createQuesDbUtil.createExamTable(examCode);

		Exam exam = new Exam();

		exam.setExamCode(examCode);
		exam.setExamName(examName);
		exam.setDuration(examDuration);

		createQuesDbUtil.addExam(exam);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ExamListServlet");
		requestDispatcher.forward(request, response);

		// response.sendRedirect("/ExamListServlet");
	}

	private void loadExam(HttpServletRequest request, HttpServletResponse response) throws Exception {

		CreateQuesDbUtil createQuesDbUtil = new CreateQuesDbUtil();
		createQuesDbUtil.connect();

		// String examId = request.getParameter("examId");
		String examName = request.getParameter("examName");
		String examCode = request.getParameter("examCode");


		Exam exam = createQuesDbUtil.getExam(examCode);

		request.setAttribute("THE_EXAM", exam);

		listExam(request, response);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/set-question.jsp");
		requestDispatcher.forward(request, response);
	}

}
