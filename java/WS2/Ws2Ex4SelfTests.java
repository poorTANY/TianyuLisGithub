import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Exercises 4 of MSc Software Workshop Worksheet 2
 *  test the Emplyee class. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-13
 */

public class Ws2Ex4SelfTests {

	private Employee emp1;
    private double precision =0.0000001;
	
	@Before
	public void setUp() {
		emp1 = new Employee("Tianyu", 8.5, 10);
               
	}
	
	
	@Test
	public void test1() {
	
		emp1.setName("Tianyu Li");
		emp1.setHourlySalary(9.5);
		emp1.setNumberOfHours(20);
		
		assertEquals("Tianyu Li",emp1.getName());
		assertEquals(9.5,emp1.getHourlySalary(),precision);
		assertEquals(20,emp1.getNumberOfHours());
	}

	
	@Test
	public void test2() {
	
		emp1.setHourlySalary(10.5);
		emp1.setNumberOfHours(15);
		
		assertEquals(157.5, emp1.monthlySalary(),precision);
	}

	@Test
	public void test3() {
	
		emp1.setHourlySalary(10.5);
		emp1.setNumberOfHours(15);
		
		assertEquals(157.5, emp1.monthlySalary(),precision);
	
		emp1.increaseSalary(5.5);
	
		assertEquals(166.1625, emp1.monthlySalary(),precision);
	
	}
	@Test
	public void test4() {
	
		emp1.setHourlySalary(10.5);
		emp1.setNumberOfHours(20);
		
		emp1.increaseSalary(5.5);
		emp1.increaseSalary(10.5);
		assertEquals(244.81275, emp1.monthlySalary(), 10*precision);
	}
}
