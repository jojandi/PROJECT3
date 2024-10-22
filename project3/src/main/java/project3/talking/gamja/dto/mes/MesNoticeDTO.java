package project3.talking.gamja.dto.mes;

public class MesNoticeDTO {
	
	private Integer notice_id;
	
	private String notice_name;
	
	private java.sql.Date notice_date;
	
	private String notice_contents;
	
	private Integer emp_id;
	
	private String emp_name;
	
	private int start;
	private int end;
	
	// 게시판 댓글
	private String cm_content;
	private Integer cm_id;
	private Integer target_id;
	private Integer cm_group;
	

	
	
	@Override
	public String toString() {
		return "MesNoticeDTO [notice_id=" + notice_id + ", notice_name=" + notice_name + ", notice_date=" + notice_date
				+ ", notice_contents=" + notice_contents + ", emp_id=" + emp_id + ", emp_name=" + emp_name + ", start="
				+ start + ", end=" + end + ", cm_content=" + cm_content + ", cm_id=" + cm_id + ", target_id="
				+ target_id + ", cm_group=" + cm_group + "]";
	}

	public String getCm_content() {
		return cm_content;
	}

	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}

	public Integer getCm_id() {
		return cm_id;
	}

	public void setCm_id(Integer cm_id) {
		this.cm_id = cm_id;
	}

	public Integer getTarget_id() {
		return target_id;
	}

	public void setTarget_id(Integer target_id) {
		this.target_id = target_id;
	}

	public Integer getCm_group() {
		return cm_group;
	}

	public void setCm_group(Integer cm_group) {
		this.cm_group = cm_group;
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
