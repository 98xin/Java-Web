package page;

public class Page {
	private int currentPage; //当前页
	private int totalPage;//总页数
	private int totalCount;//总条数
	private int count;//每页条数
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		int i = (this.totalCount % count==0)?0:1 ;
		this.totalPage = this.totalCount / count + i ;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Page(int currentPage, int totalPage, int totalCount, int count) {
		super();
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
		this.count = count;
	}
	public Page() {
		super();
		currentPage = 1;
		count=6;
		totalCount = 0;
		totalPage = 0;
	}
	
}
