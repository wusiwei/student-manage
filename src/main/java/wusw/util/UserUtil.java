package wusw.util;

import org.springframework.beans.factory.annotation.Autowired;

import wusw.dao.UserUtilMapper;


public class UserUtil {
	
	@Autowired
	private static UserUtilMapper mapper;
	
	
	
	public  UserUtilMapper getMapper() {
		return mapper;
	}



	public  void setMapper(UserUtilMapper mapper) {
		UserUtil.mapper = mapper;
	}



	public static Integer getUserCompetenceId(String identity){
		Integer competenceId=mapper.getUserCompetenceId(identity);
		if(competenceId==null){
			return Integer.valueOf(1);
		}
		return competenceId;
	}
}
