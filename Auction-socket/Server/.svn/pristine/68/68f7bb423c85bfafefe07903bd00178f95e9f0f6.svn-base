package JTest;

import static org.junit.Assert.assertEquals;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import org.junit.Before;
import org.junit.Test;

public class T01_ConnectTest {

	Socket socket;
	DataInputStream in;
	DataOutputStream out;

	@Before
	public void setUp() throws IOException {
		try {
			socket = new Socket("localhost", 8000);
			socket.setSoTimeout(3000);
			in = new DataInputStream(socket.getInputStream());
			out = new DataOutputStream(socket.getOutputStream());
		} catch (Exception e) {
			System.out.println("Connection refused");
		}
	}

	@Test
	public void test() throws IOException {
		out.writeUTF("connect to Miami");
		out.flush();
		String expected = "Welcome! - Miami";
		String result = in.readUTF();
		assertEquals(expected, result);
	}

}
