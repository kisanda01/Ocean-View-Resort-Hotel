package DAO;

import Models.Guest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GuestDAO {

    // ✅ Register new guest
    public boolean registerGuest(Guest guest) {
        boolean isSuccess = false;
        String sql = "INSERT INTO guests (fullname, idPassport, phone, email, address) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, guest.getFullname());
            ps.setString(2, guest.getIdPassport());
            ps.setString(3, guest.getPhone());
            ps.setString(4, guest.getEmail());
            ps.setString(5, guest.getAddress());

            if (ps.executeUpdate() > 0) isSuccess = true;

        } catch (Exception e) { e.printStackTrace(); }
        return isSuccess;
    }

    // ✅ Get guest by ID/Passport
    public Guest getGuestByID(String idPassport) {
        Guest guest = null;
        String sql = "SELECT fullname, phone FROM guests WHERE idPassport = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, idPassport);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                guest = new Guest();
                guest.setFullname(rs.getString("fullname"));
                guest.setPhone(rs.getString("phone"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return guest;
    }

    // ✅ Get all registered guests
    public List<Guest> getAllGuests() {
        List<Guest> list = new ArrayList<>();
        String sql = "SELECT * FROM guests ORDER BY fullname ASC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Guest g = new Guest();
                g.setFullname(rs.getString("fullname"));
                g.setIdPassport(rs.getString("idPassport"));
                g.setPhone(rs.getString("phone"));
                g.setEmail(rs.getString("email"));
                g.setAddress(rs.getString("address"));
                list.add(g);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // ✅ Update guest details
    public boolean updateGuest(Guest guest) {
        boolean isSuccess = false;
        String sql = "UPDATE guests SET fullname=?, phone=?, email=?, address=? WHERE idPassport=?";

        System.out.println("=== updateGuest() called ===");
        System.out.println("SQL       : " + sql);
        System.out.println("idPassport: " + guest.getIdPassport());

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            System.out.println("DB Connection: " + (con != null ? "OK" : "FAILED"));

            ps.setString(1, guest.getFullname());
            ps.setString(2, guest.getPhone());
            ps.setString(3, guest.getEmail());
            ps.setString(4, guest.getAddress());
            ps.setString(5, guest.getIdPassport());

            int rows = ps.executeUpdate();
            System.out.println("Rows affected: " + rows);
            if (rows > 0) isSuccess = true;

        } catch (Exception e) {
            System.out.println("updateGuest ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return isSuccess;
    }

    // ✅ Delete guest by ID/Passport
    public boolean deleteGuest(String idPassport) {
        boolean isSuccess = false;
        String sql = "DELETE FROM guests WHERE idPassport = ?";

        System.out.println("=== deleteGuest() called ===");
        System.out.println("idPassport: " + idPassport);

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            System.out.println("DB Connection: " + (con != null ? "OK" : "FAILED"));

            ps.setString(1, idPassport);

            int rows = ps.executeUpdate();
            System.out.println("Rows affected: " + rows);
            if (rows > 0) isSuccess = true;

        } catch (Exception e) {
            System.out.println("deleteGuest ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return isSuccess;
    }
}