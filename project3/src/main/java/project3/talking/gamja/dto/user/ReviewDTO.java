package project3.talking.gamja.dto.user;

public class ReviewDTO {
	
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
				+ review_date + ", review_score=" + review_score + "]";
	}
	
	
	
}
