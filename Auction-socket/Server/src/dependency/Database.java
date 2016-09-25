package dependency;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Vector;

import javax.swing.table.DefaultTableModel;

public class Database {

	private Connection con;
	private Statement stmt;

	// table in database
	private String loginTable = "users";
	private String items = "items";

	// private String users = "users";
	/**
	 * start the database with preset information
	 */
	public void open() {

		String protocol = "postgresql";
		String server = "dbteach2.cs.bham.ac.uk";
		String port = "5432";

		// database
		String db = "miami";
		String driverName = "org.postgresql.Driver";

		// username and password
		String username = "dxx508";
		String password = "120873";

		String URL = "jdbc:" + protocol + "://" + server + ":" + port + "/" + db;

		@SuppressWarnings("rawtypes")
		Class driver = null;
		try {
			driver = Class.forName(driverName);
			DriverManager.registerDriver((Driver) driver.newInstance());
		} catch (ClassNotFoundException e) {
			System.err.println("Database driver not found");
			System.out.println(e);
			System.exit(1);
		} catch (Exception e) {
			System.err.println("Driver could not be registered");
			System.exit(1);
		}

		try {
			con = DriverManager.getConnection(URL, username, password);

			stmt = con.createStatement();

		} catch (SQLException e) {
			System.err.println("SQL Exception");
			System.err.println(e);
			System.exit(1);
		}

		System.out.println("database connected");

	}

	/**
	 * close the database
	 */
	public void close() {
		try {
			stmt.close();
			con.close();
		} catch (Throwable e) {
		}
	}

	/**
	 * finalize method for database
	 */
	protected void finalize() throws Throwable {
		close();
		super.finalize();
	}

	/**
	 * method to run the database query
	 * 
	 * @param q
	 * @return
	 */
	public ResultSet runQuery(String q) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(q);
		} catch (SQLException e) {
			System.err.println(e);
			System.exit(1);
		}
		return rs;
	}

	/**
	 * obtain update
	 * 
	 * @param q
	 * @return
	 */
	public int update(String q) {
		try {
			return stmt.executeUpdate(q);
		} catch (SQLException e) {
			System.err.println(e);
			System.exit(1);
		}
		return 0;
	}

	/**
	 * method to check username
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public boolean checkUsername(String username) throws SQLException {
		String query = "SELECT username FROM " + loginTable + " where username = '" + username + "'";
		ResultSet result = runQuery(query);

		System.out.println("Username checked");
		return !result.next();
	}

	/**
	 * method to check password
	 * 
	 * @param args
	 * @throws SQLException
	 */
	public boolean checkLogin(String username, String passwd) throws SQLException {
		String query = "SELECT password FROM " + loginTable + " where username = '" + username + "'";
		ResultSet result = runQuery(query);

		return (result.next() && result.getString(1).equals(passwd));
	}

	/**
	 * Create new user in the database
	 * 
	 * @param username
	 * @param passwd
	 */
	public void insert(String username, String passwd, double coins) {
		String query = "INSERT INTO " + loginTable + " VALUES ('" + username + "','" + passwd + "'," + coins + ")";

		System.out.println(query);

		update(query);
	}

	/**
	 * add item to the database
	 * 
	 * @param name
	 * @param bidder
	 * @param seller
	 * @param price
	 * @param duration
	 * @throws SQLException
	 * @throws NumberFormatException
	 */

	public int addItem(String name, String bidder, String seller, double price, int duration, double currentprice,
			Room room) throws NumberFormatException, SQLException {

		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);

		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);

		String begin = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;

		// cal.add(Calendar.HOUR, duration);
		cal.add(Calendar.MINUTE, duration);

		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH) + 1;
		day = cal.get(Calendar.DAY_OF_MONTH);

		hour = cal.get(Calendar.HOUR_OF_DAY);
		minute = cal.get(Calendar.MINUTE);
		second = cal.get(Calendar.SECOND);

		String end = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;

		String query = "INSERT INTO " + items
				+ "(name,bidder,seller,price,begintime,endtime,currentprice,room,status) VALUES ('" + name + "','"
				+ bidder + "','" + seller + "'," + price + ",'" + begin + "','" + end + "','" + currentprice + "','"
				+ room.getName() + "','true')";

		System.out.println(query);
		update(query);

		return getItemID(name, seller, price, begin);
	}

	/**
	 * Get user from database
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public User getUser(String username) throws SQLException {

		String query = "SELECT username,coins FROM " + loginTable + " where username = '" + username + "'";

		ResultSet result = runQuery(query);

		if (result.next()) {
			return new User(result.getString(1), result.getDouble(2));
		}
		return new User(result.getString(1));
	}

	public int getItemID(String name, String seller, double price, String begin)
			throws NumberFormatException, SQLException {

		String query = "SELECT id FROM " + items + " where name = '" + name + "' AND seller = '" + seller
				+ "' AND price = " + price + " AND begintime = '" + begin + "'";

		ResultSet result = runQuery(query);

		if (result.next()) {
			return Integer.parseInt(result.getString(1));
		}

		return 0;
	}

	public DefaultTableModel buildTableModel(ResultSet rs) throws SQLException {

		ResultSetMetaData metaData = rs.getMetaData();

		// names of columns
		Vector<String> columnNames = new Vector<String>();
		int columnCount = metaData.getColumnCount();
		for (int column = 1; column <= columnCount; column++) {
			columnNames.add(metaData.getColumnName(column));
		}

		// data of the table
		Vector<Vector<Object>> data = new Vector<Vector<Object>>();
		while (rs.next()) {
			Vector<Object> vector = new Vector<Object>();
			for (int columnIndex = 1; columnIndex <= columnCount; columnIndex++) {
				vector.add(rs.getObject(columnIndex));
			}
			data.add(vector);
		}

		return new DefaultTableModel(data, columnNames);
	}

	public void updateBid(int id, String user, double price) {
		String query = "UPDATE items SET bidder = '" + user + "', currentprice = " + price + " WHERE id = " + id;
		System.out.println(query);

		update(query);
	}

	public void setRoom(int id, String room) {
		String query = "UPDATE items SET room = '" + room + "' WHERE id = " + id;

		update(query);
	}

	public void setStatus(int id, boolean bool) {

		if (bool == false) {
			String query = "UPDATE items SET status = 'false' WHERE id = " + id;

			update(query);
		}

		if (bool == true) {
			String query = "UPDATE items SET status = 'true' WHERE id = " + id;

			update(query);
		}
	}

	public double getCoins(String username) throws NumberFormatException, SQLException {
		String query = "SELECT coins FROM " + loginTable + " where username = '" + username + "'";

		ResultSet result = runQuery(query);

		if (result.next()) {
			return Double.parseDouble(result.getString(1));
		}

		return 0;
	}

	public void makeItemsDefault() {
		String query = "UPDATE items SET status = 'false'";

		update(query);
	}

}
