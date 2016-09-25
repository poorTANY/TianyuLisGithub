package auction;

import java.awt.Color;
import java.net.Socket;
import java.util.Observable;
import java.util.Observer;

import javax.swing.BorderFactory;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.SwingWorker;
import javax.swing.table.TableColumnModel;

import customComponents.CustomButton;
import customComponents.CustomHeader;
import customComponents.CustomLabel;
import customComponents.CustomPanel;
import customComponents.CustomTable;
import customComponents.CustomTextArea;
import logIn.logIn;

public class MarketTab extends CustomPanel implements Observer {

	/**
	 * model of market tab
	 */
	private static final long serialVersionUID = 1L;

	private JTable table = null;
	private JScrollPane s_pan = null;

	private CustomButton button_1 = null, button_2 = null, button_3 = null;
	private CustomButton button_bid = null;
	private CustomButton button_getIt = null;
	private CustomButton button_search = null;
	private CustomTextArea text_bid = new CustomTextArea();
	private CustomTextArea text_search = new CustomTextArea();
	private CustomLabel money = new CustomLabel("");
	private CustomLabel moneyLabel = new CustomLabel("Money :");

	MarketTable tableModel = null;
	MarketModel model;

	/**
	 * constructor to create the GUI of market tab
	 * 
	 * @param socket
	 */
	public MarketTab(Socket socket) {

		tableModel = new MarketTable();
		table = new JTable(tableModel);

		MarketModel model = new MarketModel(socket, table, tableModel);
		this.model = model;
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		button_1 = new CustomButton("clean");
		button_1.addActionListener(ae -> {
			model.cleanItems();
		});

		button_3 = new CustomButton("Refresh");
		button_3.addActionListener(ae -> {
			disable(button_3);
			model.search("");
			money.setText(model.updateMoney());
		});

		button_bid = new CustomButton("Bid");
		button_bid.addActionListener(ae -> {
			if (table.getSelectedRow() == -1)
				JOptionPane.showMessageDialog(null, "Please select an item", "alert", JOptionPane.INFORMATION_MESSAGE);
			else
				model.bid(table.getValueAt(table.getSelectedRow(), 0).toString(), text_bid.getText());
			money.setText(model.updateMoney());
		});

		button_getIt = new CustomButton("Get it");
		button_getIt.addActionListener(ae -> {
			if (table.getSelectedRow() == -1)
				JOptionPane.showMessageDialog(null, "Please select an item", "alert", JOptionPane.INFORMATION_MESSAGE);
			else
				model.bid(table.getValueAt(table.getSelectedRow(), 0).toString(),
						table.getValueAt(table.getSelectedRow(), 5).toString());
			money.setText(model.updateMoney());
		});

		button_search = new CustomButton("Search");
		button_search.addActionListener(ae -> {
			model.search(text_search.getText());
		});

		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		setTableFormatting(table);
        TableColumnModel tcm = table.getColumnModel();
        
        tcm.getColumn(0).setPreferredWidth(100);
        tcm.getColumn(1).setPreferredWidth(220);
        tcm.getColumn(2).setPreferredWidth(170);
        tcm.getColumn(3).setPreferredWidth(170);
        tcm.getColumn(4).setPreferredWidth(150);
        tcm.getColumn(5).setPreferredWidth(150);

		s_pan = new JScrollPane(table);

		this.setLayout(null);

		add(button_3);
		button_1.setBounds(340, 20, 100, 35);
		button_3.setBounds(880, 492, 100, 35);

		moneyLabel.setBounds(10, 500, 80, 20);
		money.setBounds(90, 500, 80, 20);

		money.setText(logIn.user.getCoins() + "");

		add(money);
		add(moneyLabel);

		// bid part
		add(text_bid);
		add(button_bid);
		// add(button_getIt);
		button_bid.setBounds(760, 492, 100, 35);
		button_getIt.setBounds(650, 492, 100, 35);
		text_bid.setBounds(640, 500, 100, 20);
		text_bid.setBorder(BorderFactory.createLineBorder(Color.black, 1));

		// search part
		add(text_search);
		add(button_search);
		text_search.setBounds(10, 45, 100, 20);
		text_search.setBorder(BorderFactory.createLineBorder(Color.black, 1));
		button_search.setBounds(120, 40, 100, 35);

		add(s_pan);
		s_pan.setBounds(10, 80, 970, 400);

		// add content
		model.search("");

	}

	private void setTableFormatting(JTable table) {

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
	 * disable the CustomButton b
	 * 
	 * @param b
	 */
	static void disable(CustomButton b) {
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
