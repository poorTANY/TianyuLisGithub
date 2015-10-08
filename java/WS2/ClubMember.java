/** Exercises 1 of MSc Software Workshop Worksheet 2
 *  Define a ClubMember class. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-7
 *  @github  http://github.com/poorTANY/TianyuLisGithub
 */

public class ClubMember {
	
	// define parameters
	private String firstname;
	private String surname;
	private int    yearOfJoining;
	
	
	// class ClubMember's contructor
	// use values to initialize the parameters
	public ClubMember(String firstname,
	                  String surname,
	                  int    yearOfJoining) {
		
		this.firstname     = firstname;
		this.surname       = surname;
		this.yearOfJoining = yearOfJoining;
	}
	
	
	// getters for each parameters
	public String getFirstName() {
		return firstname;
	}
	
	public String getSurname() {
		return surname;
	}
	
	public String getYearOfJoining() {
		return "" + yearOfJoining;
	}
	
	public void setSurname( String newSurname ) {
		this.surname = newSurname;
	}
	
	
	// for output in a user friendly way
	// transfer into a String in a format
	public String toString() {
		return "Student name: " + firstname + ' ' 
		                        + surname + "\nYear of joining: " 
		                        + yearOfJoining;
	}
	
}
