package co.kr.hungrybunny.vo;

public class HallVO {
	private int hallNo;
	private int seatCnt;
	private int hallStatus;
	private int shopNo;
	
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
	
	@Override
	public String toString() {
		return "HallVO [hallNo=" + hallNo + ", seatCnt=" + seatCnt + ", hallStatus=" + hallStatus + ", shopNo=" + shopNo
				+ "]";
	}
}
