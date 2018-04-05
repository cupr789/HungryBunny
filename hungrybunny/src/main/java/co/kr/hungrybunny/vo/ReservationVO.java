package co.kr.hungrybunny.vo;

public class ReservationVO {
	private String shopName;
	private int shopNo;
	private String shopAddress;
	private String shopHP;
	private String menuName;
	private String resDate;
	private int payPrice;
	private String payType;
	private int seatCnt;
	private int currentStatus;
	private int resNo;
	private int hallNo;
	private int hallStatus;
	private int reviewResult;
	
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getShopAddress() {
		return shopAddress;
	}
	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}
	public String getShopHP() {
		return shopHP;
	}
	public void setShopHP(String shopHP) {
		this.shopHP = shopHP;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public int getSeatCnt() {
		return seatCnt;
	}
	public void setSeatCnt(int seatCnt) {
		this.seatCnt = seatCnt;
	}
	public int getCurrentStatus() {
		return currentStatus;
	}
	public void setCurrentStatus(int currentStatus) {
		this.currentStatus = currentStatus;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public int getHallNo() {
		return hallNo;
	}
	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
	}
	public int getHallStatus() {
		return hallStatus;
	}
	public void setHallStatus(int hallStatus) {
		this.hallStatus = hallStatus;
	}
	public int getReviewResult() {
		return reviewResult;
	}
	public void setReviewResult(int reviewResult) {
		this.reviewResult = reviewResult;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [shopName=" + shopName + ", shopNo=" + shopNo + ", shopAddress=" + shopAddress
				+ ", shopHP=" + shopHP + ", menuName=" + menuName + ", resDate=" + resDate + ", payPrice=" + payPrice
				+ ", payType=" + payType + ", seatCnt=" + seatCnt + ", currentStatus=" + currentStatus + ", resNo="
				+ resNo + ", hallNo=" + hallNo + ", hallStatus=" + hallStatus + ", reviewResult=" + reviewResult + "]";
	}
}