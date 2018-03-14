package co.kr.hungrybunny.vo;

public class AdminResVO {

	private int resNo;
	private String resDatetime;
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
		return resDatetime;
	}
	public void setResDatetime(String resDatetime) {
		this.resDatetime = resDatetime;
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
		return "AdminResVO [resNo=" + resNo + ", resDatetime=" + resDatetime + ", shopNo=" + shopNo + ", hallNo="
				+ hallNo + ", uiNo=" + uiNo + ", PayNo=" + PayNo + "]";
	}
	
}
