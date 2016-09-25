package customComponents;

import java.awt.Color;
import java.awt.Font;

import javax.swing.BorderFactory;
import javax.swing.JPasswordField;

/** @author jci574
 * 
 *  CustomPasswordField extends the class JPasswordField with all the same functionalities as 
 *  JPasswordField but with a modified border, background colour, foreground colour and font. 
 *
 */
public class CustomPasswordField extends JPasswordField{
	
	private static final long serialVersionUID = 1L;
	
	/** CustomPasswordField(String a, int b) is a constructor for the CustomPasswordField class 
	 * where the text is set to the String a and the size is set to the int b.
	 * 
	 * @param a the text to be added to the label as String.
	 * @param b the size to set the label to.
	 */
	public CustomPasswordField(String a, int b){
		super(a, b);
		setBorder(BorderFactory.createLineBorder(Color.black,1));
		setBackground(Color.WHITE);
		setFont(new Font("Apple Casual", 1, 12));
		setForeground(Color.BLACK);
	}
	
	/** CustomPasswordField() is a constructor for the CustomPasswordField class where the
	 * test is set to null. 
	 */
	public CustomPasswordField(){
		
		setBorder(BorderFactory.createLineBorder(Color.black,1));
		setBackground(Color.WHITE);
		setFont(new Font("Apple Casual", 1, 12));
		setForeground(Color.BLACK);
	}

}
