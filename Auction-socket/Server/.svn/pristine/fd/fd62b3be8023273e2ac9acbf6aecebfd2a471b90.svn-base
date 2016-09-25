package JTest;

import static org.junit.Assert.assertEquals;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import org.junit.Before;
import org.junit.Test;

import dependency.Protocol;

public class T08_ItemTest {

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
		String str = Protocol.createMessage("publish-item","test","1","s0","1");
		out.writeUTF(str);
		out.flush();
		String expected = "[\"publish-item\",\"rejected\",\"number format error!\"]";
		String result = in.readUTF();
		assertEquals(expected, result);
	}
	
	@Test
	public void test2() throws IOException {
		String str = Protocol.createMessage("publish-item","test","1","0","1");
		out.writeUTF(str);
		out.flush();
		String expected = "[\"publish-item\",\"confirmed\"]";
		String result = in.readUTF();
		assertEquals(expected, result);
	}

}
