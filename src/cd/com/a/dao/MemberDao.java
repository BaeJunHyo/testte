package cd.com.a.dao;

import cd.com.a.model.MemberVo;

public interface MemberDao {

	boolean idCheck(String id);

	boolean mailCheck(String mail);

	boolean newRegi(MemberVo member);

	MemberVo login(MemberVo member);

}
