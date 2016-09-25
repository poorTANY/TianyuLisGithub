package dependency;

public class Room {
	
	/**
	 * @author jep537
	 * Class which allows the creation of an object for each room a user creates.
	 */
	private String name;
	private String availability;
	private String numberOfPlayers;
	private String owner;
	private int currentPlayers = 0;
	
	/**
	 * Constructor for Room
	 * @param name Name of room
	 * @param availability Availability of room
	 * @param numberOfPlayers Max number of players of room
	 * @param owner Owner of room
	 */
	public Room(String name, String availability, String numberOfPlayers, String owner){
		this.name = name;
		this.availability = availability;
		this.numberOfPlayers = numberOfPlayers;
		this.owner = owner;
	}

	/**
	 * Equals method for room which only compares the name of the room with another room.
	 */
	@Override
	public boolean equals(Object obj) {
		
		if(obj instanceof Room){
			Room toCompare = (Room)obj;
			return this.name.equals(toCompare.name);
		}
		return false;
		
	}

	/**
	 * @return name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return availability
	 */
	public synchronized String getAvailability() {
		return availability;
	}

	/**
	 * @return numberOfPlayers
	 */
	public synchronized String getNumberOfPlayers() {
		return numberOfPlayers;
	}

	/**
	 * @return currentPlayers
	 */
	public synchronized int getCurrentPlayers() {
		return currentPlayers;
	}

	/**
	 * Sets currentPlayers
	 * @param currentPlayers
	 */
	public synchronized void setCurrentPlayers(int currentPlayers) {
		this.currentPlayers = currentPlayers;
	}

	/**
	 * @return owner
	 */
	public String getOwner() {
		return owner;
	}

	/**
	 * Sets availability
	 * @param availability
	 */
	public synchronized void setAvailability(String availability) {
		this.availability = availability;
	}

	/**
	 * Sets number of players
	 * @param numberOfPlayers
	 */
	public synchronized void setNumberOfPlayers(String numberOfPlayers) {
		this.numberOfPlayers = numberOfPlayers;
	}

	

	
	
}
