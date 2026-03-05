package Controller;

import DAO.GuestDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteGuestServlet", urlPatterns = {"/DeleteGuestServlet"})
public class DeleteGuestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String idPassport = request.getParameter("idPassport");
        if (idPassport == null || idPassport.trim().isEmpty()) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Error: Passport ID is required!');");
            out.println("location='view_guests.jsp';");
            out.println("</script>");
            return;
        }
        GuestDAO dao = new GuestDAO();
        boolean success = dao.deleteGuest(idPassport);

        out.println("<script type='text/javascript'>");

        if (success) {
            out.println("alert('Guest deleted successfully!');");
        } else {
            out.println("alert('Error deleting guest!');");
        }

        out.println("location='viewguests.jsp';");
        out.println("</script>");
    }
}