package cd.com.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.MemberDao;
import cd.com.a.model.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	@Override
	public boolean idCheck(String id) {
		return dao.idCheck(id);
	}
	@Override
	public boolean mailCheck(String mail) {
		// TODO Auto-generated method stub
		return dao.mailCheck(mail);
	}
	@Override
	public boolean newRegi(MemberVo member) {
		// TODO Auto-generated method stub
		return dao.newRegi(member);
	}
	@Override
	public MemberVo login(MemberVo member) {
		// TODO Auto-generated method stub
		return dao.login(member);
	}
	@Override
	public List<MemberVo> getNewRegiList() {
		// TODO Auto-generated method stub
		return dao.getNewRegiList();
	}
	
	
}
