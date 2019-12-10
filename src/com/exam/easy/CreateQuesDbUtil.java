package com.exam.easy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CreateQuesDbUtil {

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	PreparedStatement preparedStatement = null;

	public void close() throws SQLException {
		statement.close();
		preparedStatement.close();
		resultSet.close();
		connection.close();
	}

	public void connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void createExamTable(String code) {

		try {

			String query = "create table `" + code
					+ "`(num int,description varchar(1000),optionA varchar(100),optionB varchar(100),optionC varchar(100),optionD varchar(100),correctAns varchar(100))";

			statement = connection.createStatement();
			statement.executeUpdate(query);
			// ResultSet resultSet = statement.executeQuery(query);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteExamTable(String examCode) {

		try {

			String query = "drop table `" + examCode + "`";

			statement = connection.createStatement();
			statement.executeUpdate(query);
			// ResultSet resultSet = statement.executeQuery(query);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public Result getResult(String examId) {
		Result result = new Result();

		try {

			String query = "select * from result where examId=" + "'" + examId + "'";

			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			resultSet.next();

			result.setExamId(resultSet.getString(1));
			result.setExamName(resultSet.getString(2));
			result.setStudentId(resultSet.getString(3));
			result.setScore(resultSet.getString(4));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public Exam getExam(String examId) {
		Exam exam = new Exam();

		try {

			String query = "select * from exam where examId=" + "'" + examId + "'";

			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			resultSet.next();
			exam.setExamCode(resultSet.getString(1));
			exam.setExamName(resultSet.getString(2));
			exam.setDuration(resultSet.getString(3));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return exam;

	}

	public void addResult(Result result) {
		String query = "insert into result values(?,?,?,?);";

		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, result.getExamId());
			preparedStatement.setString(2, result.getExamName());
			preparedStatement.setString(3, result.getStudentId());
			preparedStatement.setString(4, result.getScore());

			preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public void addExam(Exam exam) {
		String query = "insert into exam values(?,?,?);";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, exam.getExamCode());
			preparedStatement.setString(2, exam.getExamName());
			preparedStatement.setString(3, exam.getDuration());

			preparedStatement.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void deleteExam(String examId) {

		try {

			String query = "delete from exam where examId=" + "'" + examId + "'";

			statement = connection.createStatement();
			statement.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addQuestion(String code, QuestionPaper questionPaper) {
		String query = "insert into `" + code + "` values(?,?,?,?,?,?,?);";
		try {
			preparedStatement = connection.prepareStatement(query);
			String num = "1";
			preparedStatement.setString(1, num);
			preparedStatement.setString(2, questionPaper.getDescription());
			preparedStatement.setString(3, questionPaper.getOptionA());
			preparedStatement.setString(4, questionPaper.getOptionB());
			preparedStatement.setString(5, questionPaper.getOptionC());
			preparedStatement.setString(6, questionPaper.getOptionD());
			preparedStatement.setString(7, questionPaper.getCorrectAns());

			preparedStatement.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

		}

	}

}
