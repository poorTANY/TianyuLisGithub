import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.sql.SQLException;
import java.util.ArrayList;

import dependency.*;

public class ClientThread implements Runnable {

	private Socket socket;
	private long serialID;
	private String user;
	private Server server;
	private Room room;

	DataInputStream in;
	DataOutputStream out;

	/**
	 * constructor of client thread
	 * 
	 * @param socket
	 * @param serialID
	 * @param server
	 */
	public ClientThread(Socket socket, long serialID, Server server) {
		this.socket = socket;
		this.serialID = serialID;
		this.server = server;
	}

	/**
	 * run method in runnable
	 */
	@Override
	public void run() {
		try {
			in = new DataInputStream(socket.getInputStream());
			out = new DataOutputStream(socket.getOutputStream());

			String tmp = in.readUTF();
			System.out.println(tmp);

			if (tmp.equals("connect to Miami")) {
				out.writeUTF("Welcome! - Miami");
				out.writeLong(serialID);
				out.flush();

				System.out.printf("ID:0x%04x succeed!\n", serialID);
			} else {
				out.writeUTF("access deined!");
				System.out.printf("ID:0x%04x failed!\n", serialID);
				socket.close();
			}

			pending();

			if (!(room == null)) {
				room.setCurrentPlayers(room.getCurrentPlayers() - 1);
			}
			System.out.printf("ID:0x%04x disconnected\n", serialID);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * pending method waiting for request and response
	 */
	private void pending() {
		String tmp;

		while (!socket.isClosed()) {

			try {
				socket.sendUrgentData(0xFF);
			} catch (Exception e) {
				System.out.println("socket disconnected.");
				break;
			}

			try {
				tmp = in.readUTF();
			} catch (IOException e) {
				System.out.println("Message Ending...");
				continue;
			}

			// message
			String[] fromClient = Protocol.decodeMessage(tmp);
			String response = "";

			if (fromClient[0].equals("login"))
				response = login(fromClient[1], fromClient[2]);

			if (fromClient[0].equals("register"))
				response = register(fromClient[1], fromClient[2]);

			if (fromClient[0].equals("roomCheck"))
				response = obtainRooms();

			if (fromClient[0].equals("create-room"))
				response = createRoom(fromClient[1], fromClient[2], fromClient[3], fromClient[4]);

			if (fromClient[0].equals("select-room"))
				response = selectRoom(fromClient[1], fromClient[2]);

			if (fromClient[0].equals("edit-room"))
				response = editRoom(fromClient[1], fromClient[2], fromClient[3]);

			if (fromClient[0].equals("search"))
				response = search(fromClient[1]);

			if (fromClient[0].equals("get-my-items"))
				response = obtainItems();

			if (fromClient[0].equals("get-my-bidlist"))
				response = obtainBidList();

			if (fromClient[0].equals("publish-item"))
				response = publishItem(fromClient[1], fromClient[2], fromClient[3], fromClient[4]);

			if (fromClient[0].equals("bid-item"))
				response = bidItem(fromClient[1], fromClient[2], fromClient[3]);

			if (fromClient[0].equals("close-auction"))
				response = closeAuction(fromClient[1]);

			if (fromClient[0].equals("updateMoney"))
				response = updateMoney(fromClient[1]);

			if (fromClient[0].equals("get-user"))
				response = getUser(fromClient[1]);

			// response
			try {
				out.writeUTF(response);
				out.flush();
			} catch (IOException e) {
				System.out.println("out stream Error!");
				continue;
			}
		}
	}

	/**
	 * update method for user
	 * 
	 * @param username
	 * @return
	 */
	private String updateMoney(String username) {

		double money = server.getCoins(username);

		System.out.println(money);

		return Protocol.createMessage("updateMoney", Double.toString(money));
	}

	/**
	 * close the auction
	 * 
	 * @param item
	 * @return
	 */
	private String closeAuction(String item) {
		int id = -1;

		try {
			id = Integer.parseInt(item);
		} catch (Exception e) {
			return Protocol.createMessage("close-auction", "rejected", "id invalid or no authority");
		}

		server.setStatus(id, false);
		return Protocol.createMessage("close-auction", "confirmed");
	}

	/**
	 * bid the item with price by someone
	 * 
	 * @param item
	 * @param Price
	 * @param user
	 * @return
	 */
	private String bidItem(String item, String Price, String user) {
		int id = -1;
		try {
			id = Integer.parseInt(item);
		} catch (Exception e) {
			return Protocol.createMessage("bid-item", "rejected", "id invalid");
		}

		double price = -1;
		try {
			price = Double.parseDouble(Price);
		} catch (Exception e) {
			return Protocol.createMessage("bid-item", "rejected", "price invalid");
		}

		return Protocol.createMessage("bid-item", server.bidItem(id, price, user));
	}

	/**
	 * publish the item with information from arguments
	 * 
	 * @param name
	 * @param time
	 * @param start_price
	 * @param fixed_price
	 * @return
	 */
	private String publishItem(String name, String time, String start_price, String fixed_price) {

		try {
			server.addItem(name, "", user, Double.parseDouble(fixed_price), Integer.parseInt(time),
					Double.parseDouble(start_price), room);
		} catch (NumberFormatException e) {
			return Protocol.createMessage("publish-item", "rejected", "number format error!");
		} catch (SQLException e) {
			return Protocol.createMessage("publish-item", "rejected", "database reject your request!");
		}

		return Protocol.createMessage("publish-item", "confirmed");
	}

	/**
	 * obtain bid list for this user
	 * 
	 * @return
	 */
	private String obtainBidList() {
		return Protocol.resultSetToJson(server.obtainBidList(user, room));
	}

	/**
	 * obtain items published by this user
	 * 
	 * @return
	 */
	private String obtainItems() {
		return Protocol.resultSetToJson(server.obtainItems(user, room));
	}

	/**
	 * search method for market
	 * 
	 * @param keyWords
	 * @return
	 */
	private String search(String keyWords) {
		String[] Words = keyWords.split(" ");
		return Protocol.resultSetToJson(server.search(Words, room));
	}

	/**
	 * @author jep537 Changes the information tied to a room and returns the new
	 *         status of the room to the user.
	 * @param name
	 *            Name of the room to change
	 * @param availability
	 *            New room availability
	 * @param num
	 *            New max number of players
	 * @return Message to return to client.
	 */
	private String editRoom(String name, String availability, String num) {
		int roomToChange = server.getRooms().indexOf(new Room(name, "", "", ""));
		server.getRooms().get(roomToChange).setAvailability(availability);
		server.getRooms().get(roomToChange).setNumberOfPlayers(num);

		return Protocol.createMessage("edit-room", "complete");
	}

	/**
	 * @author jep537 Checks if a user can join a room and returns the result to
	 *         the client.
	 * @param name
	 *            Room to be selected
	 * @return Result of check
	 */
	private String selectRoom(String name, String username) {
		String str = "";
		if (server.getRooms().contains(new Room(name, "", "", ""))) {
			int position = server.getRooms().indexOf(new Room(name, "", "", ""));
			Room room = server.getRooms().get(position);
			if (room.getAvailability().equals("Open") || username.equals(room.getOwner())) {
				if (room.getCurrentPlayers() < Integer.parseInt(room.getNumberOfPlayers())
						|| room.getName().equals("Default")) {
					this.room = room;
					this.room.setCurrentPlayers(this.room.getCurrentPlayers() + 1);
					str = Protocol.createMessage("select-room", "true");
				} else {
					str = Protocol.createMessage("select-room", "false", "Error: Max number of players reached");
				}
			} else {
				str = Protocol.createMessage("select-room", "false", "Error: Room is not open");
			}
		} else {
			str = Protocol.createMessage("select-room", "false", "Error: Room no longer exists");
		}

		return str;
	}

	/**
	 * @author jep537 Creates a room with the specified details provided the
	 *         room does not already exist on the server.
	 * @param name
	 *            Name of the new room
	 * @param availability
	 *            Availability of the new room
	 * @param num
	 *            Max number of players of the new room
	 * @param owner
	 *            Creator of the new room
	 * @return Results of room creation
	 */
	private String createRoom(String name, String availability, String num, String owner) {
		if (!server.getRooms().contains(new Room(name, "", "", ""))) {
			server.addRoom(name, availability, num, owner);
			return Protocol.createMessage("create-room", "true");
		} else {
			return Protocol.createMessage("create-room", "false");
		}
	}

	/**
	 * @author jep537 Gets a list of all the rooms currently on the server and
	 *         returns it to the client.
	 * @return List of rooms on the server to the client.
	 */
	private String obtainRooms() {
		ArrayList<Room> currentRooms = new ArrayList<Room>(server.getRooms());
		ArrayList<String> message = new ArrayList<String>();

		for (int i = 0; i < currentRooms.size(); i++) {
			message.add(currentRooms.get(i).getName());
			message.add(currentRooms.get(i).getAvailability());
			if (currentRooms.get(i).getName().equals("Default")) {
				message.add((Integer.toString(currentRooms.get(i).getCurrentPlayers()) + "/Infinite"));
			} else {
				message.add((Integer.toString(currentRooms.get(i).getCurrentPlayers()) + "/"
						+ currentRooms.get(i).getNumberOfPlayers()));
			}
			message.add(currentRooms.get(i).getOwner());
		}

		message.add(0, "roomCheck");
		String messagesToSend[] = new String[message.size()];
		messagesToSend = message.toArray(messagesToSend);
		return Protocol.createMessage(messagesToSend);
	}

	/**
	 * register account
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	private String register(String username, String password) {
		boolean result = server.register(username, password);
		return Protocol.createMessage("register", "" + result);
	}

	/**
	 * login method with username and password
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	private String login(String username, String password) {
		System.out.println("login");

		boolean result = false;
		if (result = server.login(username, password))
			user = username;

		return Protocol.createMessage("login", "" + result);
	}

	/**
	 * obtain user information
	 * 
	 * @param username
	 * @return
	 */
	private String getUser(String username) {
		User user = server.getUser(username);

		return Protocol.createMessage("get-user", user.getUsername(), user.getCoins() + "");
	}
}
