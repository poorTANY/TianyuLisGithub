package customComponents;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.Image;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableColumnModel;

public class CustomHeader extends DefaultTableCellRenderer {
	
	/** @author jci574
	 * 
	 *  CustomHeader extends the class DefaultTableCellRenderer with all the same functionalities as 
	 *  DefaultTableCellRenderer but replacing the cell contents with JLabels with image icons to 
	 *  give a textured background for the header. It also sets some basic table formatting.
	 *  
	 */
	private static final long serialVersionUID = 1L;
	private CustomLabel label;
	private ImageIcon icon;
	private Image img; 

	/** CustomHeader is a constructor for the CustomHeader class which loads the image to be used as 
	 * an icon.
	 */
	public CustomHeader(){
		try{
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			InputStream inputStream = classLoader.getResourceAsStream("lightWoodTexture.jpg");
			img = ImageIO.read(inputStream);
			
        } catch(IOException e) {
            System.out.println(e.toString());
        }
	}
	

	public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected,
			boolean hasFocus, int row, int column) {
		Component c = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
		
		// Stop the user from being able to reorder or resize table columns.
		table.getTableHeader().setReorderingAllowed(false);
		table.getTableHeader().setResizingAllowed(false);
		
		// Get the width and height of the header cells.
		TableColumnModel tcm = table.getColumnModel();
		int height = table.getRowHeight();
		int width = tcm.getColumn(column).getWidth();
		
		// Scale the icon image to the size of the header cells.
		Image scaledImg = img.getScaledInstance(width, height,
		        Image.SCALE_SMOOTH);
		
		icon = new ImageIcon(scaledImg);
		
		// Set the size of the label to the size of the header cells.
		Dimension dimension = new Dimension(width, height);
		label = new CustomLabel((String) value);
		label.setHorizontalTextPosition(JLabel.CENTER);
		label.setIcon(icon);
		label.setPreferredSize(dimension);
		label.setMaximumSize(dimension);
		label.setMinimumSize(dimension);

		return label;
	}
}