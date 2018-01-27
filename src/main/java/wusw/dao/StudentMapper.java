package wusw.dao;

import java.util.List;

import wusw.entity.JobOffers;
import wusw.entity.jobOffersParam;
import wusw.entity.student.CompanyQueryParam;
import wusw.entity.student.CompanyResultParam;
import wusw.entity.student.PersonApplication;
import wusw.entity.student.SendJobOffers;
import wusw.entity.student.SendJobQueryParam;
import wusw.entity.student.SendJobResultParam;

public interface StudentMapper {
	List<JobOffers> selectJobOffers(jobOffersParam bean);
	
	int selectJobOffersTotal(jobOffersParam bean);
	
	List<CompanyResultParam> selectCompany(CompanyQueryParam bean);
	
	int selectCompanyTotal(CompanyQueryParam bean);
	
	List<SendJobResultParam> selectSendJob(SendJobQueryParam bean);
	
	int selectSendJobTotal(SendJobQueryParam bean);
	
	int insertSendJobOffers(SendJobOffers bean);
	
	PersonApplication selectPersonAplication(int id);
	
	int updatePersonAplication(PersonApplication bean);
}
