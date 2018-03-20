package co.kr.hungrybunny.vo;

public class ReservationVO {

	private int resNo;
	private String resDate;
	private int shopNo;
	private int hallNo;
	private int uiNo;
	private int PayNo;
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getResDatetime() {
		return resDate;
	}
	public void setResDatetime(String resDate) {
		this.resDate = resDate;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public int getHallNo() {
		return hallNo;
	}
	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
	}
	public int getUiNo() {
		return uiNo;
	}
	public void setUiNo(int uiNo) {
		this.uiNo = uiNo;
	}
	public int getPayNo() {
		return PayNo;
	}
	public void setPayNo(int payNo) {
		PayNo = payNo;
	}
	@Override
	public String toString() {
		return "AdminResVO [resNo=" + resNo + ", resDate=" + resDate + ", shopNo=" + shopNo + ", hallNo="
				+ hallNo + ", uiNo=" + uiNo + ", PayNo=" + PayNo + "]";
	}
	
}
