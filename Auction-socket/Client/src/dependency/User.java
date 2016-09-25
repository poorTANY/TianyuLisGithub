package dependency;

import java.util.ArrayList;
import java.util.List;

public class User {
	
	boolean authority = true;
	
	private String username;
	private String password;
	private String email;
	private double coins;
	
	private List items;
	
	public User(String username, String password){
		
		this.username = username;
		this.password = password;
		
		this.coins = 0;
		
		this.items = new ArrayList<Integer>();
	}
	
	public User(String username, double coins){
		
		this.username = username;
		this.coins = coins;
	}
	
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}



	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}



	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}



	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}



	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}



	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}



	/**
	 * @return the coins
	 */
	public double getCoins() {
		return coins;
	}



	/**
	 * @param coins the coins to set
	 */
	public void setCoins(double coins) {
		this.coins = coins;
	}



	/**
	 * @return the items
	 */
	public List getItems() {
		return items;
	}



	/**
	 * @param items the items to set
	 */
	public void setItems(List items) {
		this.items = items;
	}



	public boolean getAccept() {
		return authority;
	}

}
