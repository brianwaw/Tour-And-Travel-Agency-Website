package com.business;

public class AllRoomsBookedBean {
    private String userId;
    private String roomId;
    private String entryDate;
    private String exitDate;
    private String numberOfRooms;
    private String bookingDate;

    // Constructors
    public AllRoomsBookedBean() {
        // Default constructor
    }

    public AllRoomsBookedBean(String userId, String roomId, String entryDate, String exitDate,
                              String numberOfRooms, String bookingDate) {
        this.userId = userId;
        this.roomId = roomId;
        this.entryDate = entryDate;
        this.exitDate = exitDate;
        this.numberOfRooms = numberOfRooms;
        this.bookingDate = bookingDate;
    }

    // Getters and Setters
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(String entryDate) {
        this.entryDate = entryDate;
    }

    public String getExitDate() {
        return exitDate;
    }

    public void setExitDate(String exitDate) {
        this.exitDate = exitDate;
    }

    public String getNumberOfRooms() {
        return numberOfRooms;
    }

    public void setNumberOfRooms(String numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    // toString() method for debugging and logging
    @Override
    public String toString() {
        return "AllRoomsBookedBean{" +
                "userId='" + userId + '\'' +
                ", roomId='" + roomId + '\'' +
                ", entryDate='" + entryDate + '\'' +
                ", exitDate='" + exitDate + '\'' +
                ", numberOfRooms=" + numberOfRooms +'\''+
                ", bookingDate='" + bookingDate + '\'' +
                '}';
    }
}
