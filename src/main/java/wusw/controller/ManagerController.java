package wusw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import wusw.entity.JobOffers;
import wusw.entity.RequestResult;
import wusw.entity.processJobOffer;
import wusw.entity.student.PersonApplication;
import wusw.entity.student.SendJobOffers;
import wusw.entity.student.SendJobQueryParam;
import wusw.entity.student.SendJobResultParam;
import wusw.service.ManagerService;
import wusw.util.Tools;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	@RequestMapping(value="/getJobOffers.html")
	public String showJobOffers(){
		return "manager/moffers";
	};
	
	@RequestMapping(value="/main.html")
	public String showMain(){
		return "manager/main";
	};
	
	@RequestMapping(value="/getCompany.html")
	public String showCompany(){
		return "manager/mscompany";
	};
	
	@RequestMapping(value="/getSendJob.html")
	public String showSendJob(){
		return "manager/sendjob";
	};
	
	@RequestMapping(value="/getModifypwd.html")
	public String showModifypwd(){
		return "manager/modifypwd";
	};
	
	@ResponseBody
	@RequestMapping(value="/saveJobOffers.do", method = RequestMethod.POST)
	public RequestResult saveJobOffers(HttpServletRequest request){
		JobOffers bean=new JobOffers();
		bean.setJob(request.getParameter("job"));
		bean.setRequire(request.getParameter("require"));
		bean.setJobType(request.getParameter("jobType"));
		bean.setCompantId(Integer.valueOf(request.getParameter("compantId")));
		bean.setWorkAddress(request.getParameter("workAddress"));
		bean.setState(1);
		RequestResult result=new RequestResult();
		result=service.insertJobOffers(bean);
		return result;
	}
	
	@RequestMapping(value="/getSendJob.json")
	@ResponseBody
	public String getSendJob(SendJobQueryParam bean){
		Pair<Integer,List<SendJobResultParam>> pair= service.getSendJob(bean);
		return Tools.toTableDataGrid(pair.getValue0(), pair.getValue1());
	};
	
	@ResponseBody
	@RequestMapping(value="/agree.do", method = RequestMethod.POST)
	public RequestResult agreeJob(@RequestParam(value="_id") Integer id,@RequestParam(value="studentId")Integer studentId){
		RequestResult result=new RequestResult();
		processJobOffer bean=new processJobOffer();
		bean.setJoboffersId(id);;
		bean.setStudentId(studentId);
		bean.setState("通过");
		result=service.processJobOffers(bean);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/notAgree.do", method = RequestMethod.POST)
	public RequestResult notAgreeJob(@RequestParam(value="_id") Integer id,@RequestParam(value="studentId")Integer studentId){
		RequestResult result=new RequestResult();
		processJobOffer bean=new processJobOffer();
		bean.setJoboffersId(id);;
		bean.setStudentId(studentId);
		bean.setState("不通过");
		result=service.processJobOffers(bean);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/removeJobOffers.do", method = RequestMethod.POST)
	public RequestResult removeJobOffers(@RequestParam(value="_id") Integer id){
		RequestResult result=new RequestResult();
		result=service.removeJobOffers(id);
		return result;
	}
}
