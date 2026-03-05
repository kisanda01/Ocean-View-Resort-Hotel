<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guest Registration</title>
     <link rel="stylesheet" href="<%= request.getContextPath() %>/register_guest.css?v=1.1">
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@400;700&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet">

    <%
        String status = request.getParameter("status");
        if ("success".equals(status)) {
    %>
        <script type="text/javascript">alert("Guest registered successfully!");</script>
    <%
        } else if ("error".equals(status)) {
    %>
        <script type="text/javascript">alert("Error in registration. Please try again.");</script>
    <%
        }
    %>

</head>
<body>

<div class="page-wrapper">
    <div class="top-bar">
        <a href="Reception_Dash.jsp" class="back-btn">
            <span class="back-arrow">&#8592;</span>
            <span>Back to Dashboard</span>
        </a>
    </div>
    <div class="form-container">
        <div class="form-card">
            <div class="card-header">
                <div class="header-icon">&#128100;</div>
                <h2>Guest Registration</h2>
                <p>Enter guest details to complete the registration</p>
            </div>
            <form action="RegisterGuestServlet" method="post">
                <div class="form-body">
                    <div class="input-group">
                        <label for="fullname">Full Name</label>
                        <input type="text" id="fullname" name="fullname" placeholder="Enter guest's full name" required>
                    </div>
                    <div class="input-row">
                        <div class="input-group">
                            <label for="idPassport">ID No / Passport No</label>
                            <input type="text" id="idPassport" name="idPassport" placeholder="ID or Passport Number" required>
                        </div>
                        <div class="input-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" placeholder="e.g. 0771234567" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" placeholder="example@mail.com" required>
                    </div>
                    <div class="input-group">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="3" placeholder="Enter guest's permanent address" required></textarea>
                    </div>
                    <div class="button-group">
                        <button type="submit" class="register-btn">&#10003;&nbsp; Register Guest</button>
                        <button type="reset" class="clear-btn">&#8635; Clear All</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
