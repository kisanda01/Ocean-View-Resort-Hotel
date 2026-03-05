package Controller;

import DAO.RoomDAO;
import Models.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet(name = "UpdateRoomServlet", urlPatterns = {"/UpdateRoomServlet"})
@MultipartConfig(maxFileSize = 5 * 1024 * 1024)
public class UpdateRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String roomNo      = request.getParameter("roomNo");
        String roomType    = request.getParameter("roomType");
        String facilities  = request.getParameter("facilities");
        String description = request.getParameter("description");
        String oldPhoto    = request.getParameter("oldPhoto");
        String priceStr    = request.getParameter("price");

        System.out.println("=== UpdateRoomServlet called ===");
        System.out.println("roomNo: " + roomNo);
        System.out.println("roomType: " + roomType);
        System.out.println("price: " + priceStr);

        if (roomNo == null || roomNo.trim().isEmpty()) {
            out.println("<script>");
            out.println("alert('Room Number is required!');");
            out.println("location='view_rooms.jsp';");
            out.println("</script>");
            return;
        }

        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (Exception e) {
            price = 0;
        }

        // ── Handle photo upload ──
        String photoFileName = oldPhoto;
        Part photoPart = request.getPart("roomPhoto");

        if (photoPart != null && photoPart.getSize() > 0) {

            String originalName = Paths.get(photoPart.getSubmittedFileName())
                                       .getFileName().toString();

            String ext = originalName.contains(".")
                    ? originalName.substring(originalName.lastIndexOf('.'))
                    : ".jpg";

            photoFileName = "room_" + roomNo + "_" + System.currentTimeMillis() + ext;

            String uploadDir = getServletContext().getRealPath("/roomImages");
            File dir = new File(uploadDir);

            if (!dir.exists()) {
                dir.mkdirs();
            }

            try (InputStream is = photoPart.getInputStream()) {
                Files.copy(is,
                        new File(dir, photoFileName).toPath(),
                        StandardCopyOption.REPLACE_EXISTING);
            }

            System.out.println("Photo saved: " + photoFileName);
        }

        // ── Set Room Object ──
        Room room = new Room();
        room.setRoomNo(roomNo.trim());
        room.setRoomType(roomType);
        room.setFacilities(facilities);
        room.setDescription(description);
        room.setRoomPhoto(photoFileName);
        room.setPrice(price);

        // ── Update Database ──
        RoomDAO dao = new RoomDAO();
        boolean success = dao.updateRoom(room);

        System.out.println("Update result: " + success);

        out.println("<script>");

        if (success) {
            out.println("alert('Room updated successfully!');");
        } else {
            out.println("alert('Room update failed! Check database connection or SQL query.');");
        }

        out.println("location='view_rooms.jsp';");
        out.println("</script>");
    }
}