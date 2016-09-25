package auction;

import java.net.Socket;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.SwingWorker;

import customComponents.CustomButton;
import customComponents.CustomHeader;
import customComponents.CustomPanel;
import customComponents.CustomTable;

public class BidListTab extends CustomPanel implements Observer {

	/**
	 * GUI of bidlist tab
	 */
	private static final long serialVersionUID = 1L;

	private JTable table = null;
	private JScrollPane s_pan = null;
	private CustomButton button_refresh = null;
	BidListTable tableModel = null;

	/**
	 * constructor of GUI of bid list tab
	 * 
	 * @param socket
	 */
	public BidListTab(Socket socket) {

		tableModel = new BidListTable();
		table = new JTable(tableModel);

		BidListModel model = new BidListModel(socket, table, tableModel);
		// this.model = model;

		// table.setBackground(Color.white);
		setHorizontalAlignment(table);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		// TableColumnModel tcm = table.getColumnModel();

		s_pan = new JScrollPane(table);

		this.setLayout(null);

		button_refresh = new CustomButton("Refresh", 12);
		button_refresh.setBounds(650, 460, 120, 31);
		button_refresh.addActionListener(ae -> {
			disable(button_refresh);
			model.refresh();
		});

		add(s_pan);
		s_pan.setBounds(10, 50, 760, 400);

		// add content
		add(button_refresh);

		model.refresh();
	}

	/**
	 * set Horizontal Alignment for the table
	 * 
	 * @param table
	 */
	private void setHorizontalAlignment(JTable table) {

		CustomTable customTable = new CustomTable();
		table.setDefaultRenderer(Object.class, customTable);
		table.getTableHeader().setReorderingAllowed(false);
		table.getTableHeader().setResizingAllowed(false);
		table.getTableHeader().setDefaultRenderer(new CustomHeader());

	}

	@Override
	public void update(Observable o, Object arg) {

	}

	/**
	 * disable the jbutton b
	 * 
	 * @param b
	 */
	static void disable(JButton b) {
		b.setEnabled(false);
		new SwingWorker<Object, Object>() {
			@Override
			protected Object doInBackground() throws Exception {
				Thread.sleep(5000);
				return null;
			}

			@Override
			protected void done() {
				b.setEnabled(true);
			}
		}.execute();
	}

}
