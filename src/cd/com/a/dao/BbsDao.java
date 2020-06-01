package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.BbsVo;
import cd.com.a.model.PagingCriteria;


public interface BbsDao {

	List<BbsVo> getBbsList(PagingCriteria paging);
//	List<BbsVo> getBbsList();

	boolean bbsWrite(BbsVo bbs);

	void bbsReadCountUp(int bbs_seq);

	BbsVo bbsDetail(int bbs_seq);

	boolean bbsDelete(int bbs_seq);

	int totalCnt(PagingCriteria paging);

	boolean bbsUpdate(BbsVo bbs);

	List<BbsVo> getMainBbsList();

	

}
