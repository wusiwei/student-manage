package wusw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wusw.dao.UserMapper;
import wusw.entity.RequestResult;
import wusw.entity.User;
import wusw.entity.WuswConstants;

@Service
public class UserService {
	@Autowired
	private UserMapper mapper;
	
	public RequestResult checkUser(User user){
		Integer index=mapper.selectUserByData(user);
		RequestResult result =new RequestResult();
		if(index==null){
			result.setStatus(WuswConstants.REQUEST_FAIL);
			result.setMsg("账户名密码错误");
		}else{
			result.setStatus(WuswConstants.REQUEST_SUCESSS);
			result.setMsg("登陆成功");
			result.setData(index);
		}
		
		return result;
	}
	
	public RequestResult insertUser(User user){
		Integer index=mapper.insert(user);
		RequestResult result =new RequestResult();
		if(index==null){
			result.setStatus(WuswConstants.REQUEST_FAIL);
			result.setMsg("注册失败");
		}else{
			result.setStatus(WuswConstants.REQUEST_SUCESSS);
			result.setMsg("注册成功");
		}
		
		return result;
	}
	
	public RequestResult updateUserPassword(User user){
		Integer index=mapper.updatePassword(user);
		RequestResult result =new RequestResult();
		if(index==null){
			result.setStatus(WuswConstants.REQUEST_FAIL);
			result.setMsg("修改失败");
		}else{
			result.setStatus(WuswConstants.REQUEST_SUCESSS);
			result.setMsg("修改成功");
		}
		
		return result;
	}
	
}
