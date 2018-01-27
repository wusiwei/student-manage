package wusw.entity;

import wusw.util.Page;

public class jobOffersParam {
	private String jobType;
	
	private String workAddress;
	
	private String job;
	
	private String compantName;
	
	private Page page;

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
	
}
