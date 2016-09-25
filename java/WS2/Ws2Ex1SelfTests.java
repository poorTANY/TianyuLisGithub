import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Exercises 1 of MSc Software Workshop Worksheet 2
 *  test the ClubMember class. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-13
 */


// test all the methods in class ClubMember
public class Ws2Ex1SelfTests {
	
	//define an object and initialize
	private ClubMember cb,cb1,cb2,cb3,cb4;
	
	@Before
	public void setUp() {
		cb = new ClubMember( "Tany", "Lee", 2015 );
	}
	
	@Test
	public void test1() {
	
		cb.setFirstName("Tianyu");
	
		assertEquals("Tianyu",cb.getFirstName());
		assertEquals("Lee",cb.getSurname());
		assertEquals(2015,cb.getYearOfJoining());
	}
	
	@Test
	public void test2() {
		
		cb.setSurname("Li");
		
		assertEquals("Tany",cb.getFirstName());
		assertEquals("Li",cb.getSurname());
		assertEquals(2015,cb.getYearOfJoining());
	}
	
	@Test
	public void test3() {
		
		cb.setYearOfJoining(2010);
		
		assertEquals("Tany",cb.getFirstName());
		assertEquals("Lee",cb.getSurname());
		assertEquals(2010,cb.getYearOfJoining());
	}
	
	@Test
	public void test4() {
		cb.setFirstName("Tany");
		cb.setSurname("Lee");
		cb.setYearOfJoining(1999);
		
		assertEquals("Tany",cb.getFirstName());
		assertEquals("Lee",cb.getSurname());
		assertEquals(1999,cb.getYearOfJoining());
	}
	
	@Test
	public void test5() {
		
		cb1 = new ClubMember("Tianyu", "Li", 2010);
		cb2 = new ClubMember ("Tany","Lee",2015);
		cb3 = new ClubMember("Tianyu","Li",1996);
		cb4 = new ClubMember("Tany","Lee",1995);
			
		assertFalse(cb.equals(cb1));
		assertTrue(cb.equals(cb2));
		assertFalse(cb.equals(cb3));
		assertFalse(cb.equals(cb4));
	}
		
	
}