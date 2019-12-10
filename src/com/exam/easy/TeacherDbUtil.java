package com.exam.easy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TeacherDbUtil {

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

	public Teacher getTeacherByEmail(String email) {
		Teacher teacher = new Teacher();
		try {

			String query = "select * from teacher where email=" + "'" + email + "'";

			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			if (resultSet != null) {
				resultSet.next();

				teacher.setFirstName(resultSet.getString(1));
				teacher.setLastName(resultSet.getString(2));
				teacher.setEmail(resultSet.getString(3));
				teacher.setPassword(resultSet.getString(4));
				teacher.setDepertment(resultSet.getString(5));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return teacher;

	}

	public void addTeacher(Teacher teacher) {
		String query = "insert into teacher values(?,?,?,?,?);";
		try {
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setString(1, teacher.getFirstName());
			preparedStatement.setString(2, teacher.getLastName());
			preparedStatement.setString(3, teacher.getEmail());
			preparedStatement.setString(4, teacher.getPassword());
			preparedStatement.setString(5, teacher.getDepertment());

			preparedStatement.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
