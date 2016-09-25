
public class Main {

	/**
	 * transfer arguments to client
	 * 
	 * @param a
	 *            arguments from command line
	 */
	public static void main(String[] a) {
		String host;
		int port;
		if (a.length == 0) {
			host = "localhost";
			port = 8000;
		} else {
			host = a[0];
			port = Integer.parseInt(a[1]);
		}
		new Client(host, port);
	}
}
