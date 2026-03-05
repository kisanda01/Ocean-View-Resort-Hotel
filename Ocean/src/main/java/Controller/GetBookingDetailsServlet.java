package Controller;

import java.io.IOException;

import DAO.BookingDAO;
import DAO.RoomDAO;
import Models.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GetBookingDetailsServlet")
public class GetBookingDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String resNo = request.getParameter("resNo");

        Booking b = new BookingDAO().getBookingByResNo(resNo);

        response.setContentType("text/plain");

        if (b != null) {
            double price = new RoomDAO().getRoomPrice(b.getRoomNo());

            // Format: Name,RoomNo,Checkin,Checkout,Price
            response.getWriter().write(
                    b.getFullname() + "," +
                    b.getRoomNo() + "," +
                    b.getCheckin() + "," +
                    b.getCheckout() + "," +
                    price
            );
        } else {
            response.getWriter().write("not_found");
        }
    }
}