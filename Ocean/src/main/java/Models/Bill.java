package Models;

public class Bill {
    private String resNo;
    private String fullname;
    private String roomNo;
    private double totalAmount;
    private String paymentType;

    public Bill() {}

    // Getters and Setters
    public String getResNo() { return resNo; }
    public void setResNo(String resNo) { this.resNo = resNo; }
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public String getRoomNo() { return roomNo; }
    public void setRoomNo(String roomNo) { this.roomNo = roomNo; }
    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
    public String getPaymentType() { return paymentType; }
    public void setPaymentType(String paymentType) { this.paymentType = paymentType; }
}