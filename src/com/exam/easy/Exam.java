package com.exam.easy;

public class Exam {
	
	
	private String examCode;
	private String examName;
	private String duration;
	
	public Exam(String examId, String examName, String duration) {
		super();
		this.examCode = examId;
		this.examName = examName;
		this.duration = duration;
	}
	
	public Exam() {
		super();
	}

	public String getExamCode() {
		return examCode;
	}

	public void setExamCode(String examId) {
		this.examCode = examId;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	
}

