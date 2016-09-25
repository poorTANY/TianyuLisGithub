package customComponents;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.swing.JTabbedPane;

/** @author jci574
 * 
 * CustomTabbedPane extends the class JTabbedPane with all the same functionalities as JTabbedPane but 
 * with a modified paint component in order to change the textures used in the GUI.
 *
 */
public class CustomTabbedPane extends JTabbedPane{

	private static final long serialVersionUID = 1L;
	private Image img;

	/** CustomTabbedPane is a constructor for the CustomTabbedPane class. It loads the image to be 
	 * used as the pane background and sets the font and foreground colours.
	 * 
	 */
	public CustomTabbedPane() {
		super();
		try {
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			InputStream inputStream = classLoader.getResourceAsStream("woodTexture.jpg");
			img = ImageIO.read(inputStream);
			this.setBackground(new Color(1,1,1, (float) 0.01));
			this.setFont(new Font("Apple Casual", 1, 12));
			this.setForeground(Color.WHITE);
			
		} catch (IOException e) {
			System.out.println(e.toString());
		}
	}
	
	
	@Override
	protected void paintComponent(Graphics g) {
		g.drawImage(img, 0, 0, null);
		super.paintComponent(g);
	}
}
