package co.kr.hungrybunny.vo;

public class AdminReview {

	private int adminReview;
	private String adminComment;
	private int reviwNo;
	public int getAdminReview() {
		return adminReview;
	}
	public void setAdminReview(int adminReview) {
		this.adminReview = adminReview;
	}
	public String getAdminComment() {
		return adminComment;
	}
	public void setAdminComment(String adminComment) {
		this.adminComment = adminComment;
	}
	public int getReviwNo() {
		return reviwNo;
	}
	public void setReviwNo(int reviwNo) {
		this.reviwNo = reviwNo;
	}
	@Override
	public String toString() {
		return "AdminReview [adminReview=" + adminReview + ", adminComment=" + adminComment + ", reviwNo=" + reviwNo
				+ "]";
	}
	
}
