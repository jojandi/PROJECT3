package project3.talking.gamja.dto.admin;

public class MemberDTO {
	private Integer like_id;
	private String like;
	private Integer user_seq;
	private String user_id;
	private String user_pw;
	private String user_name;
	private java.sql.Date user_birth; 
	private String user_tel;
	private String user_addr;
	private String user_addr_info;
	private String user_email;
	private String user_sub;
	private java.sql.Date user_pass;
	private String user_over;
	private Integer loan_seq;
	private String user_admin;
	private Integer over_count;
	private String domain;
	private String like_like;
	public Integer getLike_id() {
		return like_id;
	}
	public void setLike_id(Integer like_id) {
		this.like_id = like_id;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
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
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_addr_info() {
		return user_addr_info;
	}
	public void setUser_addr_info(String user_addr_info) {
		this.user_addr_info = user_addr_info;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_sub() {
		return user_sub;
	}
	public void setUser_sub(String user_sub) {
		this.user_sub = user_sub;
	}
	public java.sql.Date getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(java.sql.Date user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_over() {
		return user_over;
	}
	public void setUser_over(String user_over) {
		this.user_over = user_over;
	}
	public Integer getLoan_seq() {
		return loan_seq;
	}
	public void setLoan_seq(Integer loan_seq) {
		this.loan_seq = loan_seq;
	}
	public String getUser_admin() {
		return user_admin;
	}
	public void setUser_admin(String user_admin) {
		this.user_admin = user_admin;
	}
	public Integer getOver_count() {
		return over_count;
	}
	public void setOver_count(Integer over_count) {
		this.over_count = over_count;
	}
	
	
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	
	public String getLike_like() {
		return like_like;
	}
	public void setLike_like(String like_like) {
		this.like_like = like_like;
	}
	@Override
	public String toString() {
		return "MemberDTO [like_id=" + like_id + ", like=" + like + ", user_seq=" + user_seq + ", user_id=" + user_id
				+ ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_birth=" + user_birth + ", user_tel="
				+ user_tel + ", user_addr=" + user_addr + ", user_addr_info=" + user_addr_info + ", user_email="
				+ user_email + ", user_sub=" + user_sub + ", user_pass=" + user_pass + ", user_over=" + user_over
				+ ", loan_seq=" + loan_seq + ", user_admin=" + user_admin + ", over_count=" + over_count + "]";
	}
	
	
}
