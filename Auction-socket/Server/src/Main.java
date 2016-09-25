import java.sql.SQLException;

public class Main {
	/**
	 * main method for application
	 * 
	 * @param a
	 * @throws SQLException
	 */
	public static void main(String[] a) throws SQLException {
		String port;
		if (a.length == 0) {
			port = "8000";
		} else {
			port = a[0];
		}
		new Server(port);
	}
}
