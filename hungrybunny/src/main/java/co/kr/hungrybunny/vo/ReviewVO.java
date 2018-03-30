package co.kr.hungrybunny.vo;

import java.util.Arrays;

public class ReviewVO {

	private int reviewNo;
	private int reviewRating;
	private String reviewComment;
	private int shopNo;
	private int resNo;
	private String uiId;
	private String menuName;
	private String resDate;
	private String fileName;
	private long fileSize;
	private String adminComment;
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getUiId() {
		return uiId;
	}
	public void setUiId(String uiId) {
		this.uiId = uiId;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getAdminComment() {
		return adminComment;
	}
	public void setAdminComment(String adminComment) {
		this.adminComment = adminComment;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", reviewRating=" + reviewRating + ", reviewComment=" + reviewComment
				+ ", shopNo=" + shopNo + ", resNo=" + resNo + ", uiId=" + uiId + ", menuName=" + menuName + ", resDate="
				+ resDate + ", fileName=" + fileName + ", fileSize=" + fileSize + ", adminComment=" + adminComment
				+ "]";
	}
	
	
}
