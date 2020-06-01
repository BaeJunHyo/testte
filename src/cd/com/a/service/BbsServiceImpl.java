package cd.com.a.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.BbsDao;
import cd.com.a.model.BbsVo;
import cd.com.a.model.PagingCriteria;


@Service
public class BbsServiceImpl implements BbsService {

	@Autowired
	BbsDao bbsDao;
	
	@Override
	public List<BbsVo> getBbsList(PagingCriteria paging) {
		return bbsDao.getBbsList(paging);
	}
//	@Override
//	public List<BbsVo> getBbsList() {
//		return bbsDao.getBbsList();
//	}

	@Override
	public boolean bbsWrite(BbsVo bbs) {
		return bbsDao.bbsWrite(bbs);
	}
	
	@Override
	public BbsVo bbsDetail(int bbs_seq) {
		bbsDao.bbsReadCountUp(bbs_seq);
		return bbsDao.bbsDetail(bbs_seq);
	}

	@Override
	public boolean bbsDelete(int bbs_seq) {
		return bbsDao.bbsDelete(bbs_seq);
	}

	@Override
	public int totalCnt(PagingCriteria paging) {
		return bbsDao.totalCnt(paging);
	}

	@Override
	public boolean bbsUpdate(BbsVo bbs) {
		// TODO Auto-generated method stub
		return bbsDao.bbsUpdate(bbs);
	}

	@Override
	public List<BbsVo> getMainBbsList() {
		// TODO Auto-generated method stub
		return bbsDao.getMainBbsList();
	}

	

	
	
	
	

	
}
