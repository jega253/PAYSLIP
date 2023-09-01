package payslip.geons.service;


import java.util.Calendar;

import payslip.geons.dto.CtcForm;

public class PayslipLop {

	public CtcForm lopCalculation(int leave ,int monthlyGross) {
		
		
		double daySal =monthlyGross/30;
		double deduct=leave*daySal;
		
		double monthSal=monthlyGross-deduct;
		
		CtcCalculation calculation = new CtcCalculation(monthSal*12);
		
		CtcForm ctcForm=calculation.ctcCalculation();
		
		
		
		return ctcForm;
	}
	

	    public int main(int year,int month) {

	    	  Calendar calendar = Calendar.getInstance();
		        calendar.set(Calendar.YEAR, year);
		        calendar.set(Calendar.MONTH, month);

		        int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		        return daysInMonth;
	    }
	

}
