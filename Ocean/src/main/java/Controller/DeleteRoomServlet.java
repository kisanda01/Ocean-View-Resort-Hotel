package Controller;

import DAO.RoomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteRoomServlet", urlPatterns = {"/DeleteRoomServlet"})
public class DeleteRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomNo = request.getParameter("roomNo");

        System.out.println("=== DeleteRoomServlet called ===");
        System.out.println("roomNo: " + roomNo);

        RoomDAO dao = new RoomDAO();
        boolean success = dao.deleteRoom(roomNo);
        System.out.println("Delete result: " + success);

        if (success) {
            response.sendRedirect("view_rooms.jsp?success=deleted");
        } else {
            response.sendRedirect("view_rooms.jsp?error=true");
        }
    }
}