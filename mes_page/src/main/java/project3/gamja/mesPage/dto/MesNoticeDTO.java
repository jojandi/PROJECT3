package project3.gamja.mesPage.dto;

public class MesNoticeDTO {
	
	private Integer notice_id;
	
	private String notice_name;
	
	private java.sql.Date notice_date;
	
	private String notice_contents;
	
	private Integer emp_id;
	
	private String emp_name;
	
	private int start;
	private int end;
	
	
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

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public Integer getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(Integer notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_name() {
		return notice_name;
	}

	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}

	public java.sql.Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(java.sql.Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_contents() {
		return notice_contents;
	}

	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

}
