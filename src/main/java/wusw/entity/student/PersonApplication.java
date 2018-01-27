package wusw.entity.student;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PersonApplication {
	private int id;
	
	private String name;
	
	private String gender;
	
	private int age;
	
	private String phone;
	
	private String profession;
	
	private String hobbies;
	
	private String home_address;
	
	@JsonFormat(timezone="GMT+8:00", pattern="yyyy-MM-dd")
	private Date birthday;
	
	private int class_id;
	
	
}
