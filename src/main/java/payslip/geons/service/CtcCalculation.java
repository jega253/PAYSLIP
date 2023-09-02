package payslip.geons.service;


import payslip.geons.dto.CtcForm;

public class CtcCalculation {
	private final int basic = 75;
	private final int hra = 19;
	private final int otherAllow = 6;
	private double ctc;

	public CtcCalculation(double ctc) {
		
		this.ctc = ctc;
	}
	
	public CtcForm ctcCalculation() {
		
		if(this.ctc<=180000) {
			return basci();
		}else if(this.ctc>=180012&&this.ctc<=251988) {
			return restricted();
		}else {
			return breakup();
		}
	}



	public CtcForm basci() {
       CtcForm ctcc = new CtcForm();
       ctcc.setCtc(this.ctc);
		
		double annualBasic = (basic / 100.0) * ctc;
		ctcc.setBasic(annualBasic);
		double annualhouseRentAllowance = (hra / 100.0) * ctc;
		ctcc.setHouseRentAllowance(annualhouseRentAllowance);
		double annualotherAllowance = (otherAllow / 100.0) * ctc;
		ctcc.setOtherAllowance(annualotherAllowance);
		double monthBasic = annualBasic / 12;
		double monthhouseRentAllowance = annualhouseRentAllowance / 12;
		double monthotherAllowance = annualotherAllowance / 12;

		double annualtotalGrossSalaryComponents = (annualBasic + annualhouseRentAllowance + annualotherAllowance);
		ctcc.setTotalGrossSalaryComponentsA(annualtotalGrossSalaryComponents);
		double monthlytotalGrossSalaryComponents = (monthBasic + monthhouseRentAllowance + monthotherAllowance);
		
		ctcc.setTotalGrossSalaryComponentsAMonth(monthlytotalGrossSalaryComponents);
		
		double annualemployerContributiontoPF =  (12/100.0)*annualBasic;
		ctcc.setEmployersContributionToPF(annualemployerContributiontoPF);
		
		double annualEmployerContributiontoESI = ((monthlytotalGrossSalaryComponents * 12) * (3.25 / 100));
		ctcc.setEmployersContributionToESI(annualEmployerContributiontoESI);
		
		
		
		double totalComponentsB = annualEmployerContributiontoESI+annualemployerContributiontoPF;
		ctcc.setTotalComponentsB(totalComponentsB);
		
		
		double aminusB = annualtotalGrossSalaryComponents-totalComponentsB;
		ctcc.setAB(aminusB);
		
		
		double annualEmployeecontributionToEsi= (monthlytotalGrossSalaryComponents*12)*(0.75/100); 
		ctcc.setEmployeesContributionToESI(annualEmployeecontributionToEsi);
		
		
	    double annualEmployeeContributiontoPF = annualemployerContributiontoPF;
	    ctcc.setEmployeesContributionToPF(annualEmployeeContributiontoPF);
		double totalDeduction = annualEmployeeContributiontoPF+annualEmployeecontributionToEsi;
		ctcc.setTotalDeductionC(totalDeduction);
		
		
		double totalNetSalary= aminusB-totalDeduction;
		ctcc.setTotalNetSalaryAC(totalNetSalary);
		
		return ctcc;
	}
	
	public  CtcForm breakup() {
		 CtcForm  ctcc= new CtcForm();
		 ctcc.setCtc(this.ctc);
		 double annualBasic = (basic / 100.0) * ctc;
		 ctcc.setBasic(annualBasic);
		 double annualhouseRentAllowance = (hra / 100.0) * ctc;
		 ctcc.setHouseRentAllowance(annualhouseRentAllowance);
		 double annualotherAllowance = (otherAllow / 100.0) * ctc;
		 ctcc.setOtherAllowance(annualotherAllowance);
		 double monthBasic = annualBasic / 12;
		 double monthhouseRentAllowance = annualhouseRentAllowance / 12;
		 double monthotherAllowance = annualotherAllowance / 12;

		 double annualtotalGrossSalaryComponents = (annualBasic + annualhouseRentAllowance + annualotherAllowance);
		 ctcc.setTotalGrossSalaryComponentsA(annualtotalGrossSalaryComponents);
		 double monthlytotalGrossSalaryComponents = (monthBasic + monthhouseRentAllowance + monthotherAllowance);
		 ctcc.setTotalGrossSalaryComponentsAMonth(monthlytotalGrossSalaryComponents);
		 double annualemployerContributiontoPF =  21600;
		 ctcc.setEmployersContributionToPF(annualemployerContributiontoPF);

		 double totalComponentsB = annualemployerContributiontoPF;
		 ctcc.setTotalComponentsB(totalComponentsB);

		 double aminusB = annualtotalGrossSalaryComponents-totalComponentsB;
		 ctcc.setAB(aminusB);

		 double annualEmployeeContributiontoPF = annualemployerContributiontoPF;
		    ctcc.setEmployeesContributionToPF(annualEmployeeContributiontoPF);
		  
		 double totalDeduction = annualEmployeeContributiontoPF;
		 ctcc.setTotalDeductionC(totalDeduction);


		 double totalNetSalary= aminusB+totalDeduction;
		 ctcc.setTotalNetSalaryAC(totalNetSalary);
		    
		 return  ctcc;


		
		
	}

	public  CtcForm restricted() {
		CtcForm ctcc = new  CtcForm();
		 ctcc.setCtc(this.ctc);
		double annualBasic = (basic / 100.0) * ctc;
		ctcc.setBasic(annualBasic);
		double annualhouseRentAllowance = (hra / 100.0) * ctc;
		ctcc.setHouseRentAllowance(annualhouseRentAllowance);
		double annualotherAllowance = (otherAllow / 100.0) * ctc;
		ctcc.setOtherAllowance(annualotherAllowance);
		double monthBasic = annualBasic / 12;
		double monthhouseRentAllowance = annualhouseRentAllowance / 12;
		double monthotherAllowance = annualotherAllowance / 12;

		double annualtotalGrossSalaryComponents = (annualBasic + annualhouseRentAllowance + annualotherAllowance);
		ctcc.setTotalGrossSalaryComponentsA(annualtotalGrossSalaryComponents);
		double monthlytotalGrossSalaryComponents = (monthBasic + monthhouseRentAllowance + monthotherAllowance);
		ctcc.setTotalGrossSalaryComponentsAMonth(monthlytotalGrossSalaryComponents);
		
		double annualemployerContributiontoPF =  (12/100.0)*annualBasic;
		ctcc.setEmployersContributionToPF(annualemployerContributiontoPF);
		
			double annualEmployerContributiontoESI = ((monthlytotalGrossSalaryComponents * 12) * (3.25 / 100));
			ctcc.setEmployersContributionToESI(annualEmployerContributiontoESI);
			
			double annualTotalComponentsB=annualEmployerContributiontoESI +annualemployerContributiontoPF ;
			ctcc.setTotalComponentsB(annualTotalComponentsB);
			
			
		    double AnnualAminB=annualtotalGrossSalaryComponents-annualTotalComponentsB ;
		    ctcc.setAB(AnnualAminB);
		    
		    double annualemployeeContributiontoPf =  (12/100.0)*annualBasic;
			ctcc.setEmployeesContributionToPF(annualemployeeContributiontoPf);
			
				double annualEmployeeContributiontoEsi = ((monthlytotalGrossSalaryComponents * 12) * (0.75 / 100));
				ctcc.setEmployeesContributionToESI(annualEmployeeContributiontoEsi);
		
				
		    double annualTotalDeductionC=annualemployeeContributiontoPf+annualEmployeeContributiontoEsi;
		    ctcc.setTotalDeductionC(annualTotalDeductionC);
		    
		    double annualTotalNetSalaryAminC=AnnualAminB -annualTotalDeductionC;
		    ctcc.setTotalNetSalaryAC(annualTotalNetSalaryAminC);
		// TODO Auto-generated method stub
		return ctcc;
	}
}
