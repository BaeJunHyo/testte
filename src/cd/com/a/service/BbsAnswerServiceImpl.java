package cd.com.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.BbsAnswerDao;
import cd.com.a.model.BbsAnswerVo;

@Service
public class BbsAnswerServiceImpl implements BbsAnswerService {

	@Autowired
	BbsAnswerDao answerDao;
	
	@Override
	public List<BbsAnswerVo> list(int bbs_seq) throws Exception{
		return answerDao.list(bbs_seq);
	}

	@Override
	public int answerInsert(BbsAnswerVo vo) throws Exception{
		return answerDao.answerInsert(vo);
	}

	@Override
	public int answerUpdate(BbsAnswerVo vo) throws Exception {
		return answerDao.answerUpdate(vo);
	}

	@Override
	public int answerDelete(int answer_seq) throws Exception {
		return answerDao.answerDelete(answer_seq);
	}
	
	@Override
	public void answerUpdateCount(int bbs_seq) throws Exception {
		answerDao.answerUpdateCount(bbs_seq);
	}
	
	

}
