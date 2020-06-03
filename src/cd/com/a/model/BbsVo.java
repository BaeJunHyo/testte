package cd.com.a.model;

import java.io.Serializable;

public class BbsVo implements Serializable {


	    // 게시판글 UUID
	    private Integer ntt_id;
	    // 게시판명 UUID
	    private String bbs_id;
	    // 게시글 행번호
	    private Integer ntt_step;
	    // 게시글 제목
	    private String ntt_title;
	    // 게시글 내용
	    private String ntt_content;
	    // 답글 존재 여부
	    private String answer_attr;
	    // 답글 그룹번호
	    private Integer ntt_ref;
	    // 답글 깊이
	    private Integer ntt_depth;
	    // 조회수
	    private Integer rdcnt;
	    // 게시글 사용 여부
	    private String use_attr;
	    // 파일명
	    private String file_id;
	    // 게시글 작성일
	    private String frst_regi;
	    // 게시글 작성자
	    private Integer frst_regi_id;
	    // 게시글 작성자명
	    private String frst_regi_usrid;
	    // 게시글 수정일
	    private String last_updt_regi;
	    // 게시글 수정자
	    private Integer last_updt_id;
	    // 게시글 수정자명
	    private String last_updt_usrid;
	    
		public BbsVo() {
			super();
		}

		public BbsVo(Integer ntt_id, String bbs_id, Integer ntt_step, String ntt_title, String ntt_content,
				String answer_attr, Integer ntt_ref, Integer ntt_depth, Integer rdcnt, String use_attr, String file_id,
				String frst_regi, Integer frst_regi_id, String frst_regi_usrid, String last_updt_regi,
				Integer last_updt_id, String last_updt_usrid) {
			super();
			this.ntt_id = ntt_id;
			this.bbs_id = bbs_id;
			this.ntt_step = ntt_step;
			this.ntt_title = ntt_title;
			this.ntt_content = ntt_content;
			this.answer_attr = answer_attr;
			this.ntt_ref = ntt_ref;
			this.ntt_depth = ntt_depth;
			this.rdcnt = rdcnt;
			this.use_attr = use_attr;
			this.file_id = file_id;
			this.frst_regi = frst_regi;
			this.frst_regi_id = frst_regi_id;
			this.frst_regi_usrid = frst_regi_usrid;
			this.last_updt_regi = last_updt_regi;
			this.last_updt_id = last_updt_id;
			this.last_updt_usrid = last_updt_usrid;
		}

		public Integer getNtt_id() {
			return ntt_id;
		}

		public void setNtt_id(Integer ntt_id) {
			this.ntt_id = ntt_id;
		}

		public String getBbs_id() {
			return bbs_id;
		}

		public void setBbs_id(String bbs_id) {
			this.bbs_id = bbs_id;
		}

		public Integer getNtt_step() {
			return ntt_step;
		}

		public void setNtt_step(Integer ntt_step) {
			this.ntt_step = ntt_step;
		}

		public String getNtt_title() {
			return ntt_title;
		}

		public void setNtt_title(String ntt_title) {
			this.ntt_title = ntt_title;
		}

		public String getNtt_content() {
			return ntt_content;
		}

		public void setNtt_content(String ntt_content) {
			this.ntt_content = ntt_content;
		}

		public String getAnswer_attr() {
			return answer_attr;
		}

		public void setAnswer_attr(String answer_attr) {
			this.answer_attr = answer_attr;
		}

		public Integer getNtt_ref() {
			return ntt_ref;
		}

		public void setNtt_ref(Integer ntt_ref) {
			this.ntt_ref = ntt_ref;
		}

		public Integer getNtt_depth() {
			return ntt_depth;
		}

		public void setNtt_depth(Integer ntt_depth) {
			this.ntt_depth = ntt_depth;
		}

		public Integer getRdcnt() {
			return rdcnt;
		}

		public void setRdcnt(Integer rdcnt) {
			this.rdcnt = rdcnt;
		}

		public String getUse_attr() {
			return use_attr;
		}

		public void setUse_attr(String use_attr) {
			this.use_attr = use_attr;
		}

		public String getFile_id() {
			return file_id;
		}

		public void setFile_id(String file_id) {
			this.file_id = file_id;
		}

		public String getFrst_regi() {
			return frst_regi;
		}

		public void setFrst_regi(String frst_regi) {
			this.frst_regi = frst_regi;
		}

		public Integer getFrst_regi_id() {
			return frst_regi_id;
		}

		public void setFrst_regi_id(Integer frst_regi_id) {
			this.frst_regi_id = frst_regi_id;
		}

		public String getFrst_regi_usrid() {
			return frst_regi_usrid;
		}

		public void setFrst_regi_usrid(String frst_regi_usrid) {
			this.frst_regi_usrid = frst_regi_usrid;
		}

		public String getLast_updt_regi() {
			return last_updt_regi;
		}

		public void setLast_updt_regi(String last_updt_regi) {
			this.last_updt_regi = last_updt_regi;
		}

		public Integer getLast_updt_id() {
			return last_updt_id;
		}

		public void setLast_updt_id(Integer last_updt_id) {
			this.last_updt_id = last_updt_id;
		}

		public String getLast_updt_usrid() {
			return last_updt_usrid;
		}

		public void setLast_updt_usrid(String last_updt_usrid) {
			this.last_updt_usrid = last_updt_usrid;
		}

		@Override
		public String toString() {
			return "BbsVo [ntt_id=" + ntt_id + ", bbs_id=" + bbs_id + ", ntt_step=" + ntt_step + ", ntt_title="
					+ ntt_title + ", ntt_content=" + ntt_content + ", answer_attr=" + answer_attr + ", ntt_ref="
					+ ntt_ref + ", ntt_depth=" + ntt_depth + ", rdcnt=" + rdcnt + ", use_attr=" + use_attr
					+ ", file_id=" + file_id + ", frst_regi=" + frst_regi + ", frst_regi_id=" + frst_regi_id
					+ ", frst_regi_usrid=" + frst_regi_usrid + ", last_updt_regi=" + last_updt_regi + ", last_updt_id="
					+ last_updt_id + ", last_updt_usrid=" + last_updt_usrid + "]";
		}

		
	    
		
	    
	    


	
}
