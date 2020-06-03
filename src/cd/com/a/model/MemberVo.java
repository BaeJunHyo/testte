package cd.com.a.model;

import java.io.Serializable;

public class MemberVo implements Serializable {

	    // 회원UUID
	    private Integer mem_id;
	    // 아이디
	    private String mem_usrid;
	    // 패스워드
	    private String mem_pw;
	    // 패스워드질문
	    private String pw_quest;
	    // 패스워드 답변
	    private String pw_answer;
	    // 업체명
	    private String comp_nm;
	    // 업체등록번호
	    private String comp_num;
	    // 업체대표자
	    private String comp_own;
	    // 회원이름
	    private String mem_nm;
	    // 회원연락처
	    private String mem_phone;
	    // 이메일
	    private String mem_email;
	    // 시.도회명
	    private String comp_auth;
	    // 업체전화번호
	    private String comp_tel;
	    // 업체팩스
	    private String comp_fax;
	    // 업체 주소
	    private String comp_addr;
	    // 회원등급
	    private Integer mem_auth;
	    // 가입일
	    private String mem_new_regi;
	    // 탈퇴일
	    private String mem_out_regi;
	    // 탈퇴구분
	    private Integer mem_attr;
	    
	    
		public MemberVo() {
			super();
		}


		public MemberVo(Integer mem_id, String mem_usrid, String mem_pw, String pw_quest, String pw_answer,
				String comp_nm, String comp_num, String comp_own, String mem_nm, String mem_phone, String mem_email,
				String comp_auth, String comp_tel, String comp_fax, String comp_addr, Integer mem_auth,
				String mem_new_regi, String mem_out_regi, Integer mem_attr) {
			super();
			this.mem_id = mem_id;
			this.mem_usrid = mem_usrid;
			this.mem_pw = mem_pw;
			this.pw_quest = pw_quest;
			this.pw_answer = pw_answer;
			this.comp_nm = comp_nm;
			this.comp_num = comp_num;
			this.comp_own = comp_own;
			this.mem_nm = mem_nm;
			this.mem_phone = mem_phone;
			this.mem_email = mem_email;
			this.comp_auth = comp_auth;
			this.comp_tel = comp_tel;
			this.comp_fax = comp_fax;
			this.comp_addr = comp_addr;
			this.mem_auth = mem_auth;
			this.mem_new_regi = mem_new_regi;
			this.mem_out_regi = mem_out_regi;
			this.mem_attr = mem_attr;
		}


		public Integer getMem_id() {
			return mem_id;
		}


		public void setMem_id(Integer mem_id) {
			this.mem_id = mem_id;
		}


		public String getMem_usrid() {
			return mem_usrid;
		}


		public void setMem_usrid(String mem_usrid) {
			this.mem_usrid = mem_usrid;
		}


		public String getMem_pw() {
			return mem_pw;
		}


		public void setMem_pw(String mem_pw) {
			this.mem_pw = mem_pw;
		}


		public String getpw_quest() {
			return pw_quest;
		}


		public void setpw_quest(String pw_quest) {
			this.pw_quest = pw_quest;
		}


		public String getPw_answer() {
			return pw_answer;
		}


		public void setPw_answer(String pw_answer) {
			this.pw_answer = pw_answer;
		}


		public String getComp_nm() {
			return comp_nm;
		}


		public void setComp_nm(String comp_nm) {
			this.comp_nm = comp_nm;
		}


		public String getComp_num() {
			return comp_num;
		}


		public void setComp_num(String comp_num) {
			this.comp_num = comp_num;
		}


		public String getcomp_own() {
			return comp_own;
		}


		public void setcomp_own(String comp_own) {
			this.comp_own = comp_own;
		}


		public String getMem_nm() {
			return mem_nm;
		}


		public void setMem_nm(String mem_nm) {
			this.mem_nm = mem_nm;
		}


		public String getMem_phone() {
			return mem_phone;
		}


		public void setMem_phone(String mem_phone) {
			this.mem_phone = mem_phone;
		}


		public String getMem_email() {
			return mem_email;
		}


		public void setMem_email(String mem_email) {
			this.mem_email = mem_email;
		}


		public String getComp_auth() {
			return comp_auth;
		}


		public void setComp_auth(String comp_auth) {
			this.comp_auth = comp_auth;
		}


		public String getComp_tel() {
			return comp_tel;
		}


		public void setComp_tel(String comp_tel) {
			this.comp_tel = comp_tel;
		}


		public String getComp_fax() {
			return comp_fax;
		}


		public void setComp_fax(String comp_fax) {
			this.comp_fax = comp_fax;
		}


		public String getComp_addr() {
			return comp_addr;
		}


		public void setComp_addr(String comp_addr) {
			this.comp_addr = comp_addr;
		}


		public Integer getMem_auth() {
			return mem_auth;
		}


		public void setMem_auth(Integer mem_auth) {
			this.mem_auth = mem_auth;
		}


		public String getMem_new_regi() {
			return mem_new_regi;
		}


		public void setMem_new_regi(String mem_new_regi) {
			this.mem_new_regi = mem_new_regi;
		}


		public String getMem_out_regi() {
			return mem_out_regi;
		}


		public void setMem_out_regi(String mem_out_regi) {
			this.mem_out_regi = mem_out_regi;
		}


		public Integer getMem_attr() {
			return mem_attr;
		}


		public void setMem_attr(Integer mem_attr) {
			this.mem_attr = mem_attr;
		}


		@Override
		public String toString() {
			return "MemberVo [mem_id=" + mem_id + ", mem_usrid=" + mem_usrid + ", mem_pw=" + mem_pw + ", pw_quest="
					+ pw_quest + ", pw_answer=" + pw_answer + ", comp_nm=" + comp_nm + ", comp_num=" + comp_num
					+ ", comp_own=" + comp_own + ", mem_nm=" + mem_nm + ", mem_phone=" + mem_phone + ", mem_email="
					+ mem_email + ", comp_auth=" + comp_auth + ", comp_tel=" + comp_tel + ", comp_fax=" + comp_fax
					+ ", comp_addr=" + comp_addr + ", mem_auth=" + mem_auth + ", mem_new_regi=" + mem_new_regi
					+ ", mem_out_regi=" + mem_out_regi + ", mem_attr=" + mem_attr + "]";
		}


		}
