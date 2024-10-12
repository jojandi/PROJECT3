package project3.gamja.mesPage.dto;

import java.sql.Date;

public class MesHumanDTO {
	private Integer emp_id;	// 사원번호
	private String emp_name;	// 사원명
	private String emp_hp;		//사원 번호
	private String emp_add;	//사원 주소
	private Date emp_hiredate;//사원 입사일
	private Integer dept_id;
	private String dept_name0;
	private Integer po_id;
	private String po_name0;
	
	public Date getEmp_hiredate() {
		return emp_hiredate;
	}
	public void setEmp_hiredate(Date emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}
	private String po_name; //직책이름
	public String getPo_name() {
		return po_name;
	}
	public void setPo_name(String po_name) {
		this.po_name = po_name;
	}
	public String getDept_name() {
		return dept_name0;
	}
	public void setDept_name(String dept_name) {
		this.dept_name0 = dept_name;
	}
	private String dept_name; // 직급이름
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
	public Integer getDept_id() {
		return dept_id;
	}
	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name0() {
		return dept_name0;
	}
	public void setDept_name0(String dept_name0) {
		this.dept_name0 = dept_name0;
	}
	public Integer getPo_id() {
		return po_id;
	}
	public void setPo_id(Integer po_id) {
		this.po_id = po_id;
	}
	public String getPo_name0() {
		return po_name0;
	}
	public void setPo_name0(String po_name0) {
		this.po_name0 = po_name0;
	}
	@Override
	public String toString() {
		return "MesHumanDTO [emp_id=" + emp_id + ", emp_name=" + emp_name + ", emp_hp=" + emp_hp + ", emp_add="
				+ emp_add + ", emp_hiredate=" + emp_hiredate + ", dept_id=" + dept_id + ", dept_name0=" + dept_name0
				+ ", po_id=" + po_id + ", po_name0=" + po_name0 + ", po_name=" + po_name + ", dept_name=" + dept_name
				+ ", getEmp_hiredate()=" + getEmp_hiredate() + ", getPo_name()=" + getPo_name() + ", getDept_name()="
				+ getDept_name() + ", getEmp_id()=" + getEmp_id() + ", getEmp_name()=" + getEmp_name()
				+ ", getEmp_hp()=" + getEmp_hp() + ", getEmp_add()=" + getEmp_add() + ", getDept_id()=" + getDept_id()
				+ ", getDept_name0()=" + getDept_name0() + ", getPo_id()=" + getPo_id() + ", getPo_name0()="
				+ getPo_name0() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
}
