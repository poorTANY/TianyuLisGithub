/** Exercises 5 of MSc Software Workshop Worksheet 2
 *  Define a Fraction class for calculate fractions. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-12
 */

public class Fraction {
	
	// define parameters
	private int numerator;
	private int denominator;
	// mathmatic function gcd()
	
	/*
	private int gcd( int a, int b ) {
		if ( a%b == 0 ) return b;
		return gcd( b , a%b );
	}
	*/
	
	// class Fraction's constructor for a Fraction created
	// use values to initialize the parameters
	/** Fraction is a constructor 
	 *  @param  numerator: the numerator as int
	 *  @param  denominator: the hourly denominator as int
	 */
	public Fraction( int numerator, int denominator ) {
		// reduction of the fraction
		//this.numerator   = numerator   / gcd( numerator, denominator );
		//this.denominator = denominator / gcd( numerator, denominator );
		this.numerator   = numerator;
		this.denominator = denominator;
	}
	
	
	// getters of parameters
	// methods to get the parts of a Fraction,
	// so called accessor methods.
	/** 
	 *  @return the numerator of a Fraction as int
	 */
	public int getNumerator() {
		return numerator;
	}
	
	/** 
	 *  @return the denominator of a Fraction as int
	 */
	public int getDenominator() {
		return denominator;
	}
	
	
	// for output in a user friendly way
	// transfer into a String in format
	/** toString defines how to print a Fraction
	 *  
	 *  @return the print type of a Fraction
	 */
	public String toString() {
		return numerator + "/" + denominator;
	}
	
	
	// operators of fractions
	/** add defines how to add up two Fractions
	 *  
	 *  @param  summand: another Fraction
	 *  @return the summary of two Fractions as Fraction
	 */
	public Fraction add( Fraction summand ) {
		return new Fraction( this.numerator * summand.denominator + this.denominator * summand.numerator,
		                     this.denominator * summand.denominator );
	}
	
	/** multiply defines how to multiply two Fractions
	 *  
	 *  @param  factor: another Fraction	
	 *  @return the product of two Fractions as Fraction
	 */
	public Fraction multiply( Fraction factor ) {
		return new Fraction( this.numerator * factor.numerator,
		                     this.denominator * factor.denominator );
	}
	
	
	// comparison
	/** greaterEqual defines how to make comparison
	 *  
	 *  @param  comp: another Fraction for comparison
	 *  @return whether the Fraction is greater than another
	 */
	public boolean greaterEqual( Fraction comp) {
		return this.numerator * comp.denominator >=
		       comp.numerator * this.denominator;
	}
}