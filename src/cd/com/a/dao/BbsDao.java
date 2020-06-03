package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.BbsVo2;
import cd.com.a.model.PagingCriteria;


public interface BbsDao {

	List<BbsVo2> getBbsList(PagingCriteria paging);
//	List<BbsVo> getBbsList();

	boolean bbsWrite(BbsVo2 bbs);

	void bbsReadCountUp(int bbs_seq);

	BbsVo2 bbsDetail(int bbs_seq);

	boolean bbsDelete(int bbs_seq);

	int totalCnt(PagingCriteria paging);

	boolean bbsUpdate(BbsVo2 bbs);

	List<BbsVo2> getMainBbsList();

	

}
