package Controller;

import DAO.GuestDAO;
import Models.Guest;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateGuestServlet", urlPatterns = {"/UpdateGuestServlet"})
public class UpdateGuestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String idPassport = request.getParameter("idPassport");
        String fullname   = request.getParameter("fullname");
        String phone      = request.getParameter("phone");
        String email      = request.getParameter("email");
        String address    = request.getParameter("address");

        System.out.println("=== UpdateGuestServlet called ===");
        System.out.println("idPassport : " + idPassport);
        System.out.println("fullname   : " + fullname);
        System.out.println("phone      : " + phone);
        System.out.println("email      : " + email);
        System.out.println("address    : " + address);

        if (idPassport == null || idPassport.trim().isEmpty()) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Error: Passport ID is required!');");
            out.println("location='view_guests.jsp';");
            out.println("</script>");
            return;
        }

        Guest guest = new Guest();
        guest.setIdPassport(idPassport.trim());
        guest.setFullname(fullname);
        guest.setPhone(phone);
        guest.setEmail(email);
        guest.setAddress(address);

        GuestDAO dao = new GuestDAO();
        boolean success = dao.updateGuest(guest);

        System.out.println("Update result: " + success);

        out.println("<script type='text/javascript'>");

        if (success) {
            out.println("alert('Guest updated successfully!');");
        } else {
            out.println("alert('Error updating guest!');");
        }

        out.println("location='viewguests.jsp';");
        out.println("</script>");
    }
}