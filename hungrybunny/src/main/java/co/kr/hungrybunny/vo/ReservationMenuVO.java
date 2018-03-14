package co.kr.hungrybunny.vo;

public class ReservationMenuVO {
	private int resMenuCnt;
	private int resNo;
	private int menuNo;
	public int getResMenuCnt() {
		return resMenuCnt;
	}
	public void setResMenuCnt(int resMenuCnt) {
		this.resMenuCnt = resMenuCnt;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	@Override
	public String toString() {
		return "ReservationMenuVO [resMenuCnt=" + resMenuCnt + ", resNo=" + resNo + ", menuNo=" + menuNo + "]";
	}
	
}
