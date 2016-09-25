import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Observable;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dependency.*;

public class Server extends Observable {

	private ServerSocket serverSocket;
	private int port;

	final int maxThreadNum = 200;
	final int maxPendingConnectNum = 50;

	// data
	private ExecutorService tasks = null;
	long serialID;
	private ArrayList<Room> rooms;
	protected Database database;
	protected String order = " order by id";

	/**
	 * constructor for server
	 * 
	 * @param port
	 * @throws SQLException
	 */
	public Server(String port) throws SQLException {

		// transfer port number
		try {
			this.port = Integer.parseInt(port);
		} catch (NumberFormatException e) {
			System.out.println("\"" + port + "\" is not an int");
			return;
		}
		System.out.printf("port:%d\n", this.port);

		tasks = Executors.newFixedThreadPool(maxThreadNum);
		database = new Database();
		rooms = new ArrayList<Room>();
		// Default room
		rooms.add(new Room("Default", "Open", "0", "Server"));

		try {
			serverSocket = new ServerSocket(this.port);
			System.out.println("Miami Server started...");

			serialID = 1L;
			database.open();
			database.makeItemsDefault();
			// new ServerView(this);

			checkStatus();

			while (true) {
				Socket socket = serverSocket.accept();
				tasks.execute(new ClientThread(socket, serialID++, this));
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * obtain user in database
	 * 
	 * @return
	 * @throws SQLException
	 */
	public synchronized ResultSet getUserDatabase() throws SQLException {
		ResultSet rs = database.runQuery("SELECT * FROM nameandpasswd");

		setChanged();
		notifyObservers(rs);
		return rs;
	}

	/**
	 * add room with arguments
	 * 
	 * @param name
	 * @param availability
	 * @param numberOfPlayers
	 * @param owner
	 */
	public synchronized void addRoom(String name, String availability, String numberOfPlayers, String owner) {
		rooms.add(new Room(name, availability, numberOfPlayers, owner));
	}

	/**
	 * @return the rooms
	 */
	public synchronized ArrayList<Room> getRooms() {
		return rooms;
	}

	/**
	 * login with username and password
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public synchronized boolean login(String username, String password) {
		try {
			return database.checkLogin(username, password);
		} catch (SQLException e) {
			return false;
		}
	}

	/**
	 * register method in server
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public synchronized boolean register(String username, String password) {
		try {
			if (database.checkUsername(username)) {
				database.insert(username, password, 10000);
				return true;
			}
		} catch (SQLException e) {
			return false;
		}
		return false;
	}

	/**
	 * check the time and item status
	 */
	public synchronized void checkStatus() {

		Timer t = new Timer();

		t.schedule(new TimerTask() {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			@Override
			public void run() {
				String query = "SELECT id,endtime FROM items WHERE status = 'true'";
				ResultSet result = database.runQuery(query);
				ArrayList<Integer> ids = new ArrayList<Integer>();
				long currentTime = System.currentTimeMillis();

				try {
					while (result.next()) {

						String end = result.getString(2);
						int id = result.getInt(1);
						long timeEnd = sdf.parse(end).getTime();

						System.out.println(timeEnd - currentTime);

						if (timeEnd < currentTime) {
							ids.add(id);
						}
					}

					ArrayList<String> users = new ArrayList<String>();
					ArrayList<Double> newCoins = new ArrayList<Double>();

					for (int i : ids) {
						setStatus(i, false);

						String query3 = "SELECT seller,currentprice, coins, bidder FROM items, users WHERE username = seller AND id = "
								+ i;
						System.out.println(query3);

						ResultSet result2 = database.runQuery(query3);
						if (result2.next() && !result2.getString(4).equals("")) {
							users.add(result2.getString(1));
							newCoins.add(result2.getDouble(2) + result2.getDouble(3));
						}
					}

					for (int i = 0; i < users.size(); i++) {
						String query4 = "UPDATE users SET coins = '" + newCoins.get(i) + "' WHERE username = '"
								+ users.get(i) + "'";

						database.update(query4);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}, 0, 30000);
	}

	/**
	 * set items status
	 * 
	 * @param id
	 * @param bool
	 */
	public synchronized void setStatus(int id, boolean bool) {
		database.setStatus(id, bool);
	}

	/**
	 * get status of item
	 * 
	 * @param id
	 * @return
	 */
	public String getStatus(int id) {
		String query = "SELECT status FROM items WHERE id = " + id;

		ResultSet result = database.runQuery(query);

		try {
			if (result.next()) {
				String status = result.getString(1);

				return status;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false + "";
	}

	/**
	 * update bid information
	 * 
	 * @param id
	 * @param user
	 * @param price
	 */
	public synchronized void updateBid(int id, String user, double price) {
		database.updateBid(id, user, price);
	}

	/**
	 * add item with information in arguments
	 * 
	 * @param name
	 * @param bider
	 * @param seller
	 * @param fixed_price
	 * @param time
	 * @param start_price
	 * @param room
	 * @throws NumberFormatException
	 * @throws SQLException
	 */
	public synchronized void addItem(String name, String bider, String seller, double fixed_price, int time,
			double start_price, Room room) throws NumberFormatException, SQLException {
		database.addItem(name, bider, seller, fixed_price, time, start_price, room);
	}

	/**
	 * obtain bid list of a user in database
	 * 
	 * @param user
	 * @param room
	 * @return
	 */
	public synchronized ResultSet obtainBidList(String user, Room room) {
		String query = "SELECT * FROM items WHERE bidder = '" + user + "'AND room = '" + room.getName() + "'";
		return database.runQuery(query + order);
	}

	/**
	 * obtain items in a room
	 * 
	 * @param user
	 * @param room
	 * @return
	 */
	public synchronized ResultSet obtainItems(String user, Room room) {
		String query = "SELECT * FROM items WHERE seller = '" + user + "'AND room = '" + room.getName()
				+ "'AND status = 'true'";
		System.out.print(query);
		return database.runQuery(query + order);
	}

	/**
	 * search method for markets
	 * 
	 * @param keyWords
	 * @param room
	 * @return
	 */
	public synchronized ResultSet search(String[] keyWords, Room room) {
		String query = "";

		if (keyWords.length == 0) {
			query = "SELECT * FROM items WHERE room = '" + room.getName() + "'";
		} else if (keyWords.length == 1) {
			query = "SELECT * FROM items WHERE name LIKE '%" + keyWords[0] + "%' AND status = 'true' AND room = '"
					+ room.getName() + "'";
		} else {
			query = "SELECT * FROM items WHERE name LIKE '%" + keyWords[0] + "%' AND status = 'true'";
			for (int i = 1; i < keyWords.length; i++) {
				query.concat("OR name LIKE '%" + keyWords[i] + "%'");
			}
			query.concat("AND room = '" + room.getName() + "'");
		}

		System.out.println(query);
		return database.runQuery(query + order);
	}

	/**
	 * obtain user information from database
	 * 
	 * @param username
	 * @return
	 */
	public User getUser(String username) {
		User user = null;
		try {
			user = database.getUser(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * obtain the money of the user
	 * 
	 * @param username
	 * @return
	 */
	public double getCoins(String username) {

		try {
			return database.getCoins(username);

		} catch (NumberFormatException e) {
			return 0;
		} catch (SQLException e) {
			return 0;
		}
	}

	/**
	 * update the user's money
	 * 
	 * @param user
	 * @param price
	 */
	public synchronized void updateCoins(String user, double price) {
		double oldCoins;

		try {
			oldCoins = database.getCoins(user);

			String query = "UPDATE users SET coins = '" + (oldCoins - price) + "' WHERE username = '" + user + "'";

			System.out.println(query);
			database.update(query);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * obtain the current price of an item
	 * 
	 * @param id
	 * @return
	 */
	public synchronized double currentPrice(int id) {
		String query = "SELECT currentprice FROM items WHERE id = " + id;

		ResultSet result = database.runQuery(query);

		try {
			if (result.next()) {
				double currentPrice = result.getDouble(1);

				return currentPrice;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	/**
	 * obtain the fixed price of an item
	 * 
	 * @param id
	 * @return
	 */
	public synchronized double getFixedPrice(int id) {
		String query = "SELECT price FROM items WHERE id = " + id;

		ResultSet result = database.runQuery(query);

		try {
			if (result.next()) {
				double fixedPrice = result.getDouble(1);

				return fixedPrice;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	/**
	 * return a user with the item's price
	 * 
	 * @param id
	 */
	public synchronized void returnCoins(int id) {
		String query = "SELECT bidder, currentprice FROM items WHERE id = " + id;

		ResultSet result = database.runQuery(query);

		try {
			if (result.next()) {

				String user = result.getString(1);
				double currentPrice = result.getDouble(2);

				double oldCoins = database.getCoins(user);

				String query2 = "UPDATE users SET coins = '" + (oldCoins + currentPrice) + "' WHERE username = '" + user
						+ "'";

				System.out.println(query2);

				database.update(query2);
			}
		}

		catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * a user bid an item with the price
	 * 
	 * @param id
	 * @param price
	 * @param user
	 * @return
	 */
	public synchronized String bidItem(int id, double price, String user) {

		double coins = getCoins(user);
		double currentPrice = currentPrice(id);
		double fixedPrice = getFixedPrice(id);
		String status = getStatus(id);

		if (price > fixedPrice) {

			price = fixedPrice;
		}

		System.out.println(price + "  " + fixedPrice);

		if (id != -1 && price != -1 && price <= coins && price > currentPrice && status.equals("true")) {

			returnCoins(id);
			updateBid(id, user, price);
			updateCoins(user, price);

			if (price >= fixedPrice) {
				setStatus(id, false);

				String query = "SELECT seller, currentprice FROM items WHERE id = " + id;
				System.out.println(query);
				ResultSet result = database.runQuery(query);

				String seller = "";
				double addCoins = 0;
				double oldCoins = 0;

				try {
					if (result.next()) {
						seller = result.getString(1);
						addCoins = result.getDouble(2);
						oldCoins = database.getCoins(seller);
					}

					String query2 = "UPDATE users SET coins = '" + (oldCoins + addCoins) + "' WHERE username = '"
							+ seller + "'";
					System.out.println(query2);

					database.update(query2);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "get-item";
			}
			return "confirmed";
		}
		return "rejected";
	}

	/**
	 * update the money of seller with sale item
	 * 
	 * @param id
	 */
	public synchronized void updateSellerMoney(int id) {

		String query = "SELECT seller, currentprice, FROM items WHERE id = " + id;

		ResultSet result = database.runQuery(query);

		String seller = "";
		double addCoins = 0;
		double oldCoins = 0;

		try {
			if (result.next()) {

				seller = result.getString(1);
				addCoins = result.getDouble(2);
				oldCoins = database.getCoins(seller);

			}

			String query2 = "UPDATE users SET coins = '" + (oldCoins + addCoins) + "' WHERE username = '" + seller
					+ "'";

			database.update(query2);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
