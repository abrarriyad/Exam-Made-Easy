package com.exam.easy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ResultServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
		HttpSession session = request.getSession();

		String score = request.getParameter("score");
		String examId = request.getParameter("examCode");
		String examName = request.getParameter("examName");
		String studentId = session.getAttribute("id").toString();

		Result result = new Result();

		result.setExamId(examId);
		result.setExamName(examName);
		result.setStudentId(studentId);
		result.setScore(score);

		request.setAttribute("result", result);

		CreateQuesDbUtil createQuesDbUtil = new CreateQuesDbUtil();
		createQuesDbUtil.connect();

		createQuesDbUtil.addResult(result);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/result-sheet.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
