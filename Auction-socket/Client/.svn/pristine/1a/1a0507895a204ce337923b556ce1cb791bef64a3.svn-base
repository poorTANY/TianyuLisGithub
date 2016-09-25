package customComponents;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.swing.JButton;

public class CustomButton extends JButton {

	 /**
	 * @author jep537
	 * CustomButton extends the class JButton with all the same functionalities as JButton but with a modified paint
	 * component in order to change the textures used in the GUI.
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Image img;
	
	public CustomButton(String a){
		super(a);
		try{
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			InputStream inputStream = classLoader.getResourceAsStream("lightWoodTexture.jpg");
			img = ImageIO.read(inputStream);
			this.setPreferredSize(new Dimension(100,50));
			this.setBackground(new Color(1,1,1, (float) 0.01));
			this.setFont(new Font("Apple Casual", 1, 12));
			this.setForeground(Color.WHITE);
        } catch(IOException e) {
            System.out.println(e.toString());
        }
	}
	
	public CustomButton(String a , int i){
		super(a);
		try{
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			InputStream inputStream = classLoader.getResourceAsStream("lightWoodTexture.jpg");
			img = ImageIO.read(inputStream);
			this.setPreferredSize(new Dimension(100,50));
			this.setBackground(new Color(1,1,1, (float) 0.01));
			this.setFont(new Font("Apple Casual", 1, i));
			this.setForeground(Color.WHITE);
        } catch(IOException e) {
            System.out.println(e.toString());
        }
		
	}
	
	 @Override
	    protected void paintComponent(Graphics g) {
	        g.drawImage(img,0,0,null);
	        super.paintComponent(g);
	    }
}
