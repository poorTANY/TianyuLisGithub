import java.io.*;
import java.net.Socket;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

// our own libraries
import logIn.*;

public class Client {

	// connecting part
	static Socket socket;
	long serialID;
	JFrame view;

	DataInputStream in;
	DataOutputStream out;

	/**
	 * constructor for client
	 * 
	 * @param host
	 * @param port
	 */
	public Client(String host, int port) {
		System.out.printf("host:%s port:%d\n", host, port);

		try {
			socket = new Socket(host, port);
			socket.setSoTimeout(3000);
			in = new DataInputStream(socket.getInputStream());
			out = new DataOutputStream(socket.getOutputStream());
			start();
		} catch (Exception e) {
			System.out.println("Connection refused");
		}
	}

	/**
	 * connect the server and start
	 * 
	 * @throws IOException
	 *             when no connection
	 */
	public void start() throws IOException {
		out.writeUTF("connect to Miami");
		out.flush();

		String echo = in.readUTF();
		System.out.println(echo);
		if (echo.equals("Welcome! - Miami")) {
			serialID = in.readLong();
			System.out.printf("server connected! - serialID:0x%04x\n", serialID);

			process();
		} else {
			System.out.println("rejected!");
			JOptionPane.showMessageDialog(null, "connecting rejected!", "alert", JOptionPane.ERROR_MESSAGE);
		}
	}

	/**
	 * build login GUI after client start
	 */
	public void process() {
		logIn authority = new logIn(socket, serialID);
		new logInView(authority, serialID);
	}
}
