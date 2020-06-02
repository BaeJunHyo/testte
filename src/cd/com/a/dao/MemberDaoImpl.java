package cd.com.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.model.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	SqlSession sqlSession;
	String nameSpace= "Member.";

	@Override
	public boolean idCheck(String id) {
		int result = sqlSession.selectOne(nameSpace+"idCheck",id);
		return result>0?true:false;
	}
	@Override
	public boolean mailCheck(String mail) {
		int result = sqlSession.selectOne(nameSpace+"mailCheck",mail);
		return result>0?true:false;
	}
	@Override
	public boolean newRegi(MemberVo member) {
		int result = sqlSession.insert(nameSpace+"newRegi",member);
		return result>0?true:false;
	}
	
	@Override
	public MemberVo login(MemberVo member) {
		MemberVo result = sqlSession.selectOne(nameSpace+"login",member);
		return result;
	}
	
	@Override
	public List<MemberVo> getNewRegiList() {
		return sqlSession.selectList(nameSpace+"getNewRegiList");
	}
	
	

}
