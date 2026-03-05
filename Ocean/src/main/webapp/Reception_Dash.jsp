<%@ page import="java.util.List" %>
<%@ page import="DAO.RoomDAO" %>
<%@ page import="DAO.BookingDAO" %>
<%@ page import="Models.Room" %>

<%
    RoomDAO roomDAO = new RoomDAO();
    BookingDAO bookingDAO = new BookingDAO();
    List<Room> rooms = roomDAO.getAllRooms();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reception Dashboard - Ocean View</title>
    <link rel="stylesheet" type="text/css" href="Reception_Dash.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<nav class="sidebar">
    <div class="sidebar-header">
        <div class="sidebar-logo">&#127958;</div>
        <h3>Ocean View</h3>
        <span class="sidebar-role">Reception Desk</span>
    </div>

    <ul class="nav-links">
        <li><a href="register_guest.jsp"><span class="nav-icon">&#128100;</span> Register Guest</a></li>
        <li><a href="Booking.jsp"><span class="nav-icon">&#128197;</span> Add Booking</a></li>
        <li><a href="Billing.jsp"><span class="nav-icon">&#128179;</span> Billing</a></li>
        <li><a href="viewguests.jsp"><span class="nav-icon">&#128101;</span> View Guests</a></li>
        <li><a href="help.jsp"><span class="nav-icon">&#10067;</span> Help Section</a></li>
    </ul>

    <div class="sidebar-footer">
        <a href="Home.jsp" class="exit-link">
            <span class="nav-icon">&#128682;</span> Exit
        </a>
    </div>
</nav>

<div class="main-content">

    <div class="page-topbar">
        <div class="topbar-left">
            <h1>Room Overview</h1>
            <p class="page-sub">Browse and manage all resort rooms</p>
        </div>
        <div class="room-stats">
            <%
                int availCount = 0, bookedCount = 0;
                for (Room r : rooms) {
                    if (bookingDAO.isRoomBooked(r.getRoomNo())) bookedCount++;
                    else availCount++;
                }
            %>
            <div class="stat-chip available-chip">
                <span class="chip-dot"></span>
                <span><%= availCount %> Available</span>
            </div>
            <div class="stat-chip booked-chip">
                <span class="chip-dot"></span>
                <span><%= bookedCount %> Booked</span>
            </div>
        </div>
    </div>

    <div class="room-container">
        <%
            for (Room room : rooms) {
                boolean isBooked = bookingDAO.isRoomBooked(room.getRoomNo());
        %>
        <div class="room-card <%= isBooked ? "is-booked" : "is-available" %>">

            <div class="room-img-wrap">
                <img src="uploads/<%= room.getRoomPhoto() %>" alt="Room <%= room.getRoomNo() %>">
                <div class="status-badge <%= isBooked ? "badge-booked" : "badge-available" %>">
                    <%= isBooked ? "&#128683; Booked" : "&#10003; Available" %>
                </div>
                <div class="room-type-ribbon"><%= room.getRoomType() %></div>
            </div>

            <div class="room-info">

                <div class="room-title-row">
                    <h3>Room <span class="room-num"><%= room.getRoomNo() %></span></h3>
                </div>

                <div class="room-meta">
                    <div class="meta-item">
                        <span class="meta-label">&#10024; Facilities</span>
                        <span class="meta-value"><%= room.getFacilities() %></span>
                    </div>
                    <div class="meta-item">
                        <span class="meta-label">&#128203; Description</span>
                        <span class="meta-value desc"><%= room.getDescription() %></span>
                    </div>
                </div>

                <div class="room-footer">
                    <div class="price-block">
                        <span class="price-night">per night</span>
                        <div class="price-row">
                            <span class="price-currency">Rs.</span>
                            <span class="price-amount"><%= String.format("%,.2f", room.getPrice()) %></span>
                        </div>
                    </div>
                    <div class="status-dot-wrap">
                        <div class="status-dot <%= isBooked ? "dot-booked" : "dot-available" %>"></div>
                        <span class="status-label"><%= isBooked ? "Booked" : "Available" %></span>
                    </div>
                </div>

            </div>
        </div>
        <%
            }
        %>
    </div>

</div>

</body>
</html>
