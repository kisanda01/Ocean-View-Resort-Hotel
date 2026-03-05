package Models;

public class Room {
    private String roomNo;
    private String roomType;
    private String facilities;
    private String description;
    private String roomPhoto; 
    private double price; 

    public Room() {}

    // Getters and Setters
    public String getRoomNo() { return roomNo; }
    public void setRoomNo(String roomNo) { this.roomNo = roomNo; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public String getFacilities() { return facilities; }
    public void setFacilities(String facilities) { this.facilities = facilities; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getRoomPhoto() { return roomPhoto; }
    public void setRoomPhoto(String roomPhoto) { this.roomPhoto = roomPhoto; }

    public double getPrice() { return price; } 
    public void setPrice(double price) { this.price = price; } 
}