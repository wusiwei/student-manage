package wusw.dao;

import org.springframework.stereotype.Repository;

import wusw.entity.User;

@Repository
public interface UserMapper {
	Integer selectUserByData(User user);
	
	int insert(User user);
	
	int updatePassword(User user);
}
