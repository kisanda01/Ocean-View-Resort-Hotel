package DAO;

import Models.Staff;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StaffDAO {
    public boolean registerStaff(Staff staff) {
        boolean isSuccess = false;
        String sql = "INSERT INTO staff (fullname, email, phone, address, username, password) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, staff.getFullname());
            ps.setString(2, staff.getEmail());
            ps.setString(3, staff.getPhone());
            ps.setString(4, staff.getAddress());
            ps.setString(5, staff.getUsername());
            ps.setString(6, staff.getPassword());
            
            int rows = ps.executeUpdate();
            if (rows > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
    public boolean authenticateStaff(String username, String password) {
        boolean isValid = false;
        String sql = "SELECT * FROM staff WHERE username = ? AND password = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true; 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
}