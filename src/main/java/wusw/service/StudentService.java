package wusw.service;

import java.util.List;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wusw.dao.StudentMapper;
import wusw.entity.JobOffers;
import wusw.entity.RequestResult;
import wusw.entity.User;
import wusw.entity.WuswConstants;
import wusw.entity.jobOffersParam;
import wusw.entity.student.CompanyQueryParam;
import wusw.entity.student.CompanyResultParam;
import wusw.entity.student.PersonApplication;
import wusw.entity.student.SendJobOffers;
import wusw.entity.student.SendJobQueryParam;
import wusw.entity.student.SendJobResultParam;
import wusw.util.Page;

@Service
public class StudentService {
	@Autowired
	private StudentMapper mapper;
	
	/**
	 * 获取招聘信息
	 * @return
	 */
	public Pair<Integer,List<JobOffers>> getJobOffers(jobOffersParam bean){
		Integer total=mapper.selectJobOffersTotal(bean);
		Page page=bean.getPage();
		page.setTotal(total);
		bean.setPage(page);
		List<JobOffers> list=mapper.selectJobOffers(bean);
		return Pair.with(total, list);
	}
	
	/**
	 * 获取单位信息
	 * @param bean
	 * @return
	 */
	public Pair<Integer,List<CompanyResultParam>> getCompany(CompanyQueryParam bean){
		Integer total=mapper.selectCompanyTotal(bean);
		Page page=bean.getPage();
		page.setTotal(total);
		bean.setPage(page);
		List<CompanyResultParam> list=mapper.selectCompany(bean);
		return Pair.with(total, list);
	}
	
	/**
	 * 获取已投岗位信息
	 * @param bean
	 * @return
	 */
	public Pair<Integer,List<SendJobResultParam>> getSendJob(SendJobQueryParam bean){
		Integer total=mapper.selectSendJobTotal(bean);
		Page page=bean.getPage();
		page.setTotal(total);
		bean.setPage(page);
		List<SendJobResultParam> list=mapper.selectSendJob(bean);
		return Pair.with(total, list);
	}
	
	/**
	 * 提交岗位申请
	 * @param bean
	 * @return
	 */
	public RequestResult insertJobOffers(SendJobOffers bean){
		Integer index=mapper.insertSendJobOffers(bean);
		RequestResult result =new RequestResult();
		if(index<1){
			result.setMsg("提交失败");
		}else{
			result.setMsg("提交成功");
		}
		return result;
	} 
	
	/**
	 * 更改个人信息
	 * @param bean
	 * @return
	 */
	public RequestResult updatePersonApplication(PersonApplication bean){
		Integer index=mapper.updatePersonAplication(bean);
		RequestResult result =new RequestResult();
		if(index<1){
			result.setMsg("修改失败");
		}else{
			result.setMsg("修改成功");
		}
		return result;
	} 
	
	public PersonApplication getPersonApplication(int id){
		return mapper.selectPersonAplication(id);
	}
}
