package Models;

public class Booking {
    private String resNo;
    private String fullname;
    private String phone;
    private String roomNo;
    private String checkin;
    private String checkout;

    public Booking() {}

    // Getters and Setters
    public String getResNo() { return resNo; }
    public void setResNo(String resNo) { this.resNo = resNo; }

    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getRoomNo() { return roomNo; }
    public void setRoomNo(String roomNo) { this.roomNo = roomNo; }

    public String getCheckin() { return checkin; }
    public void setCheckin(String checkin) { this.checkin = checkin; }

    public String getCheckout() { return checkout; }
    public void setCheckout(String checkout) { this.checkout = checkout; }
}