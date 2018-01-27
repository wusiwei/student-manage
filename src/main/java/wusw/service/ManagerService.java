package wusw.service;

import java.util.List;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wusw.dao.ManagerMapper;
import wusw.entity.JobOffers;
import wusw.entity.RequestResult;
import wusw.entity.processJobOffer;
import wusw.entity.student.SendJobQueryParam;
import wusw.entity.student.SendJobResultParam;
import wusw.util.Page;

@Service
public class ManagerService {
	
	@Autowired
	private ManagerMapper mapper;
	/**
	 * 添加招聘信息
	 * @param bean
	 * @return
	 */
	public RequestResult insertJobOffers(JobOffers bean){
		Integer index=mapper.insertJobOffers(bean);
		RequestResult result =new RequestResult();
		if(index<1){
			result.setMsg("添加失败");
		}else{
			result.setMsg("添加成功");
		}
		return result;
	} 
	
	/**
	 * 获取所以已投岗位信息
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
	 * 处理学生申请的岗位
	 * @param bean
	 * @return
	 */
	public RequestResult processJobOffers(processJobOffer bean){
		Integer index=mapper.updateJobOffers(bean);
		RequestResult result =new RequestResult();
		if(index<1){
			result.setMsg("处理失败");
		}else{
			result.setMsg("处理成功");
		}
		return result;
	} 
	
	/**
	 * 逻辑删除招聘信息
	 * @param bean
	 * @return
	 */
	public RequestResult removeJobOffers(Integer id){
		Integer index=mapper.deleteJoboffers(id);
		RequestResult result =new RequestResult();
		if(index<1){
			result.setMsg("删除失败");
		}else{
			result.setMsg("删除成功");
		}
		return result;
	} 
}
