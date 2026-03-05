<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/staff_reg.css?v=1.1">
</head>
<body>

<div class="page-wrapper">
    <div class="top-bar">
        <a href="Admin_Dash.jsp" class="back-btn">
            <span class="back-arrow">&#8592;</span>
            <span>Back to Dashboard</span>
        </a>
    </div>

    <div class="form-container">
        <div class="form-card">
            <div class="card-header">
                <span class="header-icon">&#128100;</span>
                <h2>Staff Registration</h2>
                <p>Fill in the details to create a new staff account</p>
            </div>
            <form action="StaffRegistrationServlet" method="post">
                <div class="section-divider"><span>Personal Information</span></div>
                <div class="input-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" placeholder="Enter full name" required>
                </div>
                <div class="input-row">
                    <div class="input-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" placeholder="example@mail.com" required>
                    </div>
                    <div class="input-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" placeholder="07XXXXXXXX" required>
                    </div>
                </div>
                <div class="input-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" rows="3" placeholder="Enter home address" required></textarea>
                </div>
                <div class="section-divider"><span>Account Credentials</span></div>
                <div class="input-row">
                    <div class="input-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" placeholder="Choose a username" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Password</label>
                        <div class="pass-wrapper">
                            <input type="password" id="password" name="password" placeholder="Create a password" required>
                            <button type="button" class="toggle-pass" onclick="togglePass()">&#128065;</button>
                        </div>
                    </div>
                </div>
                <div class="btn-group">
                    <button type="submit" class="register-btn">&#10003;&nbsp; Register Staff</button>
                    <button type="reset" class="reset-btn">Clear all fields</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function togglePass() {
        const p = document.getElementById('password');
        const btn = document.querySelector('.toggle-pass');
        if (p.type === 'password') {
            p.type = 'text';
            btn.innerHTML = '&#128584;';
        } else {
            p.type = 'password';
            btn.innerHTML = '&#128065;';
        }
    }
</script>

</body>
</html>
