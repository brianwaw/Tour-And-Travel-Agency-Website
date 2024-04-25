package com.business;

public class Propertylisting {
	String roomname;
	String numberofrooms;
	String locationname;
	int price;
	String description;
	
	public Propertylisting(){
		String roomname = "";
		String numberofrooms = "";
		String locationname = "";
		int price = 0;
		String description = "";
	}
	
	public Propertylisting(String roomname, String numberofrooms, String locationname, int price, String description) {
		this.roomname = roomname;
		this.numberofrooms = numberofrooms;
		this.locationname = locationname;
		this.price = price;
		this.description = description;
	}
	
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	
	public void setNumberofrooms(String numberofrooms) {
		this.numberofrooms = numberofrooms;
	}
	
	public void setLocationname(String locationname) {
		this.locationname = locationname;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getRoomname() {
		return roomname;
	}
	
	public String getNumberofrooms() {
		return numberofrooms;
	}
	
	public String getLocationname() {
		return locationname;
	}
	
	public int getPrice() {
		return price;
	}
	
	public String getDescription() {
		return description;
	}
	
}
	
	
