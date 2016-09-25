package waitingRoom;

import java.util.Vector;

import javax.swing.table.AbstractTableModel;

class RoomTable extends AbstractTableModel {

	private static final long serialVersionUID = 1L;

	private Vector content = null;

	private String[] title_name = { "ID", "Room name", "Availability", "Number of players", "Owner" };

	/**
	 * constructor
	 */
	public RoomTable() {
		content = new Vector();
	}

	/**
	 * constructor with arguments
	 * 
	 * @param count
	 */
	public RoomTable(int count) {
		content = new Vector(count);
	}

	/**
	 * add row base on arguments
	 * 
	 * @param name
	 * @param availability
	 * @param numberOfPlayers
	 * @param owner
	 */
	public void addRow(String name, String availability, String numberOfPlayers, String owner) {
		Vector v = new Vector(5);
		// v.add(0, new Integer(content.size() + 1));
		v.add(0, Integer.toString((content.size() + 1)));
		v.add(1, name);
		v.add(2, availability);
		v.add(3, numberOfPlayers);
		v.add(4, owner);
		content.add(v);
	}

	/**
	 * remove the row
	 * 
	 * @param row
	 */
	public void removeRow(int row) {
		content.remove(row);
	}

	/**
	 * remove count rows
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
