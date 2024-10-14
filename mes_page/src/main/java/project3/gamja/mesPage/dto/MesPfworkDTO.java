package project3.gamja.mesPage.dto;

public class MesPfworkDTO {
	
	private Integer os_id;
	
	private Integer bom_code;
	
	private Integer emp_id;

	private Integer buser_seq;
	
	private java.sql.Date os_date;
	
	private String bom_name;
	
	private String user_id;
	
	private Integer user_seq;
	
	private String emp_name;
	
	private java.sql.Date ds_date;
	
	private String ds_con;
	
	private String lib_name;
	
	private String book_name;
	
	private String app_book;
	
	private int rnum;
	
	private int start;
	
	private int end;
	
	private int lr_count;
	
	private int lib_id;
	
	private String os_status;

	
	@Override
	public String toString() {
		return "MesPfworkDTO [os_id=" + os_id + ", bom_code=" + bom_code + ", emp_id=" + emp_id + ", buser_seq="
				+ buser_seq + ", os_date=" + os_date + ", bom_name=" + bom_name + ", user_id=" + user_id + ", user_seq="
				+ user_seq + ", emp_name=" + emp_name + ", ds_date=" + ds_date + ", ds_con=" + ds_con + "]";
	}
	
	

	public String getOs_status() {
		return os_status;
	}



	public void setOs_status(String os_status) {
		this.os_status = os_status;
	}



	public int getLib_id() {
		return lib_id;
	}



	public void setLib_id(int lib_id) {
		this.lib_id = lib_id;
	}



	public int getLr_count() {
		return lr_count;
	}



	public void setLr_count(int lr_count) {
		this.lr_count = lr_count;
	}



	public String getApp_book() {
		return app_book;
	}



	public void setApp_book(String app_book) {
		this.app_book = app_book;
	}



	public String getLib_name() {
		return lib_name;
	}



	public void setLib_name(String lib_name) {
		this.lib_name = lib_name;
	}



	public String getBook_name() {
		return book_name;
	}



	public void setBook_name(String book_name) {
		this.book_name = book_name;
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



	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public java.sql.Date getDs_date() {
		return ds_date;
	}
	
	public void setDs_date(java.sql.Date ds_date) {
		this.ds_date = ds_date;
	}
	
	public String getDs_con() {
		return ds_con;
	}
	
	public void setDs_con(String ds_con) {
		this.ds_con = ds_con;
	}
	
	public Integer getOs_id() {
		return os_id;
	}

	
	public void setOs_id(Integer os_id) {
		this.os_id = os_id;
	}

	public Integer getBom_code() {
		return bom_code;
	}

	public void setBom_code(Integer bom_code) {
		this.bom_code = bom_code;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public Integer getBuser_seq() {
		return buser_seq;
	}

	public void setBuser_seq(Integer buser_seq) {
		this.buser_seq = buser_seq;
	}

	public java.sql.Date getOs_date() {
		return os_date;
	}

	public void setOs_date(java.sql.Date os_date) {
		this.os_date = os_date;
	}

	public String getBom_name() {
		return bom_name;
	}

	public void setBom_name(String bom_name) {
		this.bom_name = bom_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Integer getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(Integer user_seq) {
		this.user_seq = user_seq;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	

}
