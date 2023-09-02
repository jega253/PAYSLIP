package payslip.geons.dto;

public class CtcForm {
	
	
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
	
	public double getTotalGrossSalaryComponentsAMonth() {
		return TotalGrossSalaryComponentsAMonth;
	}
	public void setTotalGrossSalaryComponentsAMonth(double totalGrossSalaryComponentsAMonth) {
		TotalGrossSalaryComponentsAMonth = totalGrossSalaryComponentsAMonth;
	}
	public double getBasic() {
		return Basic;
	}
	public void setBasic(double basic) {
		Basic = basic;
	}
	public double getHouseRentAllowance() {
		return HouseRentAllowance;
	}
	public void setHouseRentAllowance(double houseRentAllowance) {
		HouseRentAllowance = houseRentAllowance;
	}
	public double getOtherAllowance() {
		return OtherAllowance;
	}
	public void setOtherAllowance(double otherAllowance) {
		OtherAllowance = otherAllowance;
	}
	public double getTotalGrossSalaryComponentsA() {
		return TotalGrossSalaryComponentsA;
	}
	public void setTotalGrossSalaryComponentsA(double totalGrossSalaryComponentsA) {
		TotalGrossSalaryComponentsA = totalGrossSalaryComponentsA;
	}
	public double getTotalComponentsB() {
		return TotalComponentsB;
	}
	public void setTotalComponentsB(double totalComponentsB) {
		TotalComponentsB = totalComponentsB;
	}
	public double getAB() {
		return AB;
	}
	public void setAB(double aB) {
		AB = aB;
	}
	public double getTotalDeductionC() {
		return TotalDeductionC;
	}
	public void setTotalDeductionC(double totalDeductionC) {
		TotalDeductionC = totalDeductionC;
	}
	public double getTotalNetSalaryAC() {
		return TotalNetSalaryAC;
	}
	public void setTotalNetSalaryAC(double totalNetSalaryAC) {
		TotalNetSalaryAC = totalNetSalaryAC;
	}
	public double getEmployersContributionToPF() {
		return EmployersContributionToPF;
	}
	public void setEmployersContributionToPF(double employersContributionToPF) {
		EmployersContributionToPF = employersContributionToPF;
	}
	public double getEmployersContributionToESI() {
		return EmployersContributionToESI;
	}
	public void setEmployersContributionToESI(double employersContributionToESI) {
		EmployersContributionToESI = employersContributionToESI;
	}
	public double getEmployeesContributionToPF() {
		return EmployeesContributionToPF;
	}
	public void setEmployeesContributionToPF(double employeesContributionToPF) {
		EmployeesContributionToPF = employeesContributionToPF;
	}
	public double getEmployeesContributionToESI() {
		return EmployeesContributionToESI;
	}
	public void setEmployeesContributionToESI(double employeesContributionToESI) {
		EmployeesContributionToESI = employeesContributionToESI;
	}
	@Override
	public String toString() {
		return "Ctc [Basic=" + Basic + ", HouseRentAllowance=" + HouseRentAllowance + ", OtherAllowance="
				+ OtherAllowance + ", TotalGrossSalaryComponentsA=" + TotalGrossSalaryComponentsA
				+ ", EmployersContributionToPF=" + EmployersContributionToPF + ", EmployersContributionToESI="
				+ EmployersContributionToESI + ", TotalComponentsB=" + TotalComponentsB + ", EmployeesContributionToPF="
				+ EmployeesContributionToPF + ", EmployeesContributionToESI=" + EmployeesContributionToESI + ", AB="
				+ AB + ", TotalDeductionC=" + TotalDeductionC + ", TotalNetSalaryAC=" + TotalNetSalaryAC + "]";
	}
	
	
	
}