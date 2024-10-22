package project3.talking.gamja.dto.mes;

public class MesLogDTO {
	private int log_seq;
	private String log_date;
	private int wo_id;
	private int os_id;
	private int bom_code;
	private String bom_name;
	private int wo_count;
	private String wo_status;
	private int emp_id;
	private String emp_name;
	private int buser_seq;
	private String os_status;
	private int lib_id;
	private String lib_name;
	public int getLog_seq() {
		return log_seq;
	}
	public void setLog_seq(int log_seq) {
		this.log_seq = log_seq;
	}
	public String getLog_date() {
		return log_date;
	}
	public void setLog_date(String log_date) {
		this.log_date = log_date;
	}
	public int getWo_id() {
		return wo_id;
	}
	public void setWo_id(int wo_id) {
		this.wo_id = wo_id;
	}
	public int getOs_id() {
		return os_id;
	}
	public void setOs_id(int os_id) {
		this.os_id = os_id;
	}
	public int getBom_code() {
		return bom_code;
	}
	public void setBom_code(int bom_code) {
		this.bom_code = bom_code;
	}
	public String getBom_name() {
		return bom_name;
	}
	public void setBom_name(String bom_name) {
		this.bom_name = bom_name;
	}
	public int getWo_count() {
		return wo_count;
	}
	public void setWo_count(int wo_count) {
		this.wo_count = wo_count;
	}
	public String getWo_status() {
		return wo_status;
	}
	public void setWo_status(String wo_status) {
		this.wo_status = wo_status;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getBuser_seq() {
		return buser_seq;
	}
	public void setBuser_seq(int buser_seq) {
		this.buser_seq = buser_seq;
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
	public String getLib_name() {
		return lib_name;
	}
	public void setLib_name(String lib_name) {
		this.lib_name = lib_name;
	}
	@Override
	public String toString() {
		return "MesLogDTO [log_seq=" + log_seq + ", log_date=" + log_date + ", wo_id=" + wo_id + ", os_id=" + os_id
				+ ", bom_code=" + bom_code + ", bom_name=" + bom_name + ", wo_count=" + wo_count + ", wo_status="
				+ wo_status + ", emp_id=" + emp_id + ", emp_name=" + emp_name + ", buser_seq=" + buser_seq
				+ ", os_status=" + os_status + ", lib_id=" + lib_id + ", lib_name=" + lib_name + "]";
	}
	
}
