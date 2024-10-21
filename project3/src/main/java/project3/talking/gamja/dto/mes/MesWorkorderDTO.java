package project3.talking.gamja.dto.mes;

public class MesWorkorderDTO {
	private Integer bom_code;
	private String bom_name;
	private Integer mes_book_code1;
	private Integer mes_book_code2;
	private Integer mes_book_code3;
	private long book_isbn;
	private String book_name;
	private String book_author;
	private String book_pub;
	private String book_img;
	private Integer mes_book_code;
	private long book_count;
	private String wh_code;
	private Integer mes_book_price;
	
	
	private Integer wo_id;
	
	private String wo_process;
	
	private java.sql.Date wo_sdate;
	
	private java.sql.Date wo_edate;
	
	private Integer wo_count;
	
	private String wo_status;
	
	private Integer os_id;
	
	private java.sql.Date ds_date;
	
	private String ds_con;
	
	private Integer lib_id;
	
	private Integer app_seq;
	
	private Integer lr_seq;
	
	private int start;
	
	private int end;
	
	
	
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
	public Integer getWo_id() {
		return wo_id;
	}
	public void setWo_id(Integer wo_id) {
		this.wo_id = wo_id;
	}
	public String getWo_process() {
		return wo_process;
	}
	public void setWo_process(String wo_process) {
		this.wo_process = wo_process;
	}
	public java.sql.Date getWo_sdate() {
		return wo_sdate;
	}
	public void setWo_sdate(java.sql.Date wo_sdate) {
		this.wo_sdate = wo_sdate;
	}
	public java.sql.Date getWo_edate() {
		return wo_edate;
	}
	public void setWo_edate(java.sql.Date wo_edate) {
		this.wo_edate = wo_edate;
	}
	public Integer getWo_count() {
		return wo_count;
	}
	public void setWo_count(Integer wo_count) {
		this.wo_count = wo_count;
	}
	public String getWo_status() {
		return wo_status;
	}
	public void setWo_status(String wo_status) {
		this.wo_status = wo_status;
	}
	public String getBom_name() {
		return bom_name;
	}
	public void setBom_name(String bom_name) {
		this.bom_name = bom_name;
	}
	public void setBook_isbn(long book_isbn) {
		this.book_isbn = book_isbn;
	}
	public void setBook_count(long book_count) {
		this.book_count = book_count;
	}
	public Long getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(Long  book_isbn) {
		this.book_isbn = book_isbn;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
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
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	public Integer getMes_book_code() {
		return mes_book_code;
	}
	public void setMes_book_code(Integer mes_book_code) {
		this.mes_book_code = mes_book_code;
	}
	public Long getBook_count() {
		return book_count;
	}
	public void setBook_count(Long book_count) {
		this.book_count = book_count;
	}
	public String getWh_code() {
		return wh_code;
	}
	public void setWh_code(String wh_code) {
		this.wh_code = wh_code;
	}
	public Integer getMes_book_price() {
		return mes_book_price;
	}
	public void setMes_book_price(Integer mes_book_price) {
		this.mes_book_price = mes_book_price;
	}
	public Integer getBom_code() {
		return bom_code;
	}
	public void setBom_code(Integer bom_code) {
		this.bom_code = bom_code;
	}
	
	public Integer getMes_book_code1() {
		return mes_book_code1;
	}
	public void setMes_book_code1(Integer mes_book_code1) {
		this.mes_book_code1 = mes_book_code1;
	}
	public Integer getMes_book_code2() {
		return mes_book_code2;
	}
	public void setMes_book_code2(Integer mes_book_code2) {
		this.mes_book_code2 = mes_book_code2;
	}
	public Integer getMes_book_code3() {
		return mes_book_code3;
	}
	public void setMes_book_code3(Integer mes_book_code3) {
		this.mes_book_code3 = mes_book_code3;
	}
	
	
	@Override
	public String toString() {
		return "MesWorkorderDTO [bom_code=" + bom_code + ", mes_book_code1=" + mes_book_code1 + ", mes_book_code2="
				+ mes_book_code2 + ", mes_book_code3=" + mes_book_code3 + ", book_isbn=" + book_isbn + ", book_name="
				+ book_name + ", book_author=" + book_author + ", book_pub=" + book_pub + ", book_img=" + book_img
				+ ", mes_book_code=" + mes_book_code + ", book_count=" + book_count + ", wh_code=" + wh_code
				+ ", mes_book_price=" + mes_book_price + ", bom_name=" + bom_name + "]";
	}
}
