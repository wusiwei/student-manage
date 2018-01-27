package wusw.entity.student;

import wusw.util.Page;

public class SendJobQueryParam {
	private String state;
	
	private String jobType;
	
	private String workAddress;
	
	private String job;
	
	private Integer studentId;
	
	private String compantName;
	
	private Page page;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getWorkAddress() {
		return workAddress;
	}

	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getCompantName() {
		return compantName;
	}

	public void setCompantName(String compantName) {
		this.compantName = compantName;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
}
