package kr.co.rabbit.vo;

public class ShopCaVO {

	private int shopCaNo;
	private String shopCaName;

	public int getShopCaNo() {
		return shopCaNo;
	}
	public void setShopCaNo(int shopCaNo) {
		this.shopCaNo = shopCaNo;
	}
	public String getShopCaName() {
		return shopCaName;
	}
	public void setShopCaName(String shopCaName) {
		this.shopCaName = shopCaName;
	}

	@Override
	public String toString() {
		return "ShopCaVO [shopCaNo=" + shopCaNo + ", shopCaName=" + shopCaName + "]";
	}
}
