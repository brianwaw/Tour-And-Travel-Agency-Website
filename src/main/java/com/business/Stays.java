package com.business;

public class Stays {
	String location;
	String entry_date;
	String exit_date;
	String traveler;
	String rooms;
	 public Stays() {
		String location = "";
		String entry_date = "";
		String exit_date = "";
		String traveler = "";
		String rooms = "";
	 }
	 public Stays(String location, String entry_date, String exit_date, String traveler, String rooms){
		 this.location = location;
		 this.entry_date = entry_date;
		 this.exit_date = exit_date;
		 this.traveler = traveler;
		 this.rooms = rooms;
	 }
	 public void setLocation(String location) {
		 this.location = location;
	 }
	 public String getLocation()
	 {
		 return location;
	 }
	 public void setEntry_date(String entry_date) {
		 this.entry_date = entry_date;
	 }
	 public String getEntry_date()
	 {
		 return entry_date;
	 }
	 public void setExit_date(String exit_date) {
		 this.exit_date = exit_date;
	 }
	 public String getExit_date()
	 {
		 return exit_date;
	 }
	 public void setTraveler(String traveler) {
		 this.traveler = traveler;
	 }
	 public String getTraveler()
	 {
		 return traveler;
	 }
	 public void setRooms(String rooms) {
		 this.rooms= rooms;
	 }
	 public String getRooms()
	 {
		 return rooms;
	 }
}
