/** Exercises 4 of MSc Software Workshop Worksheet 2
 *  Define a Employee class for calculate salary. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-12
 */

public class Employee {
	
	// define parameters
	private String name;
	private double hourlySalary;
	private int    numberOfHours;
	
	
	// class Employee's constructor for a Employee created
	// use values to initialize the parameters
	/** ClubMember is a constructor 
	 *  @param  name: the name as String
	 *  @param  hourlySalary: the hourly salary as double
	 *  @param  numberOfHours: the number of hours as int
	 */
	public Employee( String name,
	                 double hourlySalary,
	                 int    numberOfHours ) {
		
		this.name          = name;
		this.hourlySalary  = hourlySalary;
		this.numberOfHours = numberOfHours;
	}
	
	
	// getters of parameters
	// methods to get the parts of a Employee,
	// so called accessor methods.
	/** 
	 *  @return the name of a Employee as String
	 */
	public String getName() {
		return name;
	}
	
	/** 
	 *  @return the hourly salary of a Employee as double
	 */
	public double getHourlySalary() {
		return hourlySalary;
	}
	
	/** 
	 *  @return the number of hours of a Employee as int
	 */
	public int getNumberOfHours() {
		return numberOfHours;
	}
	
	
	// setters for parameters
	// methods to set the parts of a Student,
	// so called setters.
	/**
	 *  sets the name of a Employee 
	 *  @param name: the new name of the Employee 
	 */
	public void setName( String name ) {
		this.name = name;
	}
	
	/**
	 *  sets the hourly salary of a Employee 
	 *  @param hourlySalary: the new hourly salary of the Employee 
	 */
	public void setHourlySalary( double hourlySalary ) {
		this.hourlySalary = hourlySalary;
	}
	
	/**
	 *  sets the number of hours of a Employee 
	 *  @param numberOfHours: the new number of hours of the Employee 
	 */
	public void setNumberOfHours( int numberOfHours ) {
		this.numberOfHours = numberOfHours;
	}
	
	
	// for output in a user friendly way
	// transfer into a String in format
	/** toString defines how to print a Employee
	 *  
	 *  @return the print type of a Employee
	 */
	public String toString() {
		return "" + name + "\nhourly salary: "
		          + hourlySalary + "\nnumber of hours: "
		          + numberOfHours;
	}
	
	
	// further methods
	/** 
	 *  @return monthly salary of a Employee as double
	 */
	public double monthlySalary() {
		return hourlySalary * numberOfHours;
	}
	
	/**
	 *  increase the salary of a Employee 
	 *  @param percentage: the increase rate of the Employee 
	 */
	public void increaseSalary( double percentage ) {
		hourlySalary *= 1 + percentage * 0.01;
	}
	
}
