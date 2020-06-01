package cd.com.a.model;

import java.io.Serializable;

public class BbsAnswerVo implements Serializable {

	private int answer_seq;	//댓글 번호
	private int bbs_seq;	// 게시글 번호
	private String bbs_answer;	//댓글 내용
	private String answer_regi;	//댓글 작성일
	private String mem_name;   // 댓글 작성자
	private int mem_seq;		// 댓글작성자 idx
	private String update_regi; // 댓글 수정일
	
	public BbsAnswerVo() {
		super();
	}

	public BbsAnswerVo(int answer_seq, int bbs_seq, String bbs_answer, String answer_regi, String mem_name, int mem_seq,
			String update_regi) {
		super();
		this.answer_seq = answer_seq;
		this.bbs_seq = bbs_seq;
		this.bbs_answer = bbs_answer;
		this.answer_regi = answer_regi;
		this.mem_name = mem_name;
		this.mem_seq = mem_seq;
		this.update_regi = update_regi;
	}

	public int getAnswer_seq() {
		return answer_seq;
	}

	public void setAnswer_seq(int answer_seq) {
		this.answer_seq = answer_seq;
	}

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public String getBbs_answer() {
		return bbs_answer;
	}

	public void setBbs_answer(String bbs_answer) {
		this.bbs_answer = bbs_answer;
	}

	public String getAnswer_regi() {
		return answer_regi;
	}

	public void setAnswer_regi(String answer_regi) {
		this.answer_regi = answer_regi;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getUpdate_regi() {
		return update_regi;
	}

	public void setUpdate_regi(String update_regi) {
		this.update_regi = update_regi;
	}

	@Override
	public String toString() {
		return "BbsAnswerVo [answer_seq=" + answer_seq + ", bbs_seq=" + bbs_seq + ", bbs_answer=" + bbs_answer
				+ ", answer_regi=" + answer_regi + ", mem_name=" + mem_name + ", mem_seq=" + mem_seq + ", update_regi="
				+ update_regi + "]";
	}

}
