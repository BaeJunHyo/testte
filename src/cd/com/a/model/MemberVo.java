package cd.com.a.model;

import java.io.Serializable;

public class MemberVo implements Serializable {

    // seq 
    private int mem_seq;
    // 아이디 
    private String mem_id;
    // 패스워드 
    private String mem_password;
    // 패스워드질문 
    private int pass_question;
    // 패스워드 답변 
    private String pass_answer;
    // 업체명 
    private String company_name;
    // 업체등록번호 
    private String company_num;
    // 업체대표자 
    private String company_owner;
    // 회원이름 
    private String mem_name;
    // 회원연락처 
    private String mem_phone;
    // 이메일 
    private String mem_email;
    // 시.도회명 
    private String company_auth;
    // 업체전화번호 
    private String company_phone;
    // 업체팩스 
    private String company_fax;
    // 업체 주소 
    private String company_addr;
    // 회원등급 
    private int mem_auth;
    // 가입일 
    private String mem_regi;
    // 탈퇴처리 
    private int mem_del;
    
    public MemberVo() {
		super();
	}

	public MemberVo(int mem_seq, String mem_id, String mem_password, int pass_question, String pass_answer,
			String company_name, String company_num, String company_owner, String mem_name, String mem_phone,
			String mem_email, String company_auth, String company_phone, String company_fax, String company_addr,
			int mem_auth, String mem_regi, int mem_del) {
		super();
		this.mem_seq = mem_seq;
		this.mem_id = mem_id;
		this.mem_password = mem_password;
		this.pass_question = pass_question;
		this.pass_answer = pass_answer;
		this.company_name = company_name;
		this.company_num = company_num;
		this.company_owner = company_owner;
		this.mem_name = mem_name;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.company_auth = company_auth;
		this.company_phone = company_phone;
		this.company_fax = company_fax;
		this.company_addr = company_addr;
		this.mem_auth = mem_auth;
		this.mem_regi = mem_regi;
		this.mem_del = mem_del;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_password() {
		return mem_password;
	}

	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}

	public int getPass_question() {
		return pass_question;
	}

	public void setPass_question(int pass_question) {
		this.pass_question = pass_question;
	}

	public String getPass_answer() {
		return pass_answer;
	}

	public void setPass_answer(String pass_answer) {
		this.pass_answer = pass_answer;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_num() {
		return company_num;
	}

	public void setCompany_num(String company_num) {
		this.company_num = company_num;
	}

	public String getCompany_owner() {
		return company_owner;
	}

	public void setCompany_owner(String company_owner) {
		this.company_owner = company_owner;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
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

	public String getCompany_auth() {
		return company_auth;
	}

	public void setCompany_auth(String company_auth) {
		this.company_auth = company_auth;
	}

	public String getCompany_phone() {
		return company_phone;
	}

	public void setCompany_phone(String company_phone) {
		this.company_phone = company_phone;
	}

	public String getCompany_fax() {
		return company_fax;
	}

	public void setCompany_fax(String company_fax) {
		this.company_fax = company_fax;
	}

	public String getCompany_addr() {
		return company_addr;
	}

	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}

	public int getMem_auth() {
		return mem_auth;
	}

	public void setMem_auth(int mem_auth) {
		this.mem_auth = mem_auth;
	}

	public String getMem_regi() {
		return mem_regi;
	}

	public void setMem_regi(String mem_regi) {
		this.mem_regi = mem_regi;
	}

	public int getMem_del() {
		return mem_del;
	}

	public void setMem_del(int mem_del) {
		this.mem_del = mem_del;
	}

	@Override
	public String toString() {
		return "MemberVo [mem_seq=" + mem_seq + ", mem_id=" + mem_id + ", mem_password=" + mem_password
				+ ", pass_question=" + pass_question + ", pass_answer=" + pass_answer + ", company_name=" + company_name
				+ ", company_num=" + company_num + ", company_owner=" + company_owner + ", mem_name=" + mem_name
				+ ", mem_phone=" + mem_phone + ", mem_email=" + mem_email + ", company_auth=" + company_auth
				+ ", company_phone=" + company_phone + ", company_fax=" + company_fax + ", company_addr=" + company_addr
				+ ", mem_auth=" + mem_auth + ", mem_regi=" + mem_regi + ", mem_del=" + mem_del + "]";
	}
    
    

	 
}
