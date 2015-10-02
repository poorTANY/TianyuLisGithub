/** Exercises 1 of MSc Software Workshop Worksheet 1
 *  Computes the area of a circle A with its radius. 
 *  
 *  @author  Tianyu Li
 *  @IDnum.  txl486
 *  @date    2015-9-30
 */

import java.util.*;
import java.math.*;

class Ex1 {
	
	public static void main(String[] args) {
		
		double areaA;
		double radius;
		
		//initialize the variable radius
		if (args.length == 0) {radius = 5.0;}
		else {radius = Double.parseDouble(args[0]);}
		
		//calculate the area
		areaA = Math.PI * radius * radius;
		
		//output
		System.out.println("");
		System.out.println("In this case, the radius equals to: " + radius);
		System.out.println("The area of A (Pie times radius squared) is: " + areaA);
		System.out.println("");
		
	}
	
}
