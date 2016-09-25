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

import dependency.Protocol;

public class SellerModel extends Observable {

	Socket socket = null;
	JTable table = null;
	SellerTable tableModel = null;

	/**
	 * constructor with arguments
	 * 
	 * @param socket
	 * @param table
	 * @param tableModel
	 */
	public SellerModel(Socket socket, JTable table, SellerTable tableModel) {
		this.socket = socket;
		this.table = table;
		this.tableModel = tableModel;
	}

	/**
	 * clean the items in table
	 */
	public void cleanItems() {
		tableModel.removeRows(0, tableModel.getRowCount());
		table.updateUI();
	}

	/**
	 * get my item list and update in table
	 */
	public void getMyItems() {

		try {
			DataInputStream in = new DataInputStream(socket.getInputStream());
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());

			String str = Protocol.createMessage("get-my-items");
			String fromServer = "";
			try {
				out.writeUTF(str);
				out.flush();
				fromServer = in.readUTF();
			} catch (IOException e) {
				JOptionPane.showMessageDialog(null, "server disconnected", "", JOptionPane.ERROR_MESSAGE);
				System.exit(0);
			}

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
			e.printStackTrace();
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
		String bider = tmp.getString("bidder");
		String name = tmp.getString("name");
		String endsAt = tmp.getString("endtime");
		String time_left = toHMS(endsAt);
		String fixed_price = "";
		if (tmp.has("price"))
			fixed_price = "" + tmp.getDouble("price");
		String current_price = "";
		if (tmp.has("currentprice"))
			current_price = "" + tmp.getDouble("currentprice");
		String status = "";
		if (tmp.has("status"))
			if (tmp.getString("status").equals("true")) {
				status = "Open";
			} else {
				status = "Closed";
			}

		tableModel.addRow(id, name, time_left, bider, current_price, fixed_price, status);
	}

	/**
	 * publish item to server base on arguments
	 * 
	 * @param name
	 * @param i
	 * @param start_price
	 * @param fixed_price
	 */
	public void publishItem(String name, String i, String start_price, String fixed_price) {
		try {
			DataInputStream in = new DataInputStream(socket.getInputStream());
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());

			String str = Protocol.createMessage("publish-item", name, i, start_price, fixed_price);
			String fromServer = "";
			out.writeUTF(str);
			out.flush();
			fromServer = in.readUTF();

			String[] result = Protocol.decodeMessage(fromServer);

			if (result[1].equals("confirmed"))
				JOptionPane.showMessageDialog(null, "Item added to market", "confirmed",
						JOptionPane.INFORMATION_MESSAGE);
			else
				JOptionPane.showMessageDialog(null, result[2], result[1], JOptionPane.ERROR_MESSAGE);

			getMyItems();

			table.updateUI();
		}

		catch (IOException e) {
			JOptionPane.showMessageDialog(null, "server disconnected", "", JOptionPane.ERROR_MESSAGE);
			System.exit(0);
		}
	}

	/**
	 * close the auction base on id
	 * 
	 * @param id
	 */
	public void close(String id) {
		if (JOptionPane.showConfirmDialog(null, "confirm?", "Alert",
				JOptionPane.YES_NO_OPTION) == JOptionPane.NO_OPTION)
			return;

		try {
			DataInputStream in = new DataInputStream(socket.getInputStream());
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());

			String str = Protocol.createMessage("close-auction", id);

			String fromServer = "";
			out.writeUTF(str);
			out.flush();
			fromServer = in.readUTF();

			String[] result = Protocol.decodeMessage(fromServer);

			if (result[1].equals("confirmed"))
				JOptionPane.showMessageDialog(null, "Item removed from market", "confirmed",
						JOptionPane.INFORMATION_MESSAGE);
			else
				JOptionPane.showMessageDialog(null, "request rejected!", "alert", JOptionPane.ERROR_MESSAGE);

			getMyItems();

			table.updateUI();
		}

		catch (IOException e) {
			JOptionPane.showMessageDialog(null, "server disconnected", "", JOptionPane.ERROR_MESSAGE);
			System.exit(0);
		}
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
