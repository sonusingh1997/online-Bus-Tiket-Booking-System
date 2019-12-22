package project.com;

public class Ticket {
		private int ticketId;
		private String bookedSeat;
		private String busNo;
		private String source;
		private String des;
		private String busType;
		private String departureTime;
		private String arrivalTime;
		
		
		public Ticket() {
			// TODO Auto-generated constructor stub
		}

		public int getTicketId() {
			return ticketId;
		}
		public void setTicketId(int ticketId) {
			this.ticketId = ticketId;
		}
		public String getBookedSeat() {
			return bookedSeat;
		}
		public void setBookedSeat(String bookedSeat) {
			this.bookedSeat = bookedSeat;
		}
		public String getBusNo() {
			return busNo;
		}
		public void setBusNo(String busNo) {
			this.busNo = busNo;
		}
		public String getSource() {
			return source;
		}
		public void setSource(String source) {
			this.source = source;
		}
		public String getDes() {
			return des;
		}
		public void setDes(String des) {
			this.des = des;
		}
		public String getBusType() {
			return busType;
		}
		public void setBusType(String busType) {
			this.busType = busType;
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
