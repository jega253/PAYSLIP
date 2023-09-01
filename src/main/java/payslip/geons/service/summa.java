package payslip.geons.service;

import java.io.*;
import javax.servlet.*;

public class summa  {
	public static void main(String[] args) {
		Payslipgen payslipgen = new Payslipgen();
		
		String a=payslipgen.lastnumfind();
		System.out.println(a);
	}
}

