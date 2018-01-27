package wusw.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import wusw.entity.JobOffers;
import wusw.entity.processJobOffer;
import wusw.entity.student.SendJobQueryParam;
import wusw.entity.student.SendJobResultParam;
@Repository
public interface ManagerMapper {
	List<JobOffers> selectJobOffers();
	
	int insertJobOffers(JobOffers bean);
	
	List<SendJobResultParam> selectSendJob(SendJobQueryParam bean);
	
	int selectSendJobTotal(SendJobQueryParam bean);
	
	int updateJobOffers(processJobOffer bean);
	
	int deleteJoboffers(int id);
}
