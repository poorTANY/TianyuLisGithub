/** Exercises 3 of MSc Software Workshop Worksheet 1
 *  Calculate the balance with interest
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @date    2015-10-1
 *  @github  http://github.com/poorTANY/TianyuLisGithub
 */

import java.util.*;
import java.math.*;

class Ex3 {
	
	public static void main(String[] args) {
		//initialize
		Ex3 ex3 = new Ex3();
		ex3.initialize(args);
		
		//output the answers
		System.out.println("");
		System.out.println("The balance after 1 year is: " + ex3.calculate(1));
		System.out.println("The balance after 2 year is: " + ex3.calculate(2));
		System.out.println("The balance after 3 year is: " + ex3.calculate(3));
		System.out.println("The balance after 4 year is: " + ex3.calculate(4));
		System.out.println("The balance after 5 year is: " + ex3.calculate(5));
		System.out.println("The balance after 500 year is: " + ex3.calculate(500));
		System.out.println("");
		
	}
	
	double interest_rate,capital;
	
	void initialize(String[] args) {
		
		if (args.length >= 2) {
			capital = Double.parseDouble(args[0]);
			interest_rate = Double.parseDouble(args[1]);
		}
		else {
			capital = 100;
			interest_rate = 2.3;
		}
	}
	
	double calculate(double years) {
		double total;
		total = capital * Math.pow((1 + 0.01 * interest_rate) , years);
		return total;
	}
}
