package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.BbsAnswerVo;

public interface BbsAnswerDao {

	List<BbsAnswerVo> list(int bbs_seq)throws Exception;

	int answerInsert(BbsAnswerVo vo)throws Exception;

	int answerUpdate(BbsAnswerVo vo)throws Exception;

	int answerDelete(int answer_seq)throws Exception;

	void answerUpdateCount(int bbs_seq)throws Exception;

}
