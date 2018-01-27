package wusw.entity;

public class User {
	private int id;
	
	private String name;//用户名
	
	private String password;//用户密码
	
	private String email;//用户邮箱
	
	private String userCompetence;
	
	private int competenceId;
	
	private int studentId;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUserCompetence() {
		return userCompetence;
	}

	public void setUserCompetence(String userCompetence) {
		this.userCompetence = userCompetence;
	}
	
	public int getCompetenceId() {
		return competenceId;
	}

	public void setCompetenceId(int competenceId) {
		this.competenceId = competenceId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	
	
}
