/** Exercises 2 of MSc Software Workshop Worksheet 2
 *  Define a Student class. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-12
 */

public class Student {
	
	// define parameters
	private String name;
	private String gender;
	private String studentID;
	private String degreeProgramme;
	
	
	// class Student's constructor for a student created
	// use values to initialize the parameters
	/** ClubMember is a constructor 
	 *  @param  name: the name as String
	 *  @param  gender: the gender as String
	 *  @param  studentID: the student ID as String
	 *  @param  degreeProgramme: the degree programme as String
	 */
	public Student(String name,
		           String gender,
		           String studentID,
		           String degreeProgramme) {
		
		this.name            = name;
		this.gender          = gender;
		this.studentID       = studentID;
		this.degreeProgramme = degreeProgramme;
	}
	
	
	// getters of parameters
	// methods to get the parts of a ClubMember,
	// so called accessor methods.
	/** 
	 *  @return the name of a Student as String
	 */
	public String getName() {
		return name;
	}
	
	/** 
	 *  @return the student ID of a Student as String
	 */
	public String getStudentID() {
		return studentID;
	}
	
	/** 
	 *  @return the gender of a Student as String
	 */
	public String getGender() {
		return gender;
	}
	
	/** 
	 *  @return the degree programme of a Student as String
	 */
	public String getDegreeProgramme() {
		return degreeProgramme;
	}
	
	
	// setters for parameters
	// methods to set the parts of a Student,
	// so called setters.
	/**
	 *  sets the name of a Student 
	 *  @param newname: the new name of the student
	 */
	public void setName( String newName ) {
		this.name = newName;
	}
	
	/**
	 *  sets the student ID of a Student 
	 *  @param newStudentID: the new student ID of the student
	 */
	public void setStudentID( String newStudentID ) {
		this.studentID = newStudentID;
	}
	
	/**
	 *  sets the gender of a Student 
	 *  @param Gender: the gender of the student
	 */
	public void setGender( String Gender ) {
		this.gender = Gender;
	}
	
	/**
	 *  sets the degree programme of a Student 
	 *  @param newDegreeProgramme: the new degree programme of the student
	 */
	public void setDegreeProgramme( String newDegreeProgramme ) {
		this.degreeProgramme = newDegreeProgramme;
	}
	
	
	// for output in a user friendly way
	// transfer into a String in format
	/** toString defines how to print a Student
	 *  
	 *  @return the print type of a student
	 */
	public String toString() {
		
		return "[" + name + ", " 
		           + gender + ", ID: " 
		           + studentID + ", " 
		           + degreeProgramme + "]";
	}
	
	
	/** equals defines how to print a Student
	 *  
	 *  @param  anotherStudent: another Student
	 *  @return whether another Student is same as this Student
	 */
	public boolean equals( Student anotherStudent ) {
		return this.toString().equals( anotherStudent.toString() );	}
	
}
	