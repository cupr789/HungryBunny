package co.kr.hungrybunny.vo;

public class PayCaVO {

	private int payCaNo;
	private String payType;
	
	public int getPayCaNo() {
		return payCaNo;
	}
	public void setPayCaNo(int payCaNo) {
		this.payCaNo = payCaNo;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	
	@Override
	public String toString() {
		return "payCaVO [payCaNo=" + payCaNo + ", payType=" + payType + "]";
	}
}
