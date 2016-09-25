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

public class BidListModel extends Observable {

	Socket socket = null;
	JTable table = null;
	BidListTable tableModel = null;

	/**
	 * constructor
	 * 
	 * @param socket
	 * @param table
	 * @param tableModel
	 */
	public BidListModel(Socket socket, JTable table, BidListTable tableModel) {
		this.socket = socket;
		this.table = table;
		this.tableModel = tableModel;
	}

	/**
	 * remove all items in table
	 */
	public void cleanItems() {
		tableModel.removeRows(0, tableModel.getRowCount());
		table.updateUI();
	}

	/**
	 * obtain the information form server and refresh
	 */
	public void refresh() {
		try {
			DataInputStream in = new DataInputStream(socket.getInputStream());
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());

			String str = Protocol.createMessage("get-my-bidlist");

			out.writeUTF(str);
			out.flush();

			String fromServer = in.readUTF();

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
		String seller = tmp.getString("seller");
		String name = tmp.getString("name");
		String endsAt = tmp.getString("endtime");
		String time_left = toHMS(endsAt);
		System.out.println("additem" + time_left);
		String fixed_price = "";
		if (tmp.has("price"))
			fixed_price = "" + tmp.getDouble("price");
		String current_price = "";
		if (tmp.has("currentprice"))
			current_price = "" + tmp.getDouble("currentprice");
		String status = "";
		if (tmp.has("status"))
			if (tmp.getString("status").equals("true")) {
				status = "Ongoing";
			} else {
				status = "Won";
			}
		tableModel.addRow(id, name, time_left, seller, current_price, fixed_price, status);
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
			System.out.println("data format error");
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
