package auction;

import java.net.Socket;
import java.util.Observable;

import javax.swing.JFrame;

public class Auction extends Observable {
	Socket socket = null;
	JFrame frame = null;

	/**
	 * obtain socket and frame and create auction GUI
	 * 
	 * @param socket
	 * @param frame
	 */
	public Auction(Socket socket, JFrame frame) {
		this.socket = socket;
		this.frame = frame;

		new AuctionView(socket, frame);
	}
}
