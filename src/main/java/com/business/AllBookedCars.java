package com.business;



public class AllBookedCars {
    private String userId;
    private String carId;
    private String pickupLocation;
    private String pickupDate;
    private String dropoffDate;
    private String rentalDate;

    // Constructors
    public AllBookedCars() {
        // Default constructor
    }

    public AllBookedCars(String userId, String carId, String pickupLocation, String pickupDate,
                      String dropoffDate, String rentalDate) {
        this.userId = userId;
        this.carId = carId;
        this.pickupLocation = pickupLocation;
        this.pickupDate = pickupDate;
        this.dropoffDate = dropoffDate;
        this.rentalDate = rentalDate;
    }

    // Getters and Setters
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getPickupDate() {
        return pickupDate;
    }

    public void setPickupDate(String pickupDate) {
        this.pickupDate = pickupDate;
    }

    public String getDropoffDate() {
        return dropoffDate;
    }

    public void setDropoffDate(String dropoffDate) {
        this.dropoffDate = dropoffDate;
    }

    public String getRentalDate() {
        return rentalDate;
    }

    public void setRentalDate(String rentalDate) {
        this.rentalDate = rentalDate;
    }

    // Optional toString() method for debugging or logging
    @Override
    public String toString() {
        return "CarBooking{" +
                "userId='" + userId + '\'' +
                ", carId='" + carId + '\'' +
                ", pickupLocation='" + pickupLocation + '\'' +
                ", pickupDate='" + pickupDate + '\'' +
                ", dropoffDate='" + dropoffDate + '\'' +
                ", rentalDate='" + rentalDate + '\'' +
                '}';
    }
}
