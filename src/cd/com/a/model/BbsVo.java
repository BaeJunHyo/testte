package cd.com.a.model;

import java.io.Serializable;

public class BbsVo implements Serializable {

    // 게시판seq 
    private int bbs_seq;
    // 제목 
    private String bbs_title;
    // 내용 
    private String bbs_content;
    // 작성자 
    private String mem_name;
    // 작성자 
    private int mem_seq;
    // 링크1 
    private String bbs_link1;
    // 링크2 
    private String bbs_link2;
    // 작성일 
    private String bbs_regi;
    // 조회수 
    private int bbs_readcount;
    // 삭제처리 
    private int bbs_del;
    private String file_origin1;
    private String file_name1;
    private String file_path1;
    private String file_origin2;
    private String file_name2;
    private String file_path2;
    private int answer_count;

    public BbsVo() {
		super();
	}

	public BbsVo(int bbs_seq, String bbs_title, String bbs_content, String mem_name, int mem_seq, String bbs_link1,
			String bbs_link2, String bbs_regi, int bbs_readcount, int bbs_del, String file_origin1, String file_name1,
			String file_path1, String file_origin2, String file_name2, String file_path2, int answer_count) {
		super();
		this.bbs_seq = bbs_seq;
		this.bbs_title = bbs_title;
		this.bbs_content = bbs_content;
		this.mem_name = mem_name;
		this.mem_seq = mem_seq;
		this.bbs_link1 = bbs_link1;
		this.bbs_link2 = bbs_link2;
		this.bbs_regi = bbs_regi;
		this.bbs_readcount = bbs_readcount;
		this.bbs_del = bbs_del;
		this.file_origin1 = file_origin1;
		this.file_name1 = file_name1;
		this.file_path1 = file_path1;
		this.file_origin2 = file_origin2;
		this.file_name2 = file_name2;
		this.file_path2 = file_path2;
		this.answer_count = answer_count;
	}

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public String getBbs_title() {
		return bbs_title;
	}

	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}

	public String getBbs_content() {
		return bbs_content;
	}

	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
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

	public String getBbs_link1() {
		return bbs_link1;
	}

	public void setBbs_link1(String bbs_link1) {
		this.bbs_link1 = bbs_link1;
	}

	public String getBbs_link2() {
		return bbs_link2;
	}

	public void setBbs_link2(String bbs_link2) {
		this.bbs_link2 = bbs_link2;
	}

	public String getBbs_regi() {
		return bbs_regi;
	}

	public void setBbs_regi(String bbs_regi) {
		this.bbs_regi = bbs_regi;
	}

	public int getBbs_readcount() {
		return bbs_readcount;
	}

	public void setBbs_readcount(int bbs_readcount) {
		this.bbs_readcount = bbs_readcount;
	}

	public int getBbs_del() {
		return bbs_del;
	}

	public void setBbs_del(int bbs_del) {
		this.bbs_del = bbs_del;
	}

	public String getFile_origin1() {
		return file_origin1;
	}

	public void setFile_origin1(String file_origin1) {
		this.file_origin1 = file_origin1;
	}

	public String getFile_name1() {
		return file_name1;
	}

	public void setFile_name1(String file_name1) {
		this.file_name1 = file_name1;
	}

	public String getFile_path1() {
		return file_path1;
	}

	public void setFile_path1(String file_path1) {
		this.file_path1 = file_path1;
	}

	public String getFile_origin2() {
		return file_origin2;
	}

	public void setFile_origin2(String file_origin2) {
		this.file_origin2 = file_origin2;
	}

	public String getFile_name2() {
		return file_name2;
	}

	public void setFile_name2(String file_name2) {
		this.file_name2 = file_name2;
	}

	public String getFile_path2() {
		return file_path2;
	}

	public void setFile_path2(String file_path2) {
		this.file_path2 = file_path2;
	}

	public int getAnswer_count() {
		return answer_count;
	}

	public void setAnswer_count(int answer_count) {
		this.answer_count = answer_count;
	}

	@Override
	public String toString() {
		return "BbsVo [bbs_seq=" + bbs_seq + ", bbs_title=" + bbs_title + ", bbs_content=" + bbs_content + ", mem_name="
				+ mem_name + ", mem_seq=" + mem_seq + ", bbs_link1=" + bbs_link1 + ", bbs_link2=" + bbs_link2
				+ ", bbs_regi=" + bbs_regi + ", bbs_readcount=" + bbs_readcount + ", bbs_del=" + bbs_del
				+ ", file_origin1=" + file_origin1 + ", file_name1=" + file_name1 + ", file_path1=" + file_path1
				+ ", file_origin2=" + file_origin2 + ", file_name2=" + file_name2 + ", file_path2=" + file_path2
				+ ", answer_count=" + answer_count + "]";
	}

	
    
	
	  
}