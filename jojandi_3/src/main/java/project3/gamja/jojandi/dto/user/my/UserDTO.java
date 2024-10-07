package project3.gamja.jojandi.dto.user.my;

public class UserDTO {
	private int like_id;
	private String like;
	private int user_seq;
	private String user_id;
	private String user_pw;
	private String user_name;
	private java.sql.Date user_birth; 
	private String user_tel;
	private String user_addr1;
	private String user_addr2;
	private String user_email;
	private boolean user_sub;
	private java.sql.Date user_pass;
	private boolean user_over;
	private int user_loan;
	private boolean user_admin;
	
	
	public boolean isUser_over() {
		return user_over;
	}
	public void setUser_over(boolean user_over) {
		this.user_over = user_over;
	}
	public int getUser_loan() {
		return user_loan;
	}
	public void setUser_loan(int user_loan) {
		this.user_loan = user_loan;
	}
	public boolean isUser_admin() {
		return user_admin;
	}
	public void setUser_admin(boolean user_admin) {
		this.user_admin = user_admin;
	}
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public java.sql.Date getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(java.sql.Date user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_addr1() {
		return user_addr1;
	}
	public void setUser_addr1(String user_addr1) {
		this.user_addr1 = user_addr1;
	}
	public String getUser_addr2() {
		return user_addr2;
	}
	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public boolean isUser_sub() {
		return user_sub;
	}
	public void setUser_sub(boolean user_sub) {
		this.user_sub = user_sub;
	}
	public java.sql.Date getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(java.sql.Date user_pass) {
		this.user_pass = user_pass;
	}
	
	
	@Override
	public String toString() {
		return "MemberDTO [like_id=" + like_id + ", like=" + like + ", user_seq=" + user_seq + ", user_id=" + user_id
				+ ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_birth=" + user_birth + ", user_tel="
				+ user_tel + ", user_addr1=" + user_addr1 + ", user_addr2=" + user_addr2 + ", user_email=" + user_email
				+ ", user_sub=" + user_sub + ", user_pass=" + user_pass + ", user_over=" + user_over + ", user_loan="
				+ user_loan + ", user_admin=" + user_admin + "]";
	}
}
