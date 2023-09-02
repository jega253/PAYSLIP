package payslip.geons.dto;

public class CtcForm {
	
	private double ctc;
	
	private double Basic;
	private double HouseRentAllowance;
	private double OtherAllowance;
	private double TotalGrossSalaryComponentsA;
	private double TotalGrossSalaryComponentsAMonth;
	
	private double EmployersContributionToPF;
	private double EmployersContributionToESI;
	private double TotalComponentsB;
	private double EmployeesContributionToPF;
	private double EmployeesContributionToESI;
	private double AB;
	private double TotalDeductionC;
	private double TotalNetSalaryAC;
	
	private String empid;
	
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public double getCtc() {
		return ctc;
	}
	public void setCtc(double ctc) {
		
		this.ctc = Math.round(ctc);
	}
	
	public double getTotalGrossSalaryComponentsAMonth() {
		return TotalGrossSalaryComponentsAMonth;
	}
	public void setTotalGrossSalaryComponentsAMonth(double totalGrossSalaryComponentsAMonth) {
		TotalGrossSalaryComponentsAMonth = Math.round(totalGrossSalaryComponentsAMonth);
	}
	public double getBasic() {
		return Basic;
	}
	public void setBasic(double basic) {
		Basic = Math.round(basic);
	}
	public double getHouseRentAllowance() {
		return HouseRentAllowance;
	}
	public void setHouseRentAllowance(double houseRentAllowance) {
		HouseRentAllowance = Math.round(houseRentAllowance);
	}
	public double getOtherAllowance() {
		return OtherAllowance;
	}
	public void setOtherAllowance(double otherAllowance) {
		OtherAllowance = Math.round(otherAllowance);
	}
	public double getTotalGrossSalaryComponentsA() {
		return TotalGrossSalaryComponentsA;
	}
	public void setTotalGrossSalaryComponentsA(double totalGrossSalaryComponentsA) {
		TotalGrossSalaryComponentsA = Math.round(totalGrossSalaryComponentsA);
	}
	public double getTotalComponentsB() {
		return TotalComponentsB;
	}
	public void setTotalComponentsB(double totalComponentsB) {
		TotalComponentsB = Math.round(totalComponentsB);
	}
	public double getAB() {
		return AB;
	}
	public void setAB(double aB) {
		AB = Math.round(aB);
	}
	public double getTotalDeductionC() {
		return TotalDeductionC;
	}
	public void setTotalDeductionC(double totalDeductionC) {
		TotalDeductionC = Math.round(totalDeductionC);
	}
	public double getTotalNetSalaryAC() {
		return TotalNetSalaryAC;
	}
	public void setTotalNetSalaryAC(double totalNetSalaryAC) {
		TotalNetSalaryAC = Math.round(totalNetSalaryAC);
	}
	public double getEmployersContributionToPF() {
		return EmployersContributionToPF;
	}
	public void setEmployersContributionToPF(double employersContributionToPF) {
		EmployersContributionToPF = Math.round(employersContributionToPF);
	}
	public double getEmployersContributionToESI() {
		return EmployersContributionToESI;
	}
	public void setEmployersContributionToESI(double employersContributionToESI) {
		EmployersContributionToESI = Math.round(employersContributionToESI);
	}
	public double getEmployeesContributionToPF() {
		return EmployeesContributionToPF;
	}
	public void setEmployeesContributionToPF(double employeesContributionToPF) {
		EmployeesContributionToPF = Math.round(employeesContributionToPF);
	}
	public double getEmployeesContributionToESI() {
		return EmployeesContributionToESI;
	}
	public void setEmployeesContributionToESI(double employeesContributionToESI) {
		EmployeesContributionToESI = Math.round(employeesContributionToESI);
	}
	@Override
	public String toString() {
		return "CtcForm [ctc=" + ctc + ", Basic=" + Basic + ", HouseRentAllowance=" + HouseRentAllowance
				+ ", OtherAllowance=" + OtherAllowance + ", TotalGrossSalaryComponentsA=" + TotalGrossSalaryComponentsA
				+ ", TotalGrossSalaryComponentsAMonth=" + TotalGrossSalaryComponentsAMonth
				+ ", EmployersContributionToPF=" + EmployersContributionToPF + ", EmployersContributionToESI="
				+ EmployersContributionToESI + ", TotalComponentsB=" + TotalComponentsB + ", EmployeesContributionToPF="
				+ EmployeesContributionToPF + ", EmployeesContributionToESI=" + EmployeesContributionToESI + ", AB="
				+ AB + ", TotalDeductionC=" + TotalDeductionC + ", TotalNetSalaryAC=" + TotalNetSalaryAC + "]";
	}
	
	
	
	
}