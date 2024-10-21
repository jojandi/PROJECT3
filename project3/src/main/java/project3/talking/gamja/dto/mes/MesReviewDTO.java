package project3.talking.gamja.dto.mes;

public class MesReviewDTO {
	
	private Integer user_seq;
	
	private String user_id;
	
	private String user_sub;
	
	private String user_email;
	
	private Integer buser_seq;
	
	private Integer review_seq;
	
	private String review_name;
	
	private String review_contents;
	
	private java.sql.Date review_date;
	
	private Integer review_score;
	
	private int start;
	
private int rnum;

	
	public int getRnum() {
	return rnum;
}

public void setRnum(int rnum) {
	this.rnum = rnum;
}

public int getLr_count() {
	return lr_count;
}

public void setLr_count(int lr_count) {
	this.lr_count = lr_count;
}

public int getLib_id() {
	return lib_id;
}

public void setLib_id(int lib_id) {
	this.lib_id = lib_id;
}

public String getOs_status() {
	return os_status;
}

public void setOs_status(String os_status) {
	this.os_status = os_status;
}

	private int lr_count;
	
	private int lib_id;
	
	private String os_status;

	
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

	private int end;

	public Integer getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(Integer user_seq) {
		this.user_seq = user_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_sub() {
		return user_sub;
	}

	public void setUser_sub(String user_sub) {
		this.user_sub = user_sub;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Integer getBuser_seq() {
		return buser_seq;
	}

	public void setBuser_seq(Integer buser_seq) {
		this.buser_seq = buser_seq;
	}

	public Integer getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(Integer review_seq) {
		this.review_seq = review_seq;
	}

	public String getReview_name() {
		return review_name;
	}

	public void setReview_name(String review_name) {
		this.review_name = review_name;
	}

	public String getReview_contents() {
		return review_contents;
	}

	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	public java.sql.Date getReview_date() {
		return review_date;
	}

	public void setReview_date(java.sql.Date review_date) {
		this.review_date = review_date;
	}

	public Integer getReview_score() {
		return review_score;
	}

	public void setReview_score(Integer review_score) {
		this.review_score = review_score;
	}

	@Override
	public String toString() {
		return "MesReviewDTO [user_seq=" + user_seq + ", user_id=" + user_id + ", user_sub=" + user_sub
				+ ", user_email=" + user_email + ", buser_seq=" + buser_seq + ", review_seq=" + review_seq
				+ ", review_name=" + review_name + ", review_contents=" + review_contents + ", review_date="
				+ review_date + ", review_score=" + review_score + ", start=" + start + ", end=" + end + ", getStart()="
				+ getStart() + ", getEnd()=" + getEnd() + ", getUser_seq()=" + getUser_seq() + ", getUser_id()="
				+ getUser_id() + ", getUser_sub()=" + getUser_sub() + ", getUser_email()=" + getUser_email()
				+ ", getBuser_seq()=" + getBuser_seq() + ", getReview_seq()=" + getReview_seq() + ", getReview_name()="
				+ getReview_name() + ", getReview_contents()=" + getReview_contents() + ", getReview_date()="
				+ getReview_date() + ", getReview_score()=" + getReview_score() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	
	
	
	
}
