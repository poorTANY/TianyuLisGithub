package auction;

import java.util.Vector;

import javax.swing.table.AbstractTableModel;

class SellerTable extends AbstractTableModel {

	private static final long serialVersionUID = 1L;

	private Vector content = null;

	private String[] title_name = { "ID", "Name", "Time Remaining", "Bidder", "Current price", "Fix price", "Status" };

	/**
	 * constructor of market tab table
	 */
	public SellerTable() {
		content = new Vector();
	}

	/**
	 * constructor of market tab table with arguments
	 * 
	 * @param count
	 */
	public SellerTable(int count) {
		content = new Vector(count);
	}

	/**
	 * add row with information in arguments
	 * 
	 * @param id
	 * @param name
	 * @param time_left
	 * @param seller
	 * @param current_price
	 * @param fix_price
	 * @param status
	 */
	public void addRow(String id, String name, String time_left, String seller, String current_price, String fix_price,
			String status) {
		Vector v = new Vector(6);
		v.add(0, id);
		v.add(1, name);
		v.add(2, time_left);
		v.add(3, seller);
		v.add(4, current_price);
		v.add(5, fix_price);
		v.add(6, status);
		content.add(v);
	}

	/**
	 * remove row in table
	 * 
	 * @param row
	 */
	public void removeRow(int row) {
		content.remove(row);
	}

	/**
	 * clean the count rows in table
	 * 
	 * @param row
	 * @param count
	 */
	public void removeRows(int row, int count) {
		for (int i = 0; i < count; i++) {
			if (content.size() > row) {
				content.remove(row);
			}
		}
	}

	/**
	 * need setValueAt(Object value, int row, int col)
	 */
	public boolean isCellEditable(int rowIndex, int columnIndex) {
		return false;
	}

	public void setValueAt(Object value, int row, int col) {
		((Vector) content.get(row)).remove(col);
		((Vector) content.get(row)).add(col, value);
		this.fireTableCellUpdated(row, col);
	}

	public String getColumnName(int col) {
		return title_name[col];
	}

	public int getColumnCount() {
		return title_name.length;
	}

	public int getRowCount() {
		return content.size();
	}

	public Object getValueAt(int row, int col) {
		return ((Vector) content.get(row)).get(col);
	}

	/**
	 * return data type
	 */
	public Class getColumnClass(int col) {
		return getValueAt(0, col).getClass();
	}
}
