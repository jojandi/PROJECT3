package project3.talking.gamja.dto.user;

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
	private int over_date;
	private int res_id;
	private java.sql.Date res_day;
	private java.sql.Date res_pick;
	private int res_ing;
	private int start;
	private int end;
	private int lib_id;
	private String lib_name;
	private int[] lib_ids;
	
	
	public int[] getLib_ids() {
		return lib_ids;
	}
	public void setLib_ids(int[] lib_ids) {
		this.lib_ids = lib_ids;
	}
	public int getLib_id() {
		return lib_id;
	}
	public void setLib_id(int lib_id) {
		this.lib_id = lib_id;
	}
	public String getLib_name() {
		return lib_name;
	}
	public void setLib_name(String lib_name) {
		this.lib_name = lib_name;
	}
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
	public int getOver_date() {
		return over_date;
	}
	public void setOver_date(int over_date) {
		this.over_date = over_date;
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
}
