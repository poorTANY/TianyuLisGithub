/** Exercises 1 of MSc Software Workshop Worksheet 2
 *  Define a ClubMember class. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-12
 */

public class ClubMember {
	
	// define parameters
	private String firstname;
	private String surname;
	private int    yearOfJoining;
	
	
	// class ClubMember's contructor for a club member created
	// use values to initialize the parameters
	/** ClubMember is a constructor 
	 *  @param  firstname: the first name as String
	 *  @param  surname: the surname as String
	 *  @param  yearOfJoining: the year of joining as int
	 */
	public ClubMember(String firstname,
	                  String surname,
	                  int    yearOfJoining) {
		
		this.firstname     = firstname;
		this.surname       = surname;
		this.yearOfJoining = yearOfJoining;
	}
	
	
	// getters for parameters
	// methods to get the parts of a ClubMember,
	// so called accessor methods.
	/** 
	 *  @return the first name of a ClubMember as String
	 */
	public String getFirstName() {
		return firstname;
	}
	
	/** 
	 *  @return the surname of a ClubMember as String
	 */
	public String getSurname() {
		return surname;
	}
	
	/** 
	 *  @return the year of joining of a ClubMember as int
	 */
	public int getYearOfJoining() {
		return yearOfJoining;
	}
	
	
	// setters for parameters
	// methods to set the parts of a ClubMember,
	// so called setters.
	/**
	 *  sets the first name of a ClubMember 
	 *  @param newFirstname: the new first name of the club member
	 */
	public void setFirstName( String newFirstName ) {
		this.firstname = newFirstName;
	}
	
	/**
	 *  sets the surname of a ClubMember 
	 *  @param newSurname: the new surname of the club member
	 */
	public void setSurname( String newSurname ) {
		this.surname = newSurname;
	}
	
	/**
	 *  sets the year of joining of a ClubMember 
	 *  @param newYearOfJoining: the new year of joining of the club member
	 */
	public void setYearOfJoining( int newYearOfJoining ) {
		this.yearOfJoining = newYearOfJoining;
	}
	
	
	// for output in a user friendly way
	// transfer into a String in a format
	/** toString defines how to print a ClubMember
	 *  
	 *  @return the print type of a club member
	 */
	public String toString() {
		return "Student name: " + firstname + ' ' 
		                        + surname + "\nYear of joining: " 
		                        + yearOfJoining;
	}
	
	
	/** equals defines how to print a ClubMember
	 *  
	 *  @param  anotherMember: another ClubMember
	 *  @return whether another ClubMember is same as this ClubMember
	 */
	public boolean equals( ClubMember anotherMember ) {
		return this.toString().equals( anotherMember.toString() );
	}
}
