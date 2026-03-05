package Models;

public class Guest {
    private String fullname;
    private String idPassport;
    private String phone;
    private String email;
    private String address;

    public Guest() {}

    // Getters and Setters
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

    public String getIdPassport() { return idPassport; }
    public void setIdPassport(String idPassport) { this.idPassport = idPassport; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}