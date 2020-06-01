package cd.com.a.service;

import java.util.List;

import cd.com.a.model.BbsVo;
import cd.com.a.model.PagingCriteria;

public interface BbsService {

	List<BbsVo> getBbsList(PagingCriteria paging);
//	List<BbsVo> getBbsList();
	
	int totalCnt(PagingCriteria cri);
	
	boolean bbsWrite(BbsVo bbs);

	BbsVo bbsDetail(int bbs_seq);
	
	boolean bbsDelete(int bbs_seq);

	boolean bbsUpdate(BbsVo bbs);

	List<BbsVo> getMainBbsList();


	
	
	


}
