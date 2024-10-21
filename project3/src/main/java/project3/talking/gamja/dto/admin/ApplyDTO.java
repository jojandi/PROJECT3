package project3.talking.gamja.dto.admin;

public class ApplyDTO {
	private int app_seq;
	private String app_book;
	private String app_name;
	private String app_pub;
	private java.sql.Date app_date;
	private int user_seq;
	private String purchased;
	private String book_name;
	private int lib_id;
	private String lib_name;
	private int start;
	private int end;
	private int[] checks;	
	private int[] lib_ids;	
	
	public int[] getLib_ids() {
		return lib_ids;
	}
	public void setLib_ids(int[] lib_ids) {
		this.lib_ids = lib_ids;
	}
	public int[] getChecks() {
		return checks;
	}
	public void setChecks(int[] checks) {
		this.checks = checks;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getApp_seq() {
		return app_seq;
	}
	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
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
	public java.sql.Date getApp_date() {
		return app_date;
	}
	public void setApp_date(java.sql.Date app_date) {
		this.app_date = app_date;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getPurchased() {
		return purchased;
	}
	public void setPurchased(String purchased) {
		this.purchased = purchased;
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
	
	
  

}
    
    
    
    
    

