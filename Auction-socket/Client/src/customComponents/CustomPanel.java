package customComponents;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.GridLayout;
import java.awt.Image;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.swing.JPanel;

public class CustomPanel extends JPanel {

	/**
	* @author jep537
	* CustomPanel extends the class JButton with all the same functionalities as JButton but with a modified paint
	* component in order to change the textures used in the GUI.
	*/
	private static final long serialVersionUID = 1L;
	private Image img;

	public CustomPanel() {
		super();
		try {
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			InputStream inputStream = classLoader.getResourceAsStream("woodTexture.jpg");
			img = ImageIO.read(inputStream);
			this.setBackground(new Color(1,1,1, (float) 0.01));
		} catch (IOException e) {
			System.out.println(e.toString());
		}
	}
	
	public CustomPanel(GridLayout g){
		super(g);
		try {
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			InputStream inputStream = classLoader.getResourceAsStream("woodTexture.jpg");
			img = ImageIO.read(inputStream);
			this.setBackground(new Color(1,1,1, (float) 0.01));
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
