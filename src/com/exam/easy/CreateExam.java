package com.exam.easy;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateExam
 */
@WebServlet("/CreateExam")
public class CreateExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	  public CreateExam() {
	        super();
	    }
    
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CreateQuesDbUtil createQuesDbUtil = new CreateQuesDbUtil();
		
		String examCode = request.getParameter("examCode");
		String examName = request.getParameter("examName");
		String timeFrame = request.getParameter("timeFrame");
		
//		System.out.println(examCode);
//		System.out.println(examName);
//		System.out.println(timeFrame);
		
		try {
			createQuesDbUtil.connect();
		} finally {
			
		}		
				
		String code = "Exam".concat(examCode);
		createQuesDbUtil.createExamTable(code);
		
		
	}

}
