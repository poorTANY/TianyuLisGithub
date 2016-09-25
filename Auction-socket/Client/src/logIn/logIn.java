package logIn;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Observable;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

import dependency.*;

import waitingRoom.WaitingRoom;

public class logIn extends Observable {

	public static User user = null;
	private boolean accepted = false;
	private long serialID;
	private Socket socket;
	private DataInputStream in;
	private DataOutputStream out;

	/**
	 * constructor of login model
	 * 
	 * @param socket
	 * @param serialID
	 */
	public logIn(Socket socket, long serialID) {

		this.serialID = serialID;
		this.socket = socket;

		try {
			this.in = new DataInputStream(socket.getInputStream());
			this.out = new DataOutputStream(socket.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * log in method
	 * 
	 * @param username
	 * @param password
	 */
	protected void login(String username, String password) {
		if (checkLogin(username, password)) {

			// user = new User(username, password);
			System.out.println("Login successful!");

			String str = Protocol.createMessage("get-user", username);

			String fromServer = "";
			try {
				out.writeUTF(str);
				out.flush();
				fromServer = in.readUTF();
			} catch (IOException e) {
				JOptionPane.showMessageDialog(null, "server disconnected", "", JOptionPane.ERROR_MESSAGE);
				System.exit(0);
			}

			String[] result = Protocol.decodeMessage(fromServer);

			if (result[0].equals("get-user"))
				logIn.user = new User(result[1], Double.parseDouble(result[2]));
			JFrame frame = new JFrame();
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			frame.setSize(800, 600);
			setChanged();
			notifyObservers();
			new WaitingRoom(socket, frame, username);

		} else {
			JOptionPane.showMessageDialog(null, "Incorrect username or password!", "alert", JOptionPane.ERROR_MESSAGE);
		}
	}

	/**
	 * login check with server
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	private boolean checkLogin(String username, String password) {

		String str = Protocol.createMessage("login", username, password);

		System.out.println("To server:" + str);

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

		String[] results = Protocol.decodeMessage(fromServer);

		if (results[0].equals("login")) {
			if (results[1].equals("true")) {
				return true;
			}
		}

		return false;

	}
	/**
	 * obtain user information
	 * @return
	 */
	public User getUser() {
		return user;
	}

	/**
	 * register 
	 */
	protected void register() {
		RegisterModel rm = new RegisterModel(socket, this.serialID);
		new RegisterView(rm);
	}

}
