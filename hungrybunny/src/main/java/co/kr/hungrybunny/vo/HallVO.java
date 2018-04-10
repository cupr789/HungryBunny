package co.kr.hungrybunny.vo;

public class HallVO {
	private int hallNo;
	private int seatCnt;
	private int hallStatus;
	private int shopNo;
	private int cnt;
	private int reidx;
	
	public int getHallNo() {
		return hallNo;
	}
	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
	}
	public int getSeatCnt() {
		return seatCnt;
	}
	public void setSeatCnt(int seatCnt) {
		this.seatCnt = seatCnt;
	}
	public int getHallStatus() {
		return hallStatus;
	}
	public void setHallStatus(int hallStatus) {
		this.hallStatus = hallStatus;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getReidx() {
		return reidx;
	}
	public void setReidx(int reidx) {
		this.reidx = reidx;
	}
	
	@Override
	public String toString() {
		return "HallVO [hallNo=" + hallNo + ", seatCnt=" + seatCnt + ", hallStatus=" + hallStatus + ", shopNo=" + shopNo
				+ ", cnt=" + cnt + ", reidx=" + reidx + "]";
	}
}
