/** Exercises 1 of MSc Software Workshop Worksheet 2
 *  test the ClubMember class. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-7
 *  @github  http://github.com/poorTANY/TianyuLisGithub
 */

public class Ex1 {
	
	// test all the methods in class ClubMember
	public static void main( String[] args ) {
		
		//define an object and initialize
		ClubMember cb = new ClubMember( "Tianyu", "Lee", 2015 );
		
		//test getters of ClubMember and output
		System.out.println("");
		System.out.println(cb.getFirstName());
		System.out.println("");
		System.out.println(cb.getSurname());
		System.out.println("");
		System.out.println(cb.getYearOfJoining());
		System.out.println("");
		//test setter
		cb.setSurname("Li");
		System.out.println(cb.toString());
		System.out.println("");
	}
}