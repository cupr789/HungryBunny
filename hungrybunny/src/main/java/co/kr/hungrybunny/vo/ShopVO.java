package co.kr.hungrybunny.vo;

public class ShopVO {

	private int shopNo;
	private String shopName;
	private String shopAddress;
	private String shopHP;
	private String shopTime;
	private double shopLon;
	private double shopLat;
	private int shopCaNo;
	private int uiNo;
	
	
	
	public double getShopLon() {
		return shopLon;
	}
	public void setShopLon(double shopLon) {
		this.shopLon = shopLon;
	}
	public double getShopLat() {
		return shopLat;
	}
	public void setShopLat(double shopLat) {
		this.shopLat = shopLat;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
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
	public String getShopTime() {
		return shopTime;
	}
	public void setShopTime(String shopTime) {
		this.shopTime = shopTime;
	}
	public int getShopCaNo() {
		return shopCaNo;
	}
	public void setShopCaNo(int shopCaNo) {
		this.shopCaNo = shopCaNo;
	}
	public int getUiNo() {
		return uiNo;
	}
	public void setUiNo(int uiNo) {
		this.uiNo = uiNo;
	}
	
	@Override
	public String toString() {
		return "ShopVO [shopNo=" + shopNo + ", shopName=" + shopName + ", shopAddress=" + shopAddress + ", shopHP="
				+ shopHP + ", shopTime=" + shopTime + ", shopLon=" + shopLon + ", shopLat=" + shopLat + ", shopCaNo="
				+ shopCaNo + ", uiNo=" + uiNo + "]";
	}
}
