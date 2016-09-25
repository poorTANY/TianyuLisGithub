import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Exercises 3 of MSc Software Workshop Worksheet 2
 *  test the Weight class. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-13
 */

public class Ws2Ex3SelfTests {
	
	private Weight w1, w2, w3;
	private double precision = 0.0000001;
	
	@Before
	public void setUp() {
		w1 = new Weight(1000.0);
		w2 = new Weight(3.141595253);
		w3 = new Weight(1024.0);
    }

	@Test
	public void test1() {
		// expected weight in kilograms (for w1)
		double expected = 453.59237;
		
		assertEquals(expected, w1.getKilograms(), precision);
	}

	@Test
	public void test2() {
		// expected weight in kilograms (for w2)
		double expected = 1.425003636;

		assertEquals(expected, w2.getKilograms(), precision);
	}
	
	@Test
	public void test3() {
		// expected weight in kilograms (for w3)
		double expected = 464.47858688;
		
		assertEquals(expected, w3.getKilograms(), precision);
	}
	
	@Test
	public void test4() {

		// expected weight in ounces (for w1)
		double expected = 16000.0;
		
		assertEquals(expected, w1.getOunces(), precision);
	}

	@Test
	public void test5() {

		// expected weight in ounces (for w2)
		double expected = 50.265524048;
		assertEquals(expected, w2.getOunces(), precision);
	}

    @Test
	public void test6() {
		
		// expected weight in ounces (for w3)
    	double expected = 464.47858688;
		
		assertEquals(expected, w3.getKilograms(), precision);
	}

}
