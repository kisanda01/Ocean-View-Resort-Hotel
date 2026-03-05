<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book a Room</title>
    <link rel="stylesheet" type="text/css" href="Booking.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<%
    String reservationNo = "RES-" + System.currentTimeMillis() % 1000000;
    String status = request.getParameter("status");
%>

<div class="page-wrapper">

    <!-- Decorative side panel -->
    <div class="side-panel">
        <div class="side-content">
            <div class="hotel-badge">★ PREMIER SUITES</div>
            <h1 class="side-title">Experience<br>Luxury<br>Like Never<br>Before.</h1>
            <p class="side-tagline">Your perfect stay begins with a single booking.</p>
            <div class="side-dots">
                <span class="dot active"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>
        </div>
        <div class="side-overlay"></div>
    </div>

    <!-- Main form area -->
    <div class="form-wrapper">
        <div class="form-inner">

            <div class="form-header">
                <button type="button" onclick="window.location.href='Reception_Dash.jsp'" class="back-btn">
    <span class="back-arrow">←</span> Back
</button>
                <span class="step-label">NEW RESERVATION</span>
                <h2 class="form-title">Book a Room</h2>
            </div>

            <% if("success".equals(status)) { %>
            <div class="success-banner">
                <span class="success-icon">✓</span>
                <span>Booking Confirmed Successfully!</span>
            </div>
            <% } %>

            <!-- Guest Search -->
            <div class="search-block">
                <label class="search-label">GUEST LOOKUP</label>
                <div class="search-row">
                    <div class="search-input-wrap">
                        <span class="search-icon-left">🔍</span>
                        <input type="text" id="searchID" placeholder="NIC or Passport Number">
                    </div>
                    <button type="button" onclick="searchGuest()" class="search-btn">Search</button>
                </div>
            </div>

            <div class="divider"><span>BOOKING DETAILS</span></div>

            <form action="AddBookingServlet" method="post">

                <div class="field-group">
                    <label>Reservation No.</label>
                    <div class="res-badge">
                        <span class="res-icon">🔖</span>
                        <input type="text" name="resNo" value="<%= reservationNo %>" readonly class="readonly-field res-input">
                    </div>
                </div>

                <div class="field-group">
                    <label for="fullname">Guest Full Name</label>
                    <input type="text" id="fullname" name="fullname" placeholder="Auto-filled after search" readonly required class="auto-field">
                </div>

                <div class="field-row">
                    <div class="field-group">
                        <label for="phone">Phone Number</label>
                        <input type="text" id="phone" name="phone" placeholder="Auto-filled" readonly required class="auto-field">
                    </div>
                    <div class="field-group">
                        <label for="roomNo">Room Number</label>
                        <input type="text" id="roomNo" name="roomNo" placeholder="e.g. 204" required>
                    </div>
                </div>

                <div class="field-row">
                    <div class="field-group">
                        <label for="checkin">Check-in Date</label>
                        <input type="date" id="checkin" name="checkin" required>
                    </div>
                    <div class="field-group">
                        <label for="checkout">Check-out Date</label>
                        <input type="date" id="checkout" name="checkout" required>
                    </div>
                </div>

                <div class="action-row">
                    <button type="reset" class="clear-btn">Clear</button>
                    <button type="submit" class="confirm-btn">
                        <span>Confirm Booking</span>
                        <span class="btn-arrow">→</span>
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>

<script>
    // Set min dates to today
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('checkin').min = today;
    document.getElementById('checkout').min = today;

    document.getElementById('checkin').addEventListener('change', function() {
        document.getElementById('checkout').min = this.value;
    });

    function searchGuest() {
        let idVal = document.getElementById("searchID").value.trim();
        if (idVal === "") {
            showAlert("Please enter a NIC or Passport Number");
            return;
        }

        const btn = document.querySelector('.search-btn');
        btn.textContent = "Searching...";
        btn.disabled = true;

        fetch('GetGuestDetailsServlet?id=' + encodeURIComponent(idVal))
            .then(response => response.text())
            .then(data => {
                if (data !== "not_found") {
                    let details = data.split(",");
                    document.getElementById("fullname").value = details[0];
                    document.getElementById("phone").value = details[1];
                    document.getElementById("fullname").classList.add("filled");
                    document.getElementById("phone").classList.add("filled");
                } else {
                    showAlert("Guest not found! Please register the guest first.");
                    document.getElementById("fullname").value = "";
                    document.getElementById("phone").value = "";
                    document.getElementById("fullname").classList.remove("filled");
                    document.getElementById("phone").classList.remove("filled");
                }
            })
            .catch(error => console.error('Error:', error))
            .finally(() => {
                btn.textContent = "Search";
                btn.disabled = false;
            });
    }

    function showAlert(msg) {
        const existing = document.querySelector('.custom-alert');
        if (existing) existing.remove();
        const el = document.createElement('div');
        el.className = 'custom-alert';
        el.textContent = msg;
        document.querySelector('.form-inner').prepend(el);
        setTimeout(() => el.remove(), 3500);
    }
</script>

</body>
</html>
