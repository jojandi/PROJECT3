package project3.gamja.admin.dto;

public class RequestDTO {
	
	private Integer os_id;
	
	private String lib_name;
	
	private java.sql.Date os_date;
	
	private java.sql.Date lr_date;
	
	private String emp_name;
	
	private String app_book;
	
	private String app_name;
	
	private String app_pub;
	
	private Integer lr_count;
	
	private Integer lr_seq;
	
	private Integer app_seq;
	
	private Integer lib_id;
	
	private Integer book_isbn;
	
	private String book_author;
	
	private String book_pub;
	
	private String lr_ing;
	
	public String getLr_ing() {
		return lr_ing;
	}

	public void setLr_ing(String lr_ing) {
		this.lr_ing = lr_ing;
	}

	private int start;
	
	private int end;

	public Integer getOs_id() {
		return os_id;
	}

	public void setOs_id(Integer os_id) {
		this.os_id = os_id;
	}

	public String getLib_name() {
		return lib_name;
	}

	public void setLib_name(String lib_name) {
		this.lib_name = lib_name;
	}

	public java.sql.Date getOs_date() {
		return os_date;
	}

	public void setOs_date(java.sql.Date os_date) {
		this.os_date = os_date;
	}

	public java.sql.Date getLr_date() {
		return lr_date;
	}

	public void setLr_date(java.sql.Date lr_date) {
		this.lr_date = lr_date;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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

	public Integer getLr_count() {
		return lr_count;
	}

	public void setLr_count(Integer lr_count) {
		this.lr_count = lr_count;
	}

	public Integer getLr_seq() {
		return lr_seq;
	}

	public void setLr_seq(Integer lr_seq) {
		this.lr_seq = lr_seq;
	}

	public Integer getApp_seq() {
		return app_seq;
	}

	public void setApp_seq(Integer app_seq) {
		this.app_seq = app_seq;
	}

	public Integer getLib_id() {
		return lib_id;
	}

	public void setLib_id(Integer lib_id) {
		this.lib_id = lib_id;
	}

	public Integer getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(Integer book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_pub() {
		return book_pub;
	}

	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
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
