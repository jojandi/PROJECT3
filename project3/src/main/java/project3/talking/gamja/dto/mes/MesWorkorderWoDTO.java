package project3.talking.gamja.dto.mes;

public class MesWorkorderWoDTO {
	
	private Integer wo_id;
	
	private Integer bom_code;
	
	private String wo_process;
	
	private java.sql.Date wo_sdate;
	
	private java.sql.Date wo_edate;
	
	private Integer wo_count;
	
	private String wo_status;
	
	private String bom_name;

	public Integer getWo_id() {
		return wo_id;
	}
	

	public void setWo_id(Integer wo_id) {
		this.wo_id = wo_id;
	}

	public Integer getBom_code() {
		return bom_code;
	}

	public void setBom_code(Integer bom_code) {
		this.bom_code = bom_code;
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

	@Override
	public String toString() {
		return "MesWorkoerWoDTO [wo_id=" + wo_id + ", bom_code=" + bom_code + ", wo_process=" + wo_process
				+ ", wo_sdate=" + wo_sdate + ", wo_edate=" + wo_edate + ", wo_count=" + wo_count + ", wo_status="
				+ wo_status + ", bom_name=" + bom_name + "]";
	}
	
	

}
