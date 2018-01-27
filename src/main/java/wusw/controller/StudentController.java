package wusw.controller;

import java.util.List;


import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import wusw.entity.JobOffers;
import wusw.entity.RequestResult;
import wusw.entity.jobOffersParam;
import wusw.entity.student.CompanyQueryParam;
import wusw.entity.student.CompanyResultParam;
import wusw.entity.student.PersonApplication;
import wusw.entity.student.SendJobOffers;
import wusw.entity.student.SendJobQueryParam;
import wusw.entity.student.SendJobResultParam;
import wusw.service.StudentService;
import wusw.util.Tools;

@Controller
@RequestMapping(value="/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="/getJobOffers.html")
	public String showJobOffers(){
		return "student/offers";
	};
	
	@RequestMapping(value="/main.html")
	public String showMain(){
		return "student/main";
	};
	
	@RequestMapping(value="/getCompany.html")
	public String showCompany(){
		return "student/scompany";
	};
	
	@RequestMapping(value="/getSendJob.html")
	public String showSendJob(){
		return "student/sendjob";
	};
	
	@RequestMapping(value="/getPersonApplication.html")
	public ModelAndView showPersonApplication(ModelAndView mv,int id){
		mv.addObject("form", studentService.getPersonApplication(id));
		mv.setViewName("student/personapplication");
		return mv;
	};
	
	@RequestMapping(value="/getModifypwd.html")
	public String showModifypwd(){
		return "student/modifypwd";
	};
	
	
	@RequestMapping(value="/getJobOffers.json")
	@ResponseBody
	public String jobOffers(jobOffersParam bean){
		Pair<Integer,List<JobOffers>> pair= studentService.getJobOffers(bean);
		return Tools.toTableDataGrid(pair.getValue0(), pair.getValue1());
	};
	
	@RequestMapping(value="/getCompany.json")
	@ResponseBody
	public String jobCompany(CompanyQueryParam bean){
		Pair<Integer,List<CompanyResultParam>> pair= studentService.getCompany(bean);
		return Tools.toTableDataGrid(pair.getValue0(), pair.getValue1());
	};
	
	@RequestMapping(value="/getSendJob.json")
	@ResponseBody
	public String getSendJob(SendJobQueryParam bean){
		Pair<Integer,List<SendJobResultParam>> pair= studentService.getSendJob(bean);
		return Tools.toTableDataGrid(pair.getValue0(), pair.getValue1());
	};
	
	@ResponseBody
	@RequestMapping(value="/submitApplications.do", method = RequestMethod.POST)
	public RequestResult registered(@RequestParam(value="ids[]") List<Integer> ids,Integer studentId){
		RequestResult result=new RequestResult();
		SendJobOffers bean=new SendJobOffers();
		bean.setIds(ids);
		bean.setStudentId(studentId);
		bean.setState("审核中");
		result=studentService.insertJobOffers(bean);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateApplication.do", method = RequestMethod.POST)
	public RequestResult updateApplication(PersonApplication bean){
		RequestResult result=new RequestResult();
		result=studentService.updatePersonApplication(bean);
		return result;
	}
}
