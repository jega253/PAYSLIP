package payslip.geons.dto;

public class Payroll {

	private int payrollid;
	private Employee employee;
	private String empid;
	private String period;
	private double credited;
	
	
	public double getCredited() {
		return credited;
	}
	public void setCredited(double credited) {
		this.credited = credited;
	}
	private boolean payslipSent;
		
	
	public boolean isPayslipSent() {
		return payslipSent;
	}
	public void setPayslipSent(boolean payslipSent) {
		this.payslipSent = payslipSent;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public int getPayrollid() {
		return payrollid;
	}
	public void setPayrollid(int payrollid) {
		this.payrollid = payrollid;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}

	
	@Override
	public String toString() {
		return "Payroll [payrollid=" + payrollid + ", employee=" + employee + ", empid=" + empid + ", period=" + period
				+  ", payslipSent=" + payslipSent + "]";
	}
	public Payroll generatepayroll(Employee employee) {
		return this;
	}
	
}
