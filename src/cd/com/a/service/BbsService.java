package cd.com.a.service;

import java.util.List;

import cd.com.a.model.BbsVo2;
import cd.com.a.model.PagingCriteria;

public interface BbsService {

	List<BbsVo2> getBbsList(PagingCriteria paging);
//	List<BbsVo> getBbsList();
	
	int totalCnt(PagingCriteria cri);
	
	boolean bbsWrite(BbsVo2 bbs);

	BbsVo2 bbsDetail(int bbs_seq);
	
	boolean bbsDelete(int bbs_seq);

	boolean bbsUpdate(BbsVo2 bbs);

	List<BbsVo2> getMainBbsList();


	
	
	


}
