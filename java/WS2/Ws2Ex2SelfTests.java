import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Exercises 2 of MSc Software Workshop Worksheet 2
 *  test the Student class. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-13
 */

public class Ws2Ex2SelfTests {
	
	// test all the methods in class Student
	
	//define an object and initialize
	private Student s1,s2,s3;
	
	@Before
	public void setUp() {
		
	s1 = new Student("Tany", "male", "1568785", "MSc Computer Science");
	}
	
	
	@Test
	public void test1() {
		
		s1.setName("Tianyu Li");
		s1.setStudentID("0000000");
		
		assertEquals("Tianyu Li",s1.getName());
		assertEquals("0000000",s1.getStudentID());
		assertEquals("MSc Computer Science",s1.getDegreeProgramme());
	}


	@Test
	public void test2() {
		
		s1.setName("Tianyu Li");
		s1.setStudentID("0000000");
		
		assertEquals("Tianyu Li",s1.getName());
		assertEquals("0000000",s1.getStudentID());
		assertEquals("MSc Computer Science",s1.getDegreeProgramme());
	}


	@Test
	public void test3() {
		
		s1.setName("Tianyu Lee");
		s1.setGender("female");
		s1.setStudentID("0000001");;
		s1.setDegreeProgramme("History");
		
		String expected = "[Tianyu Lee, female, ID: 0000001, History]";
		
		assertEquals(expected,s1.toString());	
	}
	
	
	@Test
	public void test4() {
		
		s1.setName("Tianyu Lee");
		s1.setGender("female");
		s1.setStudentID("0000001");;
		s1.setDegreeProgramme("History");
		
		s2 = new Student("Tianyu Li", "male", "1568785", "MSc Computer Science");
		s3 = new Student("Tianyu Lee", "female", "0000001", "History");
		
		assertFalse(s1.equals(s2));
		assertTrue(s1.equals(s3));
	}

}
