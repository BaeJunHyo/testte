package cd.com.a.model;

import java.io.Serializable;

public class PagingVo implements Serializable {


	private int currentPageNo;
	private int recordCountPerPage;
	private int pageSize;
	private int totalRecordCount;
	
	private int totalPageCount;
	private int firstPageNoOnPageList;
	private int lastPageNoOnPageList;
	private int firstRecordIndex;
	private int lastRecordIndex;
	
	

	public PagingVo() {
		super();
	}
	

	public PagingVo(int currentPageNo, int recordCountPerPage, int pageSize, int totalRecordCount, int totalPageCount,
			int firstPageNoOnPageList, int lastPageNoOnPageList, int firstRecordIndex, int lastRecordIndex) {
		super();
		this.currentPageNo = currentPageNo;
		this.recordCountPerPage = recordCountPerPage;
		this.pageSize = pageSize;
		this.totalRecordCount = totalRecordCount;
		this.totalPageCount = totalPageCount;
		this.firstPageNoOnPageList = firstPageNoOnPageList;
		this.lastPageNoOnPageList = lastPageNoOnPageList;
		this.firstRecordIndex = firstRecordIndex;
		this.lastRecordIndex = lastRecordIndex;
	}


	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getFirstPageNoOnPageList() {
		return firstPageNoOnPageList;
	}

	public void setFirstPageNoOnPageList(int firstPageNoOnPageList) {
		this.firstPageNoOnPageList = firstPageNoOnPageList;
	}

	public int getLastPageNoOnPageList() {
		return lastPageNoOnPageList;
	}

	public void setLastPageNoOnPageList(int lastPageNoOnPageList) {
		this.lastPageNoOnPageList = lastPageNoOnPageList;
	}

	public int getFirstRecordIndex() {
		return firstRecordIndex;
	}

	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}

	public int getLastRecordIndex() {
		return lastRecordIndex;
	}

	public void setLastRecordIndex(int lastRecordIndex) {
		this.lastRecordIndex = lastRecordIndex;
	}

	@Override
	public String toString() {
		return "PagingVo [currentPageNo=" + currentPageNo + ", recordCountPerPage=" + recordCountPerPage + ", pageSize="
				+ pageSize + ", totalRecordCount=" + totalRecordCount + ", totalPageCount=" + totalPageCount
				+ ", firstPageNoOnPageList=" + firstPageNoOnPageList + ", lastPageNoOnPageList=" + lastPageNoOnPageList
				+ ", firstRecordIndex=" + firstRecordIndex + ", lastRecordIndex=" + lastRecordIndex + "]";
	}
	

}
