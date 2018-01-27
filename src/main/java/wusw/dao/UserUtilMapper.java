package wusw.dao;

import org.springframework.stereotype.Repository;


@Repository("userUtilMapper")
public interface UserUtilMapper {
	int getUserCompetenceId(String identity);
	
	String getUserIdentity(int id);
}
