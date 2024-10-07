package project3.gamja.jojandi.dto.user.my;

public class LoanDTO {
	private int loan_seq;
	private int book_code;
	private int user_seq;
	private java.sql.Date loan_date;
	private boolean loan_ing;
	private java.sql.Date loan_return;
	private java.sql.Date loan_ex;
	private boolean loan_over;
	private java.sql.Date user_pass;
	private String book_name;
	private int isOver;
	private int over;
	private int res_id;
	private java.sql.Date res_day;
	private java.sql.Date res_pick;
	private int res_ing;
	private int start;
	private int end;
	
	
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getRes_id() {
		return res_id;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}
	public java.sql.Date getRes_day() {
		return res_day;
	}
	public void setRes_day(java.sql.Date res_day) {
		this.res_day = res_day;
	}
	public java.sql.Date getRes_pick() {
		return res_pick;
	}
	public void setRes_pick(java.sql.Date res_pick) {
		this.res_pick = res_pick;
	}
	public int getRes_ing() {
		return res_ing;
	}
	public void setRes_ing(int res_ing) {
		this.res_ing = res_ing;
	}
	public int getOver() {
		return over;
	}
	public void setOver(int over) {
		this.over = over;
	}
	public int getIsOver() {
		return isOver;
	}
	public void setIsOver(int isOver) {
		this.isOver = isOver;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public java.sql.Date getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(java.sql.Date user_pass) {
		this.user_pass = user_pass;
	}
	public int getLoan_seq() {
		return loan_seq;
	}
	public void setLoan_seq(int loan_seq) {
		this.loan_seq = loan_seq;
	}
	public int getBook_code() {
		return book_code;
	}
	public void setBook_code(int book_code) {
		this.book_code = book_code;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public java.sql.Date getLoan_date() {
		return loan_date;
	}
	public void setLoan_date(java.sql.Date loan_date) {
		this.loan_date = loan_date;
	}
	public boolean isLoan_ing() {
		return loan_ing;
	}
	public void setLoan_ing(boolean loan_ing) {
		this.loan_ing = loan_ing;
	}
	public java.sql.Date getLoan_return() {
		return loan_return;
	}
	public void setLoan_return(java.sql.Date loan_return) {
		this.loan_return = loan_return;
	}
	public java.sql.Date getLoan_ex() {
		return loan_ex;
	}
	public void setLoan_ex(java.sql.Date loan_ex) {
		this.loan_ex = loan_ex;
	}
	public boolean isLoan_over() {
		return loan_over;
	}
	public void setLoan_over(boolean loan_over) {
		this.loan_over = loan_over;
	}
	@Override
	public String toString() {
		return "LoanDTO [loan_seq=" + loan_seq + ", book_code=" + book_code + ", user_seq=" + user_seq + ", loan_date="
				+ loan_date + ", loan_ing=" + loan_ing + ", loan_return=" + loan_return + ", loan_ex=" + loan_ex
				+ ", loan_over=" + loan_over + ", user_pass=" + user_pass + ", book_name=" + book_name + ", isOver="
				+ isOver + ", over=" + over + ", res_id=" + res_id + ", res_day=" + res_day + ", res_pick=" + res_pick
				+ ", res_ing=" + res_ing + "]";
	}
	
}
