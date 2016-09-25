/** Exercises 3 of MSc Software Workshop Worksheet 2
 *  Define a Weight class to convert masses. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-12
 */

public class Weight {
	
	// define parameters
	private double weightInPounds;
	
	
	// class Weight's constructor for masses
	// use values to initialize the parameters
	/** ClubMember is a constructor 
	 *  @param  pounds: the initial weight of Weight
	 */
	public Weight( double pounds ) {
		weightInPounds = pounds;
	}
	
	
	// getter of the value pounds
	/** 
	 *  @return the weight in pounds as double
	 */
	public double getPounds() {
		return weightInPounds;
	}
	
	
	// 1 pound equals to 0.45359237 kilograms
	/** 
	 *  @return the weight in kilograms as double
	 */
	public double getKilograms() {
		return weightInPounds * 0.45359237;
	}
	
	
	// 1 ounce equals to 1/16 pounds
	/** 
	 *  @return the weight in ounces as double
	 */
	public double getOunces() {
		return weightInPounds * 16;
	}
	
}