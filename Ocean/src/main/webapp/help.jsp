<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reception Help Center - Ocean View</title>
     <link rel="stylesheet" href="<%= request.getContextPath() %>/help.css?v=1.1">
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@400;700&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="help-wrapper">

    <!-- Wave top -->
    <div class="wave-top">
        <svg viewBox="0 0 1440 90" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,45 C360,90 1080,0 1440,45 L1440,0 L0,0 Z" fill="currentColor"/>
        </svg>
    </div>

    <!-- Header -->
    <header class="help-header">
        <div class="resort-badge">&#9875;</div>
        <h1>Receptionist User Guide</h1>
        <p>Welcome to Ocean View Resort. Use this guide to understand your daily tasks.</p>
    </header>

    <!-- Cards -->
    <div class="help-container">
        <div class="help-grid">

            <div class="help-card">
                <div class="step-number">01</div>
                <div class="card-icon">&#128100;</div>
                <h3>Registering a Guest</h3>
                <p>Before making a booking, every new guest must be registered in the system.</p>
                <ul>
                    <li>Go to <strong>Register Guest</strong> section.</li>
                    <li>Enter Full Name, NIC/Passport, and Contact details.</li>
                    <li>Click <strong>Register</strong> to save details to the database.</li>
                </ul>
            </div>

            <div class="help-card">
                <div class="step-number">02</div>
                <div class="card-icon">&#128197;</div>
                <h3>Making a Reservation</h3>
                <p>Once the guest is registered, you can assign them a room.</p>
                <ul>
                    <li>Search the guest using their <strong>NIC or Passport</strong>.</li>
                    <li>Enter the <strong>Room Number</strong> manually.</li>
                    <li>Select <strong>Check-in</strong> and <strong>Check-out</strong> dates.</li>
                    <li>The system will auto-generate a <strong>Reservation Number</strong>.</li>
                </ul>
            </div>

            <div class="help-card">
                <div class="step-number">03</div>
                <div class="card-icon">&#128179;</div>
                <h3>Billing &amp; Payments</h3>
                <p>When a guest is ready to leave, follow these steps to finalize the stay.</p>
                <ul>
                    <li>Enter the <strong>Reservation Number</strong> in the Billing search bar.</li>
                    <li>The system will auto-fill guest details and <strong>Room Price</strong>.</li>
                    <li>Add the <strong>Tax (%)</strong> and select the <strong>Payment Method</strong>.</li>
                    <li>Verify the <strong>Total Amount</strong> and click Generate Bill.</li>
                </ul>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <footer class="help-footer">
        <div class="footer-inner">
            <div class="footer-icon">&#128222;</div>
            <p class="footer-text">Need Technical Support? Contact the System Administrator.</p>
            <a href="Reception_Dash.jsp" class="back-btn">
                <span class="back-arrow">&#8592;</span>
                Back to Dashboard
            </a>
        </div>
        <div class="footer-brand">OCEAN VIEW RESORT &nbsp;&#183;&nbsp; RECEPTION PORTAL</div>
    </footer>

</div>

</body>
</html>
