<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guest Billing</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Billing.css?v=1.1">
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        @media print {
            .search-section, .bill-btn, .print-btn, .page-header, .divider-line, .section-label, .top-bar { display: none; }
            .page-wrapper { padding: 0; background: none; }
            .form-card { box-shadow: none; border: 1px solid #ccc; }
            .form-card::before {
                content: "OCEAN VIEW RESORT — GUEST BILL";
                display: block;
                text-align: center;
                font-size: 22px;
                font-weight: bold;
                margin-bottom: 20px;
                padding-bottom: 12px;
                border-bottom: 2px solid #000;
                font-family: Georgia, serif;
            }
            input, select { border: none !important; background: transparent !important; outline: none !important; }
        }
    </style>
</head>
<body>

<div class="page-wrapper" id="printableArea">

    <!-- Decorative top wave -->
    <div class="wave-top">
        <svg viewBox="0 0 1440 80" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,40 C360,80 1080,0 1440,40 L1440,0 L0,0 Z" fill="currentColor"/>
        </svg>
    </div>

    <div class="page-header">
        <div class="resort-badge">&#9875;</div>
        <h1>Ocean View Resort</h1>
        <p class="tagline">Guest Billing &amp; Checkout</p>
    </div>

    <!-- Back Button -->
    <div class="top-bar">
        <a href="Reception_Dash.jsp" class="back-btn">
            <span class="back-arrow">&#8592;</span>
            <span>Back to Dashboard</span>
        </a>
    </div>

    <div class="form-container">
        <div class="form-card">

            <% if("success".equals(request.getParameter("status"))) { %>
                <div class="success-banner">
                    <span class="success-icon">&#10003;</span>
                    Bill paid and saved successfully!
                </div>
            <% } %>

            <!-- Search -->
            <div class="search-section">
                <div class="search-icon-wrap">&#128269;</div>
                <input type="text" id="resSearch" placeholder="Enter Reservation Number…">
                <button type="button" onclick="searchBooking()" class="search-btn">Search</button>
            </div>

            <div class="divider-line"><span>Reservation Details</span></div>

            <form action="ProcessBillingServlet" method="post">
                <input type="hidden" id="resNoHidden" name="resNoHidden">

                <div class="input-row">
                    <div class="input-group">
                        <label>Guest Full Name</label>
                        <input type="text" id="fullname" name="fullname" readonly class="readonly-field">
                    </div>
                    <div class="input-group">
                        <label>Room Number</label>
                        <input type="text" id="roomNo" name="roomNo" readonly class="readonly-field">
                    </div>
                </div>

                <div class="input-row">
                    <div class="input-group">
                        <label>Check-in Date</label>
                        <div class="icon-input">
                            <span class="field-icon">&#128197;</span>
                            <input type="text" id="checkin" name="checkin" readonly class="readonly-field">
                        </div>
                    </div>
                    <div class="input-group">
                        <label>Check-out Date</label>
                        <div class="icon-input">
                            <span class="field-icon">&#128197;</span>
                            <input type="text" id="checkout" name="checkout" readonly class="readonly-field">
                        </div>
                    </div>
                </div>

                <div class="input-group">
                    <label>Room Price <span class="label-sub">(per night)</span></label>
                    <div class="icon-input">
                        <span class="field-icon currency-icon">Rs.</span>
                        <input type="text" id="roomPrice" name="roomPrice" readonly class="readonly-field highlight-price">
                    </div>
                </div>

                <div class="divider-line"><span>Billing Summary</span></div>

                <div class="billing-summary-grid">
                    <div class="summary-box">
                        <span class="summary-label">Nights</span>
                        <span class="summary-value" id="nightsDisplay">—</span>
                    </div>
                    <div class="summary-box">
                        <span class="summary-label">Tax (3%)</span>
                        <input type="number" id="tax" name="tax" readonly class="summary-value-input readonly-field">
                    </div>
                    <div class="summary-box accent-box">
                        <span class="summary-label">Payment Method</span>
                        <select id="paymentType" name="paymentType" required class="summary-select">
                            <option value="" disabled selected>Select</option>
                            <option value="Cash">&#128181; Cash</option>
                            <option value="Card">&#128179; Card</option>
                        </select>
                    </div>
                </div>

                <div class="total-block">
                    <div class="total-label">Total Amount Due</div>
                    <div class="total-currency">Rs.</div>
                    <input type="number" id="totalAmount" name="totalAmount" step="0.01" required readonly class="total-amount-field">
                </div>

                <div class="button-group">
                    <button type="submit" class="bill-btn">
                        <span class="btn-icon">&#128524;</span>
                        Generate &amp; Pay Bill
                    </button>
                    <button type="button" class="print-btn" onclick="printBill()">
                        <span class="btn-icon">&#128438;</span>
                        Print PDF
                    </button>
                </div>

            </form>
        </div>
    </div>

    <!-- Decorative bottom -->
    <div class="bottom-deco">OCEAN VIEW RESORT &nbsp;&#183;&nbsp; GUEST SERVICES</div>
</div>

<script>
    function searchBooking() {
        let resNo = document.getElementById("resSearch").value;
        if(resNo === "") return alert("Please enter Reservation No");

        fetch('GetBookingDetailsServlet?resNo=' + resNo)
            .then(response => response.text())
            .then(data => {
                if(data !== "not_found") {
                    let d = data.split(",");
                    document.getElementById("fullname").value = d[0];
                    document.getElementById("roomNo").value   = d[1];
                    document.getElementById("checkin").value  = d[2];
                    document.getElementById("checkout").value = d[3];
                    document.getElementById("roomPrice").value = d[4];
                    document.getElementById("resNoHidden").value = resNo;
                    calculateTotal();
                } else {
                    alert("No booking found!");
                }
            });
    }

    function calculateTotal() {
        let cin   = new Date(document.getElementById("checkin").value);
        let cout  = new Date(document.getElementById("checkout").value);
        let price = parseFloat(document.getElementById("roomPrice").value);

        let diff   = cout.getTime() - cin.getTime();
        let nights = Math.ceil(diff / (1000 * 3600 * 24));
        if (nights <= 0) nights = 1;

        document.getElementById("nightsDisplay").textContent = nights + (nights === 1 ? " night" : " nights");

        let subTotal  = nights * price;
        let taxRate   = 3;
        let taxAmount = subTotal * (taxRate / 100);
        let total     = subTotal + taxAmount;

        document.getElementById("tax").value         = taxRate;
        document.getElementById("totalAmount").value = total.toFixed(2);

        // animate total block
        let tb = document.querySelector(".total-block");
        tb.classList.remove("pop"); void tb.offsetWidth; tb.classList.add("pop");
    }

    function printBill() {
        if(document.getElementById("fullname").value === "") {
            alert("Please search and load a booking before printing.");
            return;
        }
        window.print();
    }
</script>

</body>
</html>
