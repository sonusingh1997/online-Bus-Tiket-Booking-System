package project.com;

public class Bus {
	private int busId;
	private String busNo;
	private String busType;
	private int totalSeats;
	private String ownerName;
	private String sourceStation;
	private String destinationStation;
	private String departureTime;
	private String arrivalTime;
	
	public Bus() {
		// TODO Auto-generated constructor stub
	}
	public int getBusId() {
		return busId;
	}
	public void setBusId(int busId) {
		this.busId = busId;
	}
	public String getBusNo() {
		return busNo;
	}
	public void setBusNo(String busNo) {
		this.busNo = busNo;
	}
	public String getBusType() {
		return busType;
	}
	public void setBusType(String busType) {
		this.busType = busType;
	}
	public int getTotalSeats() {
		return totalSeats;
	}
	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getSourceStation() {
		return sourceStation;
	}
	public void setSource(String sourceStation) {
		this.sourceStation = sourceStation;
	}
	public String getDestinationStation() {
		return destinationStation;
	}
	public void setDestination(String destinationStation) {
		this.destinationStation = destinationStation;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

}
