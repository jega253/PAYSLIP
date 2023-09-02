package payslip.geons.dto;

import java.io.Serializable;
import java.util.List;

public class Employee implements Serializable {

	private String empid;
	private String fullname;
	private String email;
	private String password;
	private boolean role;
	private String doj;
	private int esi;
	private int pf;
	private int ptax;
	private int hra;
	private long aadhar;
	private String uan;
	private String designation;
	private String department;
	private String genter;
	
	private int cLeave;
	private int pLeave;
	private int sLeave;
	private String pan;
	private boolean payslipSent;
	private List<Payroll> payrollist;
	private String nextnumber;
	
	public String getNextnumber() {
		return nextnumber;
	}
	public void setNextnumber(String nextnumber) {
		this.nextnumber = nextnumber;
	}
	public String getGenter() {
		return genter;
	}
	public void setGenter(String genter) {
		this.genter = genter;
	}
	
	public boolean isPayslipSent() {
		return payslipSent;
	}
	public void setPayslipSent(boolean payslipSent) {
		this.payslipSent = payslipSent;
	}
	
	
	public List<Payroll> getPayrollist() {
		return payrollist;
	}
	public void setPayrollist(List<Payroll> payrollist) {
		this.payrollist = payrollist;
	}
	
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isRole() {
		return role;
	}
	public void setRole(boolean role) {
		this.role = role;
	}
	public int getEsi() {
		return esi;
	}
	public void setEsi(int esi) {
		this.esi = esi;
	}
	public int getPf() {
		return pf;
	}
	public void setPf(int pf) {
		this.pf = pf;
	}
	public int getPtax() {
		return ptax;
	}
	public void setPtax(int ptax) {
		this.ptax = ptax;
	}
	public int getHra() {
		return hra;
	}
	public void setHra(int hra) {
		this.hra = hra;
	}
	public long getAadhar() {
		return aadhar;
	}
	public void setAadhar(long aadhar) {
		this.aadhar = aadhar;
	}
	public String getUan() {
		return uan;
	}
	public void setUan(String uan) {
		this.uan = uan;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getcLeave() {
		return cLeave;
	}
	public void setcLeave(int cLeave) {
		this.cLeave = cLeave;
	}
	public int getpLeave() {
		return pLeave;
	}
	public void setpLeave(int pLeave) {
		this.pLeave = pLeave;
	}
	public int getsLeave() {
		return sLeave;
	}
	public void setsLeave(int sLeave) {
		this.sLeave = sLeave;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	@Override
	public String toString() {
		return "Employee [empid=" + empid + ", fullname=" + fullname + ", email=" + email + ", password=" + password
				+ ", role=" + role + ", doj=" + doj + ", esi=" + esi + ", pf=" + pf + ", ptax=" + ptax + ", hra=" + hra
				+ ", aadhar=" + aadhar + ", uan=" + uan + ", designation=" + designation + ", department=" + department
				+ ", cLeave=" + cLeave + ", pLeave=" + pLeave + ", sLeave=" + sLeave + ", pan=" + pan + ", payrollist="
				+ payrollist + "]";
	}
	
	
	
	
}
