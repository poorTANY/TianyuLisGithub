package auction;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.Observable;
import java.util.concurrent.TimeUnit;

import javax.swing.JOptionPane;
import javax.swing.JTable;

import org.json.JSONArray;
import org.json.JSONObject;

import dependency.*;
import logIn.logIn;

public class MarketModel extends Observable {

	Socket socket = null;
	JTable table = null;
	MarketTable tableModel = null;

	/**
	 * constructor
	 * 
	 * @param socket
	 * @param table
	 * @param tableModel
	 */
	public MarketModel(Socket socket, JTable table, MarketTable tableModel) {
		this.socket = socket;
		this.table = table;
		this.tableModel = tableModel;

	}

	/**
	 * clean all items in table
	 */
	public void cleanItems() {
		tableModel.removeRows(0, tableModel.getRowCount());
		table.updateUI();
	}

	/**
	 * bid the distinct item by the price
	 * 
	 * @param id
	 * @param price
	 */
	public void bid(String id, String price) {
		if (JOptionPane.showConfirmDialog(null, "Confirm?", "Alert",
				JOptionPane.YES_NO_OPTION) == JOptionPane.NO_OPTION)
			return;

		try {
			DataInputStream in = new DataInputStream(socket.getInputStream());
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());

			String user = logIn.user.getUsername();

			String str = Protocol.createMessage("bid-item", id, price, user);

			String fromServer = "";
			out.writeUTF(str);
			out.flush();
			fromServer = in.readUTF();

			String[] result = Protocol.decodeMessage(fromServer);

			if (result[1].equals("confirmed"))
				JOptionPane.showMessageDialog(null, "Bid successful!", "confirmed", JOptionPane.INFORMATION_MESSAGE);
			else if (result[1].equals("get-item"))
				JOptionPane.showMessageDialog(null, "You now own this item!", "Congratulations",
						JOptionPane.INFORMATION_MESSAGE);
			else
				JOptionPane.showMessageDialog(null, "Item is no longer available", "alert", JOptionPane.ERROR_MESSAGE);

			search("");

			table.updateUI();
		}

		catch (IOException e) {
			JOptionPane.showMessageDialog(null, "server disconnected", "", JOptionPane.ERROR_MESSAGE);
			System.exit(0);
		}
	}

	/**
	 * search items with search test
	 * 
	 * @param searchText
	 */
	public void search(String searchText) {

		try {
			DataInputStream in = new DataInputStream(socket.getInputStream());
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());

			String str = Protocol.createMessage("search", searchText);

			String fromServer = "";
			out.writeUTF(str);
			out.flush();
			fromServer = in.readUTF();

			System.out.println(fromServer);
			JSONArray result = Protocol.StringToJSONArray(fromServer);

			cleanItems();
			for (int i = 0; i < result.length(); i++) {
				JSONObject tmp = (JSONObject) result.get(i);
				addItem(tmp);
			}

			table.updateUI();
		}

		catch (IOException e) {
			JOptionPane.showMessageDialog(null, "server disconnected", "", JOptionPane.ERROR_MESSAGE);
			System.exit(0);
		}
	}

	/**
	 * add items base on the information from server
	 * 
	 * @param tmp
	 *            JSONObject for table from server
	 */
	private void addItem(JSONObject tmp) {
		String id = String.format("%06d", tmp.getInt("id"));
		String name = tmp.getString("name");
		String endsAt = tmp.getString("endtime");
		String time_left = (toHMS(endsAt));
		String seller = tmp.getString("seller");
		String fixed_price = "";
		if (tmp.has("price"))
			fixed_price = "" + tmp.getDouble("price");
		String current_price = "";
		if (tmp.has("currentprice"))
			current_price = "" + tmp.getDouble("currentprice");
		tableModel.addRow(id, name, time_left, seller, current_price, fixed_price);
	}

	/**
	 * update the money of this count
	 * 
	 * @return the String of amount of money
	 */
	public String updateMoney() {

		try {
			DataInputStream in = new DataInputStream(socket.getInputStream());
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());

			String user = logIn.user.getUsername();

			String str = Protocol.createMessage("updateMoney", user);

			String fromServer = "";
			out.writeUTF(str);
			out.flush();
			fromServer = in.readUTF();

			System.out.println(fromServer);

			String[] result = Protocol.decodeMessage(fromServer);

			if (result[0].equals("updateMoney")) {

				return result[1];
			}

		} catch (IOException e) {
			JOptionPane.showMessageDialog(null, "server disconnected", "", JOptionPane.ERROR_MESSAGE);
			System.exit(0);

		}
		return "0";

	}

	/**
	 * transfer the time to HMS format
	 * 
	 * @param endsAt
	 * @return the time with HMS format
	 */
	private String toHMS(String endsAt) {

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);

		java.util.Date endsAtDate = null;
		try {
			endsAtDate = format.parse(endsAt);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.util.Date timeStamp = (Calendar.getInstance().getTime());
		long timeLeftLong = (endsAtDate.getTime() - timeStamp.getTime());

		if (timeLeftLong < 0) {
			return "00:00:00";
		} else {
			return String.format("%02d:%02d:%02d", TimeUnit.MILLISECONDS.toHours(timeLeftLong),
					TimeUnit.MILLISECONDS.toMinutes(timeLeftLong) % TimeUnit.HOURS.toMinutes(1),
					TimeUnit.MILLISECONDS.toSeconds(timeLeftLong) % TimeUnit.MINUTES.toSeconds(1));
		}
	}

}
