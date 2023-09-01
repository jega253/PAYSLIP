package payslip.geons.service;

public class Singlton {

	static Singlton singlton;
	
	private Singlton() {}
	
	public static  synchronized Singlton getSinglton() {
		if(singlton==null) {
			singlton = new Singlton();
		}
		return singlton;
	}
	
	public void dummy() {
		System.out.println(singlton.hashCode());
	}
}
