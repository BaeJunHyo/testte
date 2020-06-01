package cd.com.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.model.BbsAnswerVo;

@Repository
public class BbsAnswerDaoImpl implements BbsAnswerDao {

	@Autowired
	SqlSession sqlSession;
	String namespace = "BbsAnswer.";
	
	@Override
	public List<BbsAnswerVo> list(int bbs_seq)throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"answerList",bbs_seq);
	}

	@Override
	public int answerInsert(BbsAnswerVo vo)throws Exception {
		return sqlSession.insert(namespace+"answerInsert",vo);
	}
	
	@Override
	public int answerUpdate(BbsAnswerVo vo)throws Exception {
		return sqlSession.update(namespace+"answerUpdate",vo);
	}
	
	@Override
	public int answerDelete(int answer_seq)throws Exception {
		return sqlSession.delete(namespace+"answerDelete",answer_seq);
	}
	
	@Override
	public void answerUpdateCount(int bbs_seq)throws Exception {
		sqlSession.update(namespace+"answerUpdateCount",bbs_seq);
	}

	

}
