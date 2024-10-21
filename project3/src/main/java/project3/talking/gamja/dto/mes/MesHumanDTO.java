package project3.talking.gamja.dto.mes;

import java.sql.Date;

public class MesHumanDTO {
	private Integer emp_id;	// 사원번호
	private String emp_name;	// 사원명
	private String emp_hp;		//사원 번호
	private String emp_add;	//사원 주소
	private Date emp_hiredate;//사원 입사일
	private Integer dept_id;
	private String dept_name;
	private Integer po_id;
	private String po_name;
	@Override
	public String toString() {
		return "MesHumanDTO [emp_id=" + emp_id + ", emp_name=" + emp_name + ", emp_hp=" + emp_hp + ", emp_add="
				+ emp_add + ", emp_hiredate=" + emp_hiredate + ", dept_id=" + dept_id + ", dept_name=" + dept_name
				+ ", po_id=" + po_id + ", po_name=" + po_name + "]";
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_hp() {
		return emp_hp;
	}
	public void setEmp_hp(String emp_hp) {
		this.emp_hp = emp_hp;
	}
	public String getEmp_add() {
		return emp_add;
	}
	public void setEmp_add(String emp_add) {
		this.emp_add = emp_add;
	}
	public Date getEmp_hiredate() {
		return emp_hiredate;
	}
	public void setEmp_hiredate(Date emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}
	public Integer getDept_id() {
		return dept_id;
	}
	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public Integer getPo_id() {
		return po_id;
	}
	public void setPo_id(Integer po_id) {
		this.po_id = po_id;
	}
	public String getPo_name() {
		return po_name;
	}
	public void setPo_name(String po_name) {
		this.po_name = po_name;
	}
	
	}
