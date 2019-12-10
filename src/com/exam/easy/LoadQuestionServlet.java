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

@WebServlet("/LoadQuestionServlet")
public class LoadQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoadQuestionServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String command = request.getParameter("command");
			
			switch (command) {
			case "LOAD":
				loadExam(request,response);
				break;

			default:
				break;
			}
		}catch(Exception e) {
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
  private void loadExam(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		CreateQuesDbUtil createQuesDbUtil = new CreateQuesDbUtil();
		createQuesDbUtil.connect();
		
		String examId = request.getParameter("examId");
		
		
		Exam exam =  createQuesDbUtil.getExam(examId);
		
		request.setAttribute("THE_EXAM",exam);
		
		
		Connection connection = null;
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_made_easy?autoReconnect=true&useSSL=false", "root", "root");
			
//			String examName=(String) request.getParameter("examName");
//			String examCode=(String) request.getParameter("examId");
			
			//String examId = request.getParameter("examId");
			String code = exam.getExamName().concat(exam.getExamCode());
			
		    String query = "select * from "+code;
		    
		    Statement statement = connection.createStatement();
		    statement = connection.createStatement();
		    ResultSet  resultSet = statement.executeQuery(query);
		    
		    ArrayList<QuestionPaper> questionList = new ArrayList<>();
		    
    
    while(resultSet.next())
    {
    	
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
    request.setAttribute("quesList",questionList);

	}
		catch(Exception e) {
			e.printStackTrace();
			}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/set-question.jsp");
		requestDispatcher.forward(request,response);
	}

}
