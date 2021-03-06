package JTest;

import static org.junit.Assert.assertEquals;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import org.junit.Before;
import org.junit.Test;

import dependency.Protocol;

public class T05_SelectRoomTest {

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
			out.writeUTF("connect to Miami");
			out.flush();
			System.out.println(in.readUTF());
			System.out.println("ID: " + in.readLong());
			String str = Protocol.createMessage("login", "test", "111111");
			out.writeUTF(str);
			out.flush();
			System.out.println(in.readUTF());
			str = Protocol.createMessage("roomCheck");
			out.writeUTF(str);
			out.flush();
			System.out.println(in.readUTF());
		} catch (Exception e) {
			System.out.println("Connection refused");
		}
	}

	@Test
	public void test1() throws IOException {
		String str = Protocol.createMessage("select-room","Default","true");
		out.writeUTF(str);
		out.flush();
		String expected = "[\"select-room\",\"true\"]";
		String result = in.readUTF();
		assertEquals(expected, result);
	}
	
	@Test
	public void test2() throws IOException {
		String str = Protocol.createMessage("select-room","myroom","true");
		out.writeUTF(str);
		out.flush();
		String expected = "[\"select-room\",\"false\",\"Error: Room no longer exists\"]";
		String result = in.readUTF();
		assertEquals(expected, result);
	}

}
