
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Exercises 5 of MSc Software Workshop Worksheet 2
 *  test the Fraction class. 
 *  
 *  @author  Tianyu Li
 *  @num.    1568785
 *  @ID      txl486
 *  @email   405815927@qq.com
 *  @date    2015-10-13
 */

public class Ws2Ex5SelfTests {

	private Fraction f1, f2;

	@Before
	public void setUp() {
		f1 = new Fraction(1, 9);
		f2 = new Fraction(5, 8);
	}

	@Test
	public void test1() {

		assertEquals(1, f1.getNumerator());
		assertEquals(9, f1.getDenominator());
		assertEquals("1/9", f1.toString());
	}

	@Test
	public void test2() {

		// expected fraction when f1 and f2 are summed
		Fraction expected = new Fraction(53, 72);
		
		Fraction actual = f1.add(f2);
		
		assertEquals(expected.getNumerator(), actual.getNumerator());
		assertEquals(expected.getDenominator(), actual.getDenominator());
		assertEquals(expected.toString(), actual.toString());
	}

	@Test
	public void test3() {

		// expected fraction when f1 and f2 are multiplied
		Fraction expected = new Fraction(5, 72);

		Fraction actual = f1.multiply(f2);

		assertEquals(expected.getNumerator(), actual.getNumerator());
		assertEquals(expected.getDenominator(), actual.getDenominator());
		assertEquals(expected.toString(), actual.toString());
	}

	@Test
	public void test4() {
		
		assertFalse(f1.greaterEqual(f2));
		assertTrue(f2.greaterEqual(f1));

		assertFalse(f1.multiply(f2).greaterEqual(f1.add(f2)));
	}

}
