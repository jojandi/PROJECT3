package project3.talking.gamja.dto.mes;

public class MesBuserDTO {
	
	private Integer user_seq;
	
	private Integer buser_seq;
	
	private String user_id;
	
	private String user_addr;
	
	private String user_email;
	
	private String domain;
	
	private java.sql.Date buser_date;
	
	private java.sql.Date buser_end;
	
	private String user_id2;
	
	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getUser_id2() {
		return user_id2;
	}

	public void setUser_id2(String user_id2) {
		this.user_id2 = user_id2;
	}

	private int start;
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

	public Integer getBuser_seq() {
		return buser_seq;
	}

	public void setBuser_seq(Integer buser_seq) {
		this.buser_seq = buser_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public java.sql.Date getBuser_date() {
		return buser_date;
	}

	public void setBuser_date(java.sql.Date buser_date) {
		this.buser_date = buser_date;
	}

	public java.sql.Date getBuser_end() {
		return buser_end;
	}

	public void setBuser_end(java.sql.Date buser_end) {
		this.buser_end = buser_end;
	}

	@Override
	public String toString() {
		return "MesBuserDTO [user_seq=" + user_seq + ", buser_seq=" + buser_seq + ", user_id=" + user_id
				+ ", user_addr=" + user_addr + ", user_email=" + user_email + ", buser_date=" + buser_date
				+ ", buser_end=" + buser_end + "]";
	}
	
	

}
