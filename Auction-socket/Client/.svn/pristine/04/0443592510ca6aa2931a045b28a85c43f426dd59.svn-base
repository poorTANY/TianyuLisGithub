package customComponents;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;

import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

/** @author jci574
 * 
 * CustomTable extends the class DefaultTableCellRenderer with all the same functionalities as 
 * DefaultTableCellRenderer but replacing the font and the background and foreground colour 
 * of odd rows.
 */
public class CustomTable extends DefaultTableCellRenderer{

	private static final long serialVersionUID = 1L;

	/** CustomTable is a constructor for the CustomTable class that set the font and 
	 * horizontal alignment for the table.
	 * 
	 */
	public CustomTable() {
		super();
		setHorizontalAlignment(JLabel.LEFT);
		setFont(new Font("Apple Casual", 1, 12));
		
	}

	public Component getTableCellRendererComponent(JTable table, Object value, boolean   isSelected, boolean hasFocus, int row, int column) { 
		Component c = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column); 
		
		// If the row is odd, change the background and foreground colours.
		if (! table.isRowSelected(row)) {
			if(!((row%2) == 0)) {
				c.setBackground(Color.GRAY);
				c.setForeground(Color.WHITE);
			}
			else {
				c.setBackground(table.getBackground());
				c.setForeground(table.getForeground());
			}
		}

		return c; 
	} 

}