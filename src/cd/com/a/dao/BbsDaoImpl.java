package cd.com.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.model.BbsVo2;
import cd.com.a.model.PagingCriteria;


@Repository
public class BbsDaoImpl implements BbsDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String nameSpace = "Bbs.";
	
	@Override
	public List<BbsVo2> getBbsList(PagingCriteria paging) {
		List<BbsVo2> list = sqlSession.selectList(nameSpace+"getBbsList",paging);
		System.out.println("list_size:"+list.size());
		return list;
	}

	
	@Override
	public boolean bbsWrite(BbsVo2 bbs) {
		int result = sqlSession.insert(nameSpace+"BbsWrite",bbs);
		return result>0?true:false;
	}
	
	@Override
	public boolean bbsUpdate(BbsVo2 bbs) {
		int result = sqlSession.update(nameSpace+"BbsUpdate",bbs);
		return result>0?true:false;
	}
	
	@Override
	public void bbsReadCountUp(int bbs_seq) {
		sqlSession.update(nameSpace+"BbsReadCountUp",bbs_seq);
	}
	
	@Override
	public BbsVo2 bbsDetail(int bbs_seq) {
		return sqlSession.selectOne(nameSpace+"BbsDetail",bbs_seq);
	}
	
	@Override
	public boolean bbsDelete(int bbs_seq) {
		int result = sqlSession.update(nameSpace+"BbsDelete",bbs_seq);
		return result>0?true:false;
	}

	@Override
	public int totalCnt(PagingCriteria paging) {
		return sqlSession.selectOne(nameSpace+"getTotalCnt",paging);
	}

	@Override
	public List<BbsVo2> getMainBbsList() {
		return sqlSession.selectList(nameSpace+"getMainBbsList");
	}
	
	
	
	
	
	
	
	
	
	
	
	

	

}
