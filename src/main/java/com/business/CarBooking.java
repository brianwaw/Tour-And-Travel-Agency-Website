package com.business;

public class CarBooking {
	
	private String image;   
    private String startDate;
    private String endDate;
    private String rentalDate;
    private String location;
    private String carId;

    public CarBooking(String image, String startDate, String endDate, String rentalDate, String location,String carId) {
        this.image = image;
    	this.carId = carId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.rentalDate = rentalDate;
        this.location = location;
    }

    // Getter and Setter for carId
    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    // Getter and Setter for startDate
    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    // Getter and Setter for endDate
    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    // Getter and Setter for rentalDate
    public String getRentalDate() {
        return rentalDate;
    }

    public void setRentalDate(String rentalDate) {
        this.rentalDate = rentalDate;
    }

    // Getter and Setter for location
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}

