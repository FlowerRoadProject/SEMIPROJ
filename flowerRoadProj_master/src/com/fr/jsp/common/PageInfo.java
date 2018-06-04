package com.fr.jsp.common;

public class PageInfo implements java.io.Serializable{

	private  int currPage;
	private  int listCount;
	private  int limit;
	private  int maxPage;
	private  int startPage;
	private  int endPage;
	private  int startRow;
	private int endRow;


	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "PageInfo [currPage=" + currPage + ", listCount=" + listCount + ", limit=" + limit + ", maxPage="
				+ maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", startRow="+startRow+", endRow="+endRow+"]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + currPage;
		result = prime * result + endPage;
		result = prime * result + limit;
		result = prime * result + listCount;
		result = prime * result + maxPage;
		result = prime * result + startPage;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PageInfo other = (PageInfo) obj;
		if (currPage != other.currPage)
			return false;
		if (endPage != other.endPage)
			return false;
		if (limit != other.limit)
			return false;
		if (listCount != other.listCount)
			return false;
		if (maxPage != other.maxPage)
			return false;
		if (startPage != other.startPage)
			return false;
		return true;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public PageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageInfo(int currPage, int listCount, int limit, int startPage, int endPage,int maxPage) {
		
		
		super();
		this.currPage = currPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		
		
	}

	public PageInfo(int currPage, int listCount, int limit) {
		super();
		this.currPage = currPage;
		this.listCount = listCount;
		this.limit = limit;
		
		//총 게시글 수에 대한 페이지 계산
		//ex)목록의 수가 123개라면 페이지 수는 13개가 된다.
		//10으로 나누어 떨어지지 않은 게시글도 하나의 페이지가 되어야 한다.
		//소수점 자리를 올리기 위해서 0.9를 더하고 (int)형으로 형변환하여 자른다.
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		//현재 화면에 표시할 페이지 갯수
		//첫 페이지의 번호
		//한 화면에 10개의 페이지를 표시하고 싶다.
		startPage = (((int)((double)currPage / limit+0.9))-1)*limit+1;
		
		//한 화면에 표시할 마지막 페이지 번호
		endPage = startPage + limit-1;
		
		//만약에 1,2,3,4,5,6,7,8,9,10을 보여주려고 한다면
		//하지만 7페이지 밖에 없을때 
		if(maxPage<endPage){
			endPage=maxPage;
		}
		
		startRow  =(currPage-1)*limit+1;
		endRow = startRow+(limit-1);
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 4L;
	
	
}
