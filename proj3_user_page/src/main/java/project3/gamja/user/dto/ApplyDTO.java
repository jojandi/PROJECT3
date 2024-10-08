package project3.gamja.user.dto;

import java.sql.Date;

public class ApplyDTO {
	private int app_seq; // 도서신청 번호
	private String app_book; // 도서명
	private String app_name; // 저자
	private String app_pub; //출판사
	private Date app_date; //신청일
	private String user_seq; // 회원번호
	private String purchased;
	private String app_status;
	private int start;
	private int end;

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getApp_seq() {
		return app_seq;
	}

	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
	}

	public String getPurchased() {
		return purchased;
	}

	public void setPurchased(String purchased) {
		this.purchased = purchased;
	}

	public String getApp_status() {
		return app_status;
	}

	public void setApp_status(String app_status) {
		this.app_status = app_status;
	}

	public int getAnn_seq() {
		return app_seq;
	}

	public void setAnn_seq(int ann_seq) {
		this.app_seq = ann_seq;
	}

	public String getApp_book() {
		return app_book;
	}

	public void setApp_book(String app_book) {
		this.app_book = app_book;
	}

	public String getApp_name() {
		return app_name;
	}

	public void setApp_name(String app_name) {
		this.app_name = app_name;
	}

    public String getApp_pub() {
        return app_pub;
    }

    public void setApp_pub(String app_pub) {
        this.app_pub = app_pub;
    }


	public Date getApp_date() {
		return app_date;
	}

	public void setApp_date(Date app_date) {
		this.app_date = app_date;
	}

	public String getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}

	@Override
	public String toString() {
		return "AppDTO [app_seq=" + app_seq + ", app_book=" + app_book
				+ ", app_name=" + app_name + ", app_pub=" + app_pub
				+ ", app_date=" + app_date + ", user_seq=" + user_seq
				+ ", purchased=" + purchased + ", app_status=" + app_status
				+ "]";
	}

}
