package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Models.Guest;
import DAO.GuestDAO;

@WebServlet("/RegisterGuestServlet")
public class RegisterGuestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String fullname = request.getParameter("fullname");
        String idPassport = request.getParameter("idPassport");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Guest guest = new Guest();
        guest.setFullname(fullname);
        guest.setIdPassport(idPassport);
        guest.setPhone(phone);
        guest.setEmail(email);
        guest.setAddress(address);

        GuestDAO guestDAO = new GuestDAO();
        if (guestDAO.registerGuest(guest)) {
            response.sendRedirect("register_guest.jsp?status=success");
        } else {
            response.sendRedirect("register_guest.jsp?status=error");
        }
    }
}