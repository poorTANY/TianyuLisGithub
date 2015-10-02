/** Exercises 2 of MSc Software Workshop Worksheet 1
 *  Convert masses into kilograms
 *  
 *  @author  Tianyu Li
 *  @IDnum.  txl486
 *  @date    2015-9-30
 */

import java.util.*;
import java.math.*;

class Ex2 {
	
	public static void main(String[] args) {
		
		//initalize
		Ex2 ex2 = new Ex2();
		if (args.length == 0) ex2.initalize();
		else ex2.read(args , 0);
		
		//all change to pounds
		ex2.AllToPounds();
		//output kilograms
		System.out.println("");
		System.out.println("The masses convert to kilograms are: "+ex2.ToKilograms()+"kg");
		System.out.println("");
	}
	
	//all masses
	double tons,hundredweights,quarters,stones,ounces,drachms,grains,pounds,kilograms;
	
	void initalize() {
		tons = 0;
		hundredweights = 0;
		quarters = 0;
		stones = 11;//0;
		ounces = 0;
		drachms = 0;
		grains = 0;
		pounds = 6;//0;
		kilograms = 0;
	}
	
	void AllToPounds() {
		pounds += tons * 2240;
		pounds += hundredweights * 112;
		pounds += quarters * 28;
		pounds += stones * 14;
		pounds += ounces / 16;
		pounds += drachms / 256;
		pounds += grains / 7000;
	}
	
	double ToKilograms() {
		return 0.45359237 * pounds + kilograms;
	}
	
	//tooooooo~ many~
	void read(String[] args, int i) {
		
		if (args[i+1].equals("tons") || args[i+1].equals("ton")) tons = Double.parseDouble(args[i+0]);
		if (args[i+1].equals("hundredweights") || args[i+1].equals("hundredweight")) hundredweights = Double.parseDouble(args[i+0]);
		if (args[i+1].equals("quarters") || args[i+1].equals("quarter")) quarters = Double.parseDouble(args[i+0]);
		if (args[i+1].equals("stones") || args[i+1].equals("stone")) stones = Double.parseDouble(args[i+0]);
		if (args[i+1].equals("ounces") || args[i+1].equals("ounce")) ounces = Double.parseDouble(args[i+0]);
		if (args[i+1].equals("drachms") || args[i+1].equals("drachm")) drachms = Double.parseDouble(args[i+0]);
		if (args[i+1].equals("grains") || args[i+1].equals("grain")) grains = Double.parseDouble(args[i+0]);
		if (args[i+1].equals("pounds") || args[i+1].equals("pound")) pounds = Double.parseDouble(args[i+0]);
		if (args[i+1].equals("kilograms") || args[i+1].equals("kilogram")) kilograms = Double.parseDouble(args[i+0]);
		
		//How to make recursion in this point? It is not C (no indicator)................
		//if(args.length != 0) read(args + 2);
		
		if(i+2 < args.length) read(args , i+2);
	}
	
}
