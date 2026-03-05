package DAO;

import Models.Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BookingDAO {

    public boolean addBooking(Booking booking) {
        boolean isSuccess = false;
        String sql = "INSERT INTO bookings (resNo, fullname, phone, roomNo, checkin, checkout) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, booking.getResNo());
            ps.setString(2, booking.getFullname());
            ps.setString(3, booking.getPhone());
            ps.setString(4, booking.getRoomNo());
            ps.setString(5, booking.getCheckin());
            ps.setString(6, booking.getCheckout());

            if (ps.executeUpdate() > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public Booking getBookingByResNo(String resNo) {
        Booking b = null;
        String sql = "SELECT * FROM bookings WHERE resNo = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, resNo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                b = new Booking();
                b.setFullname(rs.getString("fullname"));
                b.setRoomNo(rs.getString("roomNo"));
                b.setCheckin(rs.getString("checkin"));
                b.setCheckout(rs.getString("checkout"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    // ✅ Check if a room is currently booked (checkout date >= today)
    public boolean isRoomBooked(String roomNo) {
        boolean booked = false;
        String sql = "SELECT COUNT(*) FROM bookings WHERE roomNo = ? AND checkout >= CURDATE()";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, roomNo);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                booked = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return booked;
    }
}