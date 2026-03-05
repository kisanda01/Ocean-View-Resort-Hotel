package DAO;

import Models.Room;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {

    // ✅ Add Room
    public boolean addRoom(Room room) {
        boolean isSuccess = false;
        String sql = "INSERT INTO rooms (roomNo, roomType, facilities, description, roomPhoto, price) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, room.getRoomNo().trim());
            ps.setString(2, room.getRoomType());
            ps.setString(3, room.getFacilities());
            ps.setString(4, room.getDescription());
            ps.setString(5, room.getRoomPhoto());
            ps.setDouble(6, room.getPrice());

            int rows = ps.executeUpdate();
            System.out.println("AddRoom Rows Affected: " + rows);

            if (rows > 0) {
                isSuccess = true;
            }

        } catch (Exception e) {
            System.out.println("AddRoom Error:");
            e.printStackTrace();
        }

        return isSuccess;
    }

    // ✅ Get Room Price
    public double getRoomPrice(String roomNo) {
        double price = 0;
        String sql = "SELECT price FROM rooms WHERE roomNo = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, roomNo.trim());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                price = rs.getDouble("price");
            }

        } catch (Exception e) {
            System.out.println("GetRoomPrice Error:");
            e.printStackTrace();
        }

        return price;
    }

    // ✅ Get All Rooms
    public List<Room> getAllRooms() {
        List<Room> roomList = new ArrayList<>();
        String sql = "SELECT * FROM rooms";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room room = new Room();
                room.setRoomNo(rs.getString("roomNo"));
                room.setRoomType(rs.getString("roomType"));
                room.setFacilities(rs.getString("facilities"));
                room.setDescription(rs.getString("description"));
                room.setRoomPhoto(rs.getString("roomPhoto"));
                room.setPrice(rs.getDouble("price"));

                roomList.add(room);
            }

        } catch (Exception e) {
            System.out.println("GetAllRooms Error:");
            e.printStackTrace();
        }

        return roomList;
    }

    // ✅ Get Room By ID
    public Room getRoomById(String roomNo) {
        Room room = null;
        String sql = "SELECT * FROM rooms WHERE roomNo = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, roomNo.trim());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                room = new Room();
                room.setRoomNo(rs.getString("roomNo"));
                room.setRoomType(rs.getString("roomType"));
                room.setFacilities(rs.getString("facilities"));
                room.setDescription(rs.getString("description"));
                room.setRoomPhoto(rs.getString("roomPhoto"));
                room.setPrice(rs.getDouble("price"));
            }

        } catch (Exception e) {
            System.out.println("GetRoomById Error:");
            e.printStackTrace();
        }

        return room;
    }

    // ✅ Update Room
    public boolean updateRoom(Room room) {
        boolean isSuccess = false;
        String sql = "UPDATE rooms SET roomType=?, facilities=?, description=?, roomPhoto=?, price=? WHERE roomNo=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, room.getRoomType());
            ps.setString(2, room.getFacilities());
            ps.setString(3, room.getDescription());
            ps.setString(4, room.getRoomPhoto());
            ps.setDouble(5, room.getPrice());
            ps.setString(6, room.getRoomNo().trim());

            int rows = ps.executeUpdate();
            System.out.println("UpdateRoom Rows Affected: " + rows);

            if (rows > 0) {
                isSuccess = true;
            } else {
                System.out.println("No room found with roomNo: " + room.getRoomNo());
            }

        } catch (Exception e) {
            System.out.println("UpdateRoom Error:");
            e.printStackTrace();
        }

        return isSuccess;
    }

    // ✅ Delete Room
    public boolean deleteRoom(String roomNo) {
        boolean isSuccess = false;
        String sql = "DELETE FROM rooms WHERE roomNo = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, roomNo.trim());

            int rows = ps.executeUpdate();
            System.out.println("DeleteRoom Rows Affected: " + rows);

            if (rows > 0) {
                isSuccess = true;
            }

        } catch (Exception e) {
            System.out.println("DeleteRoom Error:");
            e.printStackTrace();
        }

        return isSuccess;
    }
}