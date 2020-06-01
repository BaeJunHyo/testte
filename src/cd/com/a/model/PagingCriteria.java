package cd.com.a.model;

import java.io.Serializable;

public class PagingCriteria implements Serializable {

	 private int page;
	 private int perPageNum;
	 private int searchType;
     private String keyword;
	    
	    public int getPageStart() {
	        return (this.page-1)*perPageNum;
	    }
	    
	    public PagingCriteria() {
	        this.page = 1;
	        this.perPageNum = 10;
	    }
	    
	    public int getPage() {
	        return page;
	    }
	    public void setPage(int page) {
	        if(page <= 0) {
	            this.page = 1;
	        } else {
	            this.page = page;
	        }
	    }
	    public int getPerPageNum() {
	        return perPageNum;
	    }
	    public void setPerPageNum(int pageCount) {
	        int cnt = this.perPageNum;
	        if(pageCount != cnt) {
	            this.perPageNum = cnt;
	        } else {
	            this.perPageNum = pageCount;
	        }
	    }

		public int getSearchType() {
			return searchType;
		}

		public void setSearchType(int searchType) {
			this.searchType = searchType;
		}

		public String getKeyword() {
			return keyword;
		}

		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}

		@Override
		public String toString() {
			return "PagingCriteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType
					+ ", keyword=" + keyword + "]";
		}

		


}
