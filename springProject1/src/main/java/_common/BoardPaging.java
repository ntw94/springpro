package _common;

public class BoardPaging {
	
	int pageSize;
	int blockSize;
	int totalRecord;
	int page; // 현재 페이지
	
	// 계산
	int totalPage;		//전체 페이지수
	int totalBlock;
	int nowBlock;
	int startPage;
	int lastPage;
	int startRecord;
	int lastRecord;
	int prePage;
	int nxtPage;
	int recordIdx;
	int prvBlock = 0;
	int nxtBlock =totalBlock;
	
	public BoardPaging(int pageSize, int blockSize, int totalRecord, int page) {
		super();
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		this.totalRecord = totalRecord;
		this.page = page;
	
		totalPage = (int)Math.ceil(totalRecord*1.0 / pageSize);
		totalBlock =(int) Math.ceil(totalPage*1.0/ blockSize );
		nowBlock = (int) Math.ceil((page-1)/blockSize)+1;
		startPage = (nowBlock-1)*blockSize + 1;
		lastPage = startPage+blockSize-1;
		startRecord = (page-1)*pageSize+1;
		lastRecord = startRecord+pageSize-1;
		prePage = (nowBlock == 1) ?1: (nowBlock -1) * blockSize;
		nxtPage = (nowBlock > totalBlock) ?(nowBlock*blockSize): (nowBlock * blockSize) + 1;
		recordIdx = totalRecord-pageSize*(page-1);
		prvBlock = 0;
		nxtBlock =totalBlock;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	//실제 페이지 시작
	public int getStartRecord() {
		return startRecord;
	}
	//실제 페이지 사용
	public int getLastRecord() {
		if(lastRecord >= totalRecord)
			lastRecord = totalRecord;
		
		return lastRecord;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	//블락 페이지네이션에 사용
	public int getStartPage() { //
		return startPage;
	}
	//블락 페이지네이션에 사용
	public int getLastPage() {
		if(lastPage >= totalPage) {
			lastPage = totalPage;
		}	
		return lastPage;
	}
	//현재 블락
	public int getNowBlock() {
		return nowBlock;
	}
	
	public int getNxtPage() {
		if(nxtPage >=totalPage) {
			nxtPage=totalPage;
		}
		return nxtPage;
	}
	
	public int getPrePage() {
		return prePage;
	}
	
	public int getNxtBlock() {
		if(nowBlock < totalBlock) {
			nxtBlock = nowBlock+1;
		}
		return nxtBlock;
	}
	
	public int getPrvBlock() {
		if(nowBlock > 1) {
			prvBlock = nowBlock -1;
		}
		return prvBlock;
	}
	
	public int getJJ() {
		return recordIdx;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "BoardPaging [pageSize=" + pageSize + ", blockSize=" + blockSize + ", totalRecord=" + totalRecord
				+ ", page=" + page + ", totalPage=" + totalPage + ", totalBlock=" + totalBlock + ", nowBlock="
				+ nowBlock + ", startPage=" + startPage + ", lastPage=" + lastPage + ", startRecord=" + startRecord
				+ ", lastRecord=" + lastRecord + ", prePage=" + prePage + ", nxtPage=" + nxtPage + ", recordIdx="
				+ recordIdx + ", prvBlock=" + prvBlock + ", nxtBlock=" + nxtBlock + "]";
	}
	
	
}
