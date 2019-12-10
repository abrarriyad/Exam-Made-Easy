package com.exam.easy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

@WebServlet("/ExamListServlet")
public class ExamListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExamListServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		response.setHeader("Cache-Control","no-cache, no-store, must-validate");
		
		Connection connection = null;
		Statement statement =null;
		ResultSet resultSet =null;
		PreparedStatement preparedStatement =null;
		
		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");
						
	    String query = "select * from exam";
        
         statement = connection.createStatement();
         statement = connection.createStatement();
         resultSet = statement.executeQuery(query);
        
        ArrayList<Exam> examList = new ArrayList<>();
        
        
        while(resultSet.next())
        {
        	Exam exam = new Exam();
        	exam.setExamCode(resultSet.getString(1));
        	exam.setExamName(resultSet.getString(2));
        	exam.setDuration(resultSet.getString(3));
        	
        	examList.add(exam);
        }
        
        request.setAttribute("examList",examList);
        
        RequestDispatcher dispatcher =request.getRequestDispatcher("/exam-list.jsp");
        dispatcher.forward(request, response);
        
		}
		catch(Exception e) {
		e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
