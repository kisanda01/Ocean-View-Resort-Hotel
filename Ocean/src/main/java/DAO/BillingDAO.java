package DAO;
import Models.Bill;
import java.sql.*;

public class BillingDAO {
    public boolean saveBill(Bill bill) {
        String sql = "INSERT INTO billings (resNo, fullname, roomNo, totalAmount, paymentType) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, bill.getResNo());
            ps.setString(2, bill.getFullname());
            ps.setString(3, bill.getRoomNo());
            ps.setDouble(4, bill.getTotalAmount());
            ps.setString(5, bill.getPaymentType());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }
}