package com.exam.easy;

public class Result {

	private String examId;
	private String examName;
	private String studentId;
	private String score;

	public Result() {
		super();
	}

	public Result(String examId, String examName, String studentId, String score) {
		super();
		this.examId = examId;
		this.examName = examName;
		this.studentId = studentId;
		this.score = score;
	}

	public String getExamId() {
		return examId;
	}

	public void setExamId(String examId) {
		this.examId = examId;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

}
