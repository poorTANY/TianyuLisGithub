/** Exercises 4 of MSc Software Workshop Worksheet 1
 *  Calculate the addition and multiplication
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-1
 *  @github  http://github.com/poorTANY/TianyuLisGithub
 */

import java.util.*;
import java.math.*;

class Ex4 {
	
	public static void main(String[] args) {
		
		//initialize
		Ex4 ex4 = new Ex4();
		if (args.length == 0 || args.length == 4) ex4.initialize(args);
		else {
			System.out.println("");
			System.out.println("parameter error");
			System.out.println("");
			return ;
		}
		
		ex4.calculate();
		ex4.print();
	}
	
	
	int e1,d1,e2,d2;
	int es,ds,ep,dp;
	
	int gcd(int a, int b) {
	        if (a%b == 0) return b;
	        return gcd(b , a%b);
	}
	
	void initialize(String[] args) {
		
		if (args.length == 0) {
			e1 = 1; d1 = 2; e2 = 1; d2 = 3;
			//e1 = 1; d1 = 3; e2 = 3; d2 = 4;
		}
		else {
			e1 = Integer.parseInt(args[0]);
			d1 = Integer.parseInt(args[1]);
			e2 = Integer.parseInt(args[2]);
			d2 = Integer.parseInt(args[3]);
		}
	}
	
	void calculate() {
		es = e1 * d2 + e2 * d1;
		ds = d1 * d2;
		ep = e1 * e2;
		dp = ds;
		
		//reduction
		int gcd1,gcd2;
		gcd1 = gcd(es , ds);
		gcd2 = gcd(ep , dp);
				
		es /= gcd1;
		ds /= gcd1;
		ep /= gcd2;
		dp /= gcd2;
					
	}
	
	void print() {
		System.out.println("");
		System.out.println("two fractions: ");
		System.out.println("" + e1 + '/' + d1 + " and " + e2 + '/' + d2);
		System.out.println("");
		System.out.println("sum of these fractions: " + es + '/' + ds);
		System.out.println("multiplication of these fractions: " + ep + '/' + dp);
		System.out.println("");
	}
}
