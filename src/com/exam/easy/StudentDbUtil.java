package com.exam.easy;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class StudentDbUtil {
	
	Connection connection = null;
	Statement statement =null;
	ResultSet resultSet =null;
	PreparedStatement preparedStatement =null;
	
	public void close() throws SQLException {
		statement.close();
		preparedStatement.close();
		resultSet.close();
		connection.close();
	}
	
	public void connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Student getStudentByEmail(String email) {
		Student student = new Student();	
		try {
			
			String query="select * from student where email="+"'"+email+"'";
			
			 statement = connection.createStatement();
			 resultSet = statement.executeQuery(query);
			if(resultSet!=null) { 
			resultSet.next();
			student.setId(resultSet.getString(1));
			student.setFirstName(resultSet.getString(2));
			student.setLastName(resultSet.getString(3));
			student.setEmail(resultSet.getString(4));
			student.setPassword(resultSet.getString(5));
			student.setDepertment(resultSet.getString(6));
			student.setSession(resultSet.getString(7));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return student;
		
	}
	
	public void addStudent(Student student) {
		String query="insert into student values(?,?,?,?,?,?,?);";
		try {
			 preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, student.getId());
			preparedStatement.setString(2, student.getFirstName());
			preparedStatement.setString(3, student.getLastName());
			preparedStatement.setString(4, student.getEmail());
			preparedStatement.setString(5, student.getPassword());
			preparedStatement.setString(6, student.getDepertment());
			preparedStatement.setString(7, student.getSession());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}


}

	
