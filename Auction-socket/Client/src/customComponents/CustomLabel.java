package customComponents;

import java.awt.Color;
import java.awt.Font;

import javax.swing.JLabel;

/** @author jci574
 * 
 * CustomLabel extends the class JLabel with all the same functionalities as JLabel but 
 * with a modified font and foreground colour settings. 
 *
 */
public class CustomLabel extends JLabel{
	
	private static final long serialVersionUID = 1L;
	
	/** CustomLabel(String a) is a constructor for the CustomLabel class where the text
	 * is set to the String a.
	 * 
	 * @param a the text to be added to the label as String.
	 */
	public CustomLabel(String a){
		super(a);

		setFont(new Font("Apple Casual", 1, 12));
		setForeground(Color.WHITE);
	}
	
	/** CustomLabel(String a, int size) is a constructor for the CustomLabel class where
	 * the text is set to the String a and the size is set to the int size.
	 * 
	 * @param a the text to be added to the label as String.
	 * @param size the size to set the label to.
	 */
	public CustomLabel(String a, int size){
		super(a);
		
		setFont(new Font("Apple Casual", 1, size));
		setForeground(Color.WHITE);
	}

}
