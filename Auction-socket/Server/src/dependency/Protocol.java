package dependency;

import java.sql.*;
import org.json.*;

public class Protocol {

	/**
	 * when creating message, the first String is the type of the message now I
	 * have defined some basic cases
	 * 
	 * createMessage("login", "username", "password") for check the username and
	 * password when login
	 * 
	 * createMessage("bool", "true") means this message is a boolean value
	 * 
	 * We should define more cases in the future and now it is just a very
	 * simple protocol, but it works
	 * 
	 * We could modify it in the future
	 * 
	 * 
	 * @param args
	 * @return
	 */
	public static String createMessage(String... args) {
		JSONArray result = new JSONArray();
		for (String str : args) {
			result.put(str);
		}

		return result.toString();
	}

	/**
	 * decode the message from jsonstring
	 * 
	 * @param str
	 * @return
	 */
	public static String[] decodeMessage(String str) {

		if (str == null || str.equals("")) {
			return new String[0];
		}

		JSONArray transitListArray = new JSONArray(str);
		String[] messages = new String[transitListArray.length()];
		for (int i = 0; i < transitListArray.length(); i++) {
			messages[i] = transitListArray.getString(i);
		}

		if (messages.length == 1 && messages[0].equals("")) {
			return new String[0];
		}
		return messages;
	}

	/**
	 * transfer resultset into json string
	 * 
	 * @param resultSet
	 * @return
	 */
	public static String resultSetToJson(ResultSet resultSet) {
		// JSON array
		JSONArray array = new JSONArray();

		try {
			// obtain number of rows
			ResultSetMetaData metaData = resultSet.getMetaData();
			int columnCount = metaData.getColumnCount();

			// ResultSet to JSON
			while (resultSet.next()) {
				JSONObject jsonObj = new JSONObject();
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = resultSet.getString(columnName);
					jsonObj.put(columnName, value);
				}
				array.put(jsonObj);
			}

		} catch (JSONException e1) {
			System.out.println("JSONException occurred");
		} catch (SQLException e1) {
			System.out.println("SQLException occurred");
		}

		return array.toString();
	}
}
