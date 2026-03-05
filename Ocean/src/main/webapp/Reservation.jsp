<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reserve Your Stay | Ocean View Resort</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,200;0,300;0,400;0,600;1,200;1,300;1,400&family=Jost:wght@200;300;400;500&display=swap" rel="stylesheet">

<style>
:root {
  --gold:        #b8965a;
  --gold-light:  #d4b483;
  --gold-pale:   #f0e0c0;
  --gold-glow:   rgba(184,150,90,0.25);
  --dark:        #0e0d0b;
  --dark-2:      #161410;
  --dark-3:      #1e1b16;
  --cream:       #f9f5ee;
  --cream-2:     #f2ebe0;
  --warm-grey:   #e8e0d4;
  --text-body:   #4a4540;
  --text-light:  #8a8278;
  --white:       #ffffff;
  --transition:  cubic-bezier(0.4, 0, 0.2, 1);
  --ease-out:    cubic-bezier(0.16, 1, 0.3, 1);
}
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; font-size: 16px; }
body {
  font-family: 'Jost', sans-serif;
  color: var(--text-body);
  background: var(--cream);
  overflow-x: hidden;
}

nav {
  position: fixed; top: 0; width: 100%; z-index: 500;
  padding: 22px 60px;
  display: flex; justify-content: space-between; align-items: center;
  background: rgba(14,13,11,0.95);
  backdrop-filter: blur(20px);
  border-bottom: 1px solid rgba(184,150,90,0.12);
}

.logo {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.2rem; font-weight: 400;
  letter-spacing: 0.22em; text-transform: uppercase;
  color: var(--white);
  text-decoration: none;
  display: flex; align-items: center; gap: 14px;
}
.logo-divider {
  width: 1px; height: 22px;
  background: rgba(184,150,90,0.5);
}
.logo-sub {
  font-size: 0.58rem; letter-spacing: 0.3em;
  color: var(--gold); font-family: 'Jost', sans-serif;
  font-weight: 300; text-transform: uppercase;
  line-height: 1.3;
}

.back-btn {
  display: inline-flex; align-items: center; gap: 10px;
  padding: 10px 24px;
  border: 1px solid rgba(255,255,255,0.3);
  color: rgba(255,255,255,0.75);
  font-size: 0.68rem; letter-spacing: 0.2em;
  text-transform: uppercase; text-decoration: none;
  font-weight: 300; transition: all 0.3s;
}
.back-btn:hover {
  border-color: var(--gold);
  color: var(--gold);
}

.reservation-hero {
  height: 50vh;
  min-height: 400px;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, var(--dark) 0%, var(--dark-2) 100%);
  margin-top: 70px;
  overflow: hidden;
}

.hero-pattern {
  position: absolute;
  inset: 0;
  opacity: 0.03;
  background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
}

.hero-content-res {
  position: relative;
  z-index: 2;
  text-align: center;
  padding: 0 30px;
}

.hero-eyebrow-res {
  font-size: 0.62rem;
  letter-spacing: 0.45em;
  text-transform: uppercase;
  color: var(--gold);
  margin-bottom: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 16px;
}
.hero-eyebrow-res::before,
.hero-eyebrow-res::after {
  content: '';
  width: 40px;
  height: 1px;
  background: var(--gold);
}

.hero-title-res {
  font-family: 'Cormorant Garamond', serif;
  font-size: clamp(2.5rem, 6vw, 4rem);
  font-weight: 300;
  color: var(--white);
  line-height: 1.1;
  margin-bottom: 16px;
}
.hero-title-res em {
  font-style: italic;
  color: var(--gold-light);
}

.hero-subtitle-res {
  font-size: 0.88rem;
  color: rgba(255,255,255,0.6);
  letter-spacing: 0.08em;
  font-weight: 300;
  max-width: 550px;
  margin: 0 auto;
}

.reservation-container {
  max-width: 1400px;
  margin: -80px auto 0;
  padding: 0 60px 120px;
  position: relative;
  z-index: 10;
}

.reservation-grid {
  display: grid;
  grid-template-columns: 1.2fr 1fr;
  gap: 40px;
  align-items: start;
}

.booking-card {
  background: var(--white);
  border-radius: 2px;
  box-shadow: 0 20px 80px rgba(0,0,0,0.08);
  padding: 50px 45px;
}

.card-header {
  margin-bottom: 36px;
  padding-bottom: 24px;
  border-bottom: 1px solid var(--warm-grey);
}

.step-indicator {
  display: flex;
  gap: 8px;
  margin-bottom: 24px;
}
.step-dot {
  width: 32px;
  height: 3px;
  background: var(--warm-grey);
  transition: background 0.4s;
}
.step-dot.active {
  background: var(--gold);
}

.card-title {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.8rem;
  font-weight: 300;
  color: var(--dark);
  margin-bottom: 8px;
}

.card-subtitle {
  font-size: 0.82rem;
  color: var(--text-light);
  font-weight: 300;
}

/* Form Sections */
.form-section {
  margin-bottom: 36px;
}

.section-label {
  font-size: 0.6rem;
  letter-spacing: 0.3em;
  text-transform: uppercase;
  color: var(--gold);
  margin-bottom: 18px;
  font-weight: 400;
  display: flex;
  align-items: center;
  gap: 10px;
}
.section-label::before {
  content: '';
  width: 24px;
  height: 1px;
  background: var(--gold);
}

.input-group {
  margin-bottom: 20px;
}

.input-label {
  display: block;
  font-size: 0.72rem;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-body);
  margin-bottom: 8px;
  font-weight: 400;
}

.input-field {
  width: 100%;
  padding: 14px 18px;
  border: 1px solid var(--warm-grey);
  background: var(--cream);
  font-family: 'Jost', sans-serif;
  font-size: 0.88rem;
  color: var(--dark);
  transition: all 0.3s;
  outline: none;
}

.input-field:focus {
  border-color: var(--gold);
  background: var(--white);
}

.input-field::placeholder {
  color: var(--text-light);
}

.input-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

/* Room Selection Cards */
.room-options {
  display: grid;
  gap: 16px;
}

.room-option {
  border: 2px solid var(--warm-grey);
  padding: 20px;
  cursor: pointer;
  transition: all 0.3s;
  display: grid;
  grid-template-columns: 80px 1fr auto;
  gap: 18px;
  align-items: center;
  background: var(--cream);
}

.room-option:hover {
  border-color: var(--gold-light);
  background: var(--white);
}

.room-option.selected {
  border-color: var(--gold);
  background: var(--white);
  box-shadow: 0 4px 20px var(--gold-glow);
}

.room-img {
  width: 80px;
  height: 60px;
  object-fit: cover;
}

.room-info h4 {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.1rem;
  font-weight: 400;
  color: var(--dark);
  margin-bottom: 4px;
}

.room-info p {
  font-size: 0.72rem;
  color: var(--text-light);
  letter-spacing: 0.05em;
}

.room-price {
  text-align: right;
}

.room-price .price-amount {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.4rem;
  font-weight: 400;
  color: var(--gold);
  display: block;
  line-height: 1;
}

.room-price .price-unit {
  font-size: 0.65rem;
  color: var(--text-light);
  letter-spacing: 0.08em;
  text-transform: uppercase;
  margin-top: 4px;
}

.guest-selector {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 16px 20px;
  background: var(--cream);
  border: 1px solid var(--warm-grey);
}

.guest-selector span {
  flex: 1;
  font-size: 0.82rem;
  color: var(--text-body);
}

.counter-controls {
  display: flex;
  align-items: center;
  gap: 16px;
}

.counter-btn {
  width: 32px;
  height: 32px;
  border: 1px solid var(--gold);
  background: transparent;
  color: var(--gold);
  font-size: 1.1rem;
  cursor: pointer;
  transition: all 0.3s;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 300;
}

.counter-btn:hover {
  background: var(--gold);
  color: var(--white);
}

.counter-btn:disabled {
  opacity: 0.3;
  cursor: not-allowed;
}

.counter-value {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.3rem;
  font-weight: 400;
  color: var(--dark);
  min-width: 30px;
  text-align: center;
}

.form-actions {
  display: flex;
  gap: 12px;
  margin-top: 40px;
}

.btn-primary-res {
  flex: 1;
  padding: 16px 32px;
  background: var(--gold);
  color: var(--dark);
  border: none;
  font-family: 'Jost', sans-serif;
  font-size: 0.72rem;
  letter-spacing: 0.22em;
  text-transform: uppercase;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.4s var(--ease-out);
  position: relative;
  overflow: hidden;
}

.btn-primary-res::before {
  content: '';
  position: absolute;
  inset: 0;
  background: var(--gold-light);
  transform: translateX(-101%);
  transition: transform 0.4s var(--ease-out);
}

.btn-primary-res:hover::before {
  transform: translateX(0);
}

.btn-primary-res span {
  position: relative;
  z-index: 1;
}

.btn-secondary-res {
  padding: 16px 32px;
  background: transparent;
  color: var(--text-body);
  border: 1px solid var(--warm-grey);
  font-family: 'Jost', sans-serif;
  font-size: 0.72rem;
  letter-spacing: 0.22em;
  text-transform: uppercase;
  font-weight: 400;
  cursor: pointer;
  transition: all 0.3s;
}

.btn-secondary-res:hover {
  border-color: var(--dark);
  color: var(--dark);
}

.summary-sidebar {
  position: sticky;
  top: 110px;
}

.summary-card {
  background: var(--dark);
  color: var(--white);
  padding: 40px 36px;
  border-radius: 2px;
  box-shadow: 0 20px 80px rgba(0,0,0,0.15);
}

.summary-header {
  margin-bottom: 28px;
  padding-bottom: 20px;
  border-bottom: 1px solid rgba(255,255,255,0.1);
}

.summary-header h3 {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.6rem;
  font-weight: 300;
  color: var(--white);
  margin-bottom: 6px;
}

.summary-header p {
  font-size: 0.72rem;
  color: rgba(255,255,255,0.5);
  letter-spacing: 0.08em;
}

.summary-item {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 18px;
  padding-bottom: 18px;
  border-bottom: 1px solid rgba(255,255,255,0.06);
}

.summary-item:last-child {
  border-bottom: none;
  margin-bottom: 0;
}

.summary-item-label {
  font-size: 0.72rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: rgba(255,255,255,0.5);
}

.summary-item-value {
  font-family: 'Jost', sans-serif;
  font-size: 0.88rem;
  color: var(--white);
  font-weight: 300;
  text-align: right;
}

.summary-room-info {
  margin: 24px 0;
  padding: 20px;
  background: rgba(255,255,255,0.05);
  border-left: 3px solid var(--gold);
}

.summary-room-info h4 {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.2rem;
  font-weight: 400;
  color: var(--gold-light);
  margin-bottom: 8px;
}

.summary-room-info p {
  font-size: 0.75rem;
  color: rgba(255,255,255,0.6);
  line-height: 1.6;
}

.summary-total {
  margin-top: 28px;
  padding-top: 24px;
  border-top: 2px solid rgba(184,150,90,0.3);
}

.total-label {
  font-size: 0.72rem;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: rgba(255,255,255,0.7);
  margin-bottom: 8px;
}

.total-amount {
  font-family: 'Cormorant Garamond', serif;
  font-size: 2.4rem;
  font-weight: 300;
  color: var(--gold);
  line-height: 1;
}

.total-currency {
  font-size: 0.65rem;
  letter-spacing: 0.1em;
  color: rgba(255,255,255,0.5);
  margin-top: 6px;
}

/* Promo Badge */
.promo-badge {
  margin-top: 20px;
  padding: 12px 16px;
  background: rgba(184,150,90,0.15);
  border: 1px dashed rgba(184,150,90,0.4);
  text-align: center;
}

.promo-badge p {
  font-size: 0.68rem;
  color: var(--gold-light);
  letter-spacing: 0.08em;
}

/* Form Steps Display */
.form-step {
  display: none;
}

.form-step.active {
  display: block;
  animation: fadeSlideIn 0.5s var(--ease-out);
}

@keyframes fadeSlideIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Calendar Styles */
.calendar-container {
  background: var(--cream);
  padding: 20px;
  border: 1px solid var(--warm-grey);
}

.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.calendar-month {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.2rem;
  font-weight: 400;
  color: var(--dark);
}

.calendar-nav {
  display: flex;
  gap: 8px;
}

.calendar-nav button {
  width: 32px;
  height: 32px;
  border: 1px solid var(--warm-grey);
  background: var(--white);
  color: var(--text-body);
  cursor: pointer;
  transition: all 0.3s;
  font-size: 0.9rem;
}

.calendar-nav button:hover {
  border-color: var(--gold);
  color: var(--gold);
}

.calendar-grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 4px;
}

.calendar-day-header {
  text-align: center;
  font-size: 0.65rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--text-light);
  padding: 8px 0;
  font-weight: 400;
}

.calendar-day {
  aspect-ratio: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 0.82rem;
  color: var(--text-body);
  cursor: pointer;
  background: var(--white);
  border: 1px solid transparent;
  transition: all 0.3s;
}

.calendar-day:hover:not(.disabled):not(.selected) {
  border-color: var(--gold-light);
  background: var(--gold-pale);
}

.calendar-day.selected {
  background: var(--gold);
  color: var(--white);
  font-weight: 500;
}

.calendar-day.in-range {
  background: var(--gold-pale);
  border-color: var(--gold-light);
}

.calendar-day.disabled {
  color: var(--warm-grey);
  cursor: not-allowed;
  background: transparent;
}

.calendar-day.other-month {
  color: var(--text-light);
  opacity: 0.4;
}

/* Success Message */
.success-message {
  text-align: center;
  padding: 60px 30px;
}

.success-icon {
  width: 80px;
  height: 80px;
  margin: 0 auto 24px;
  border-radius: 50%;
  background: var(--gold-pale);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2.5rem;
}

.success-message h3 {
  font-family: 'Cormorant Garamond', serif;
  font-size: 2rem;
  font-weight: 300;
  color: var(--dark);
  margin-bottom: 14px;
}

.success-message p {
  font-size: 0.88rem;
  color: var(--text-light);
  line-height: 1.8;
  max-width: 450px;
  margin: 0 auto 30px;
}

.confirmation-number {
  display: inline-block;
  padding: 12px 28px;
  background: var(--gold-pale);
  border-left: 4px solid var(--gold);
  margin: 20px 0;
}

.confirmation-number span {
  display: block;
  font-size: 0.65rem;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: var(--text-light);
  margin-bottom: 4px;
}

.confirmation-number strong {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.6rem;
  font-weight: 400;
  color: var(--gold);
  letter-spacing: 0.08em;
}

@media (max-width: 1024px) {
  .reservation-grid {
    grid-template-columns: 1fr;
  }
  
  .summary-sidebar {
    position: static;
    margin-top: 40px;
  }
}

@media (max-width: 768px) {
  nav {
    padding: 18px 24px;
  }
  
  .reservation-container {
    padding: 0 24px 80px;
    margin-top: -60px;
  }
  
  .booking-card {
    padding: 36px 28px;
  }
  
  .input-row {
    grid-template-columns: 1fr;
  }
  
  .room-option {
    grid-template-columns: 1fr;
    gap: 12px;
  }
  
  .room-img {
    width: 100%;
    height: 180px;
  }
  
  .room-price {
    text-align: left;
  }
  
  .form-actions {
    flex-direction: column;
  }
  
  .summary-card {
    padding: 32px 24px;
  }
}
</style>
</head>
<body>

<nav>
  <a href="index.html" class="logo">
    Ocean View
    <div class="logo-divider"></div>
    <div class="logo-sub">Resort<br>Galle</div>
  </a>
  <a href="Home.jsp" class="back-btn">
    ← Back to Home
  </a>
</nav>

<section class="reservation-hero">
  <div class="hero-pattern"></div>
  <div class="hero-content-res">
    <div class="hero-eyebrow-res">Your Journey Awaits</div>
    <h1 class="hero-title-res">
      Reserve Your <em>Escape</em>
    </h1>
    <p class="hero-subtitle-res">
      Complete your booking in three simple steps and prepare for an unforgettable stay
    </p>
  </div>
</section>

<div class="reservation-container">
  <div class="reservation-grid">
    
    <!-- LEFT: Booking Form -->
    <div class="booking-card">
      <div class="card-header">
        <div class="step-indicator">
          <div class="step-dot active" id="stepDot1"></div>
          <div class="step-dot" id="stepDot2"></div>
          <div class="step-dot" id="stepDot3"></div>
        </div>
        <h2 class="card-title" id="stepTitle">Select Your Dates</h2>
        <p class="card-subtitle" id="stepSubtitle">Choose your check-in and check-out dates</p>
      </div>

      <!-- STEP 1: Dates & Room -->
      <div class="form-step active" id="step1">
        <div class="form-section">
          <div class="section-label">Travel Dates</div>
          
          <div class="input-row">
            <div class="input-group">
              <label class="input-label">Check-In</label>
              <input type="text" class="input-field" id="checkInDate" placeholder="Select date" readonly>
            </div>
            <div class="input-group">
              <label class="input-label">Check-Out</label>
              <input type="text" class="input-field" id="checkOutDate" placeholder="Select date" readonly>
            </div>
          </div>

          <div class="calendar-container" id="calendar">
            <!-- Calendar will be generated by JavaScript -->
          </div>
        </div>

        <div class="form-section">
          <div class="section-label">Select Your Room</div>
          <div class="room-options">
            <div class="room-option" onclick="selectRoom('deluxe', 12000)">
              <img class="room-img" src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=300&q=80" alt="Deluxe Ocean View">
              <div class="room-info">
                <h4>Deluxe Ocean View</h4>
                <p>King bed • Ocean view • 35 m²</p>
              </div>
              <div class="room-price">
                <span class="price-amount">12,000</span>
                <span class="price-unit">LKR / night</span>
              </div>
            </div>

            <div class="room-option" onclick="selectRoom('oceanfront', 22000)">
              <img class="room-img" src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=300&q=80" alt="Oceanfront Suite">
              <div class="room-info">
                <h4>Oceanfront Suite</h4>
                <p>King bed • Private balcony • 50 m²</p>
              </div>
              <div class="room-price">
                <span class="price-amount">22,000</span>
                <span class="price-unit">LKR / night</span>
              </div>
            </div>

            <div class="room-option" onclick="selectRoom('presidential', 45000)">
              <img class="room-img" src="https://images.unsplash.com/photo-1591088398332-8596b4e9b4f3?auto=format&fit=crop&w=300&q=80" alt="Presidential Suite">
              <div class="room-info">
                <h4>Presidential Suite</h4>
                <p>King bed • Living room • 85 m²</p>
              </div>
              <div class="room-price">
                <span class="price-amount">45,000</span>
                <span class="price-unit">LKR / night</span>
              </div>
            </div>
          </div>
        </div>

        <div class="form-section">
          <div class="section-label">Guests</div>
          <div class="guest-selector">
            <span>Number of Adults</span>
            <div class="counter-controls">
              <button class="counter-btn" onclick="changeGuests('adults', -1)">−</button>
              <span class="counter-value" id="adultsCount">2</span>
              <button class="counter-btn" onclick="changeGuests('adults', 1)">+</button>
            </div>
          </div>
          <div class="guest-selector" style="margin-top: 12px;">
            <span>Number of Children</span>
            <div class="counter-controls">
              <button class="counter-btn" onclick="changeGuests('children', -1)">−</button>
              <span class="counter-value" id="childrenCount">0</span>
              <button class="counter-btn" onclick="changeGuests('children', 1)">+</button>
            </div>
          </div>
        </div>

        <div class="form-actions">
          <button class="btn-primary-res" onclick="nextStep()">
            <span>Continue to Guest Details →</span>
          </button>
        </div>
      </div>

      <!-- STEP 2: Guest Information -->
      <div class="form-step" id="step2">
        <div class="form-section">
          <div class="section-label">Personal Information</div>
          
          <div class="input-row">
            <div class="input-group">
              <label class="input-label">First Name</label>
              <input type="text" class="input-field" id="firstName" placeholder="Enter first name">
            </div>
            <div class="input-group">
              <label class="input-label">Last Name</label>
              <input type="text" class="input-field" id="lastName" placeholder="Enter last name">
            </div>
          </div>

          <div class="input-group">
            <label class="input-label">Email Address</label>
            <input type="email" class="input-field" id="email" placeholder="your.email@example.com">
          </div>

          <div class="input-group">
            <label class="input-label">Phone Number</label>
            <input type="tel" class="input-field" id="phone" placeholder="+94 XX XXX XXXX">
          </div>
        </div>

        <div class="form-section">
          <div class="section-label">Special Requests (Optional)</div>
          <div class="input-group">
            <textarea class="input-field" rows="4" id="requests" placeholder="Let us know if you have any special requirements..."></textarea>
          </div>
        </div>

        <div class="form-actions">
          <button class="btn-secondary-res" onclick="prevStep()">← Back</button>
          <button class="btn-primary-res" onclick="nextStep()">
            <span>Continue to Payment →</span>
          </button>
        </div>
      </div>

      <!-- STEP 3: Payment -->
      <div class="form-step" id="step3">
        <div class="form-section">
          <div class="section-label">Payment Method</div>
          
          <div class="input-group">
            <label class="input-label">Card Number</label>
            <input type="text" class="input-field" id="cardNumber" placeholder="1234 5678 9012 3456" maxlength="19">
          </div>

          <div class="input-row">
            <div class="input-group">
              <label class="input-label">Expiry Date</label>
              <input type="text" class="input-field" id="expiryDate" placeholder="MM/YY" maxlength="5">
            </div>
            <div class="input-group">
              <label class="input-label">CVV</label>
              <input type="text" class="input-field" id="cvv" placeholder="123" maxlength="3">
            </div>
          </div>

          <div class="input-group">
            <label class="input-label">Cardholder Name</label>
            <input type="text" class="input-field" id="cardName" placeholder="Name on card">
          </div>
        </div>

        <div class="form-actions">
          <button class="btn-secondary-res" onclick="prevStep()">← Back</button>
          <button class="btn-primary-res" onclick="confirmBooking()">
            <span>Complete Reservation</span>
          </button>
        </div>
      </div>

      <!-- SUCCESS MESSAGE -->
      <div class="form-step" id="stepSuccess">
        <div class="success-message">
          <div class="success-icon">✓</div>
          <h3>Reservation Confirmed!</h3>
          <p>Thank you for choosing Ocean View Resort. We've sent a confirmation email with all the details of your stay.</p>
          
          <div class="confirmation-number">
            <span>Confirmation Number</span>
            <strong id="confirmationCode">OVR-2026-1547</strong>
          </div>

          <p style="margin-top: 30px;">
            We look forward to welcoming you to paradise. If you have any questions, please don't hesitate to contact us.
          </p>

          <div class="form-actions">
            <button class="btn-primary-res" onclick="window.location='Home.jsp'">
              <span>Return to Home</span>
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- RIGHT: Summary Sidebar -->
    <div class="summary-sidebar">
      <div class="summary-card">
        <div class="summary-header">
          <h3>Booking Summary</h3>
          <p>Review your reservation details</p>
        </div>

        <div class="summary-item">
          <span class="summary-item-label">Check-In</span>
          <span class="summary-item-value" id="summaryCheckIn">—</span>
        </div>

        <div class="summary-item">
          <span class="summary-item-label">Check-Out</span>
          <span class="summary-item-value" id="summaryCheckOut">—</span>
        </div>

        <div class="summary-item">
          <span class="summary-item-label">Duration</span>
          <span class="summary-item-value" id="summaryNights">— nights</span>
        </div>

        <div class="summary-item">
          <span class="summary-item-label">Guests</span>
          <span class="summary-item-value" id="summaryGuests">2 Adults, 0 Children</span>
        </div>

        <div class="summary-room-info" id="summaryRoomInfo" style="display: none;">
          <h4 id="summaryRoomName">—</h4>
          <p id="summaryRoomDesc">—</p>
        </div>

        <div class="summary-item">
          <span class="summary-item-label">Room Rate</span>
          <span class="summary-item-value" id="summaryRoomRate">LKR 0 × 0 nights</span>
        </div>

        <div class="summary-item">
          <span class="summary-item-label">Taxes & Fees</span>
          <span class="summary-item-value" id="summaryTaxes">LKR 0</span>
        </div>

        <div class="summary-total">
          <div class="total-label">Total Amount</div>
          <div class="total-amount" id="summaryTotal">LKR 0</div>
          <div class="total-currency">Sri Lankan Rupees</div>
        </div>

        <div class="promo-badge">
          <p>🎁 Book 5+ nights and save 15%</p>
        </div>
      </div>
    </div>

  </div>
</div>

<!-- ═══════════════════════════════════════
     JAVASCRIPT
═══════════════════════════════════════ -->
<script>
// Booking State
let bookingData = {
  currentStep: 1,
  checkIn: null,
  checkOut: null,
  room: null,
  roomPrice: 0,
  adults: 2,
  children: 0,
  firstName: '',
  lastName: '',
  email: '',
  phone: '',
  requests: ''
};

// Calendar State
let currentMonth = new Date();
let selectedStartDate = null;
let selectedEndDate = null;

// Room Data
const roomData = {
  deluxe: {
    name: 'Deluxe Ocean View',
    desc: 'King bed • Ocean view • 35 m²',
    price: 12000
  },
  oceanfront: {
    name: 'Oceanfront Suite',
    desc: 'King bed • Private balcony • 50 m²',
    price: 22000
  },
  presidential: {
    name: 'Presidential Suite',
    desc: 'King bed • Living room • 85 m²',
    price: 45000
  }
};

// Initialize
document.addEventListener('DOMContentLoaded', () => {
  renderCalendar();
  updateSummary();
});

// Calendar Functions
function renderCalendar() {
  const calendar = document.getElementById('calendar');
  const month = currentMonth.getMonth();
  const year = currentMonth.getFullYear();
  
  const firstDay = new Date(year, month, 1).getDay();
  const daysInMonth = new Date(year, month + 1, 0).getDate();
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  
  const monthNames = ['January', 'February', 'March', 'April', 'May', 'June',
                     'July', 'August', 'September', 'October', 'November', 'December'];
  
  let html = `
    <div class="calendar-header">
      <div class="calendar-month">${monthNames[month]} ${year}</div>
      <div class="calendar-nav">
        <button onclick="changeMonth(-1)">‹</button>
        <button onclick="changeMonth(1)">›</button>
      </div>
    </div>
    <div class="calendar-grid">
      <div class="calendar-day-header">Sun</div>
      <div class="calendar-day-header">Mon</div>
      <div class="calendar-day-header">Tue</div>
      <div class="calendar-day-header">Wed</div>
      <div class="calendar-day-header">Thu</div>
      <div class="calendar-day-header">Fri</div>
      <div class="calendar-day-header">Sat</div>
  `;
  
  // Empty cells before first day
  for (let i = 0; i < firstDay; i++) {
    html += '<div class="calendar-day other-month"></div>';
  }
  
  // Days of the month
  for (let day = 1; day <= daysInMonth; day++) {
    const date = new Date(year, month, day);
    date.setHours(0, 0, 0, 0);
    
    let className = 'calendar-day';
    
    // Disable past dates
    if (date < today) {
      className += ' disabled';
    }
    
    // Check if selected
    if (selectedStartDate && date.getTime() === selectedStartDate.getTime()) {
      className += ' selected';
    }
    if (selectedEndDate && date.getTime() === selectedEndDate.getTime()) {
      className += ' selected';
    }
    
    // Check if in range
    if (selectedStartDate && selectedEndDate && 
        date > selectedStartDate && date < selectedEndDate) {
      className += ' in-range';
    }
    
    const disabled = date < today ? 'disabled' : '';
    html += `<div class="${className}" onclick="selectDate(${year}, ${month}, ${day})" ${disabled ? 'style="pointer-events:none"' : ''}>${day}</div>`;
  }
  
  html += '</div>';
  calendar.innerHTML = html;
}

function changeMonth(delta) {
  currentMonth.setMonth(currentMonth.getMonth() + delta);
  renderCalendar();
}

function selectDate(year, month, day) {
  const date = new Date(year, month, day);
  
  if (!selectedStartDate || (selectedStartDate && selectedEndDate)) {
    // Start new selection
    selectedStartDate = date;
    selectedEndDate = null;
    bookingData.checkIn = formatDate(date);
    bookingData.checkOut = null;
    document.getElementById('checkInDate').value = formatDate(date);
    document.getElementById('checkOutDate').value = '';
  } else if (date > selectedStartDate) {
    // Set end date
    selectedEndDate = date;
    bookingData.checkOut = formatDate(date);
    document.getElementById('checkOutDate').value = formatDate(date);
  } else {
    // Reset if selected date is before start
    selectedStartDate = date;
    selectedEndDate = null;
    bookingData.checkIn = formatDate(date);
    bookingData.checkOut = null;
    document.getElementById('checkInDate').value = formatDate(date);
    document.getElementById('checkOutDate').value = '';
  }
  
  renderCalendar();
  updateSummary();
}

function formatDate(date) {
  const options = { year: 'numeric', month: 'short', day: 'numeric' };
  return date.toLocaleDateString('en-US', options);
}

function calculateNights() {
  if (!selectedStartDate || !selectedEndDate) return 0;
  const diffTime = Math.abs(selectedEndDate - selectedStartDate);
  return Math.ceil(diffTime / (1000 * 60 * 60 * 24));
}

// Room Selection
function selectRoom(roomType, price) {
  // Remove previous selection
  document.querySelectorAll('.room-option').forEach(el => {
    el.classList.remove('selected');
  });
  
  // Select new room
  event.currentTarget.classList.add('selected');
  
  bookingData.room = roomType;
  bookingData.roomPrice = price;
  
  updateSummary();
}

// Guest Counter
function changeGuests(type, delta) {
  if (type === 'adults') {
    bookingData.adults = Math.max(1, Math.min(6, bookingData.adults + delta));
    document.getElementById('adultsCount').textContent = bookingData.adults;
  } else {
    bookingData.children = Math.max(0, Math.min(4, bookingData.children + delta));
    document.getElementById('childrenCount').textContent = bookingData.children;
  }
  
  updateSummary();
}

// Update Summary Sidebar
function updateSummary() {
  // Dates
  document.getElementById('summaryCheckIn').textContent = bookingData.checkIn || '—';
  document.getElementById('summaryCheckOut').textContent = bookingData.checkOut || '—';
  
  // Nights
  const nights = calculateNights();
  document.getElementById('summaryNights').textContent = nights ? `${nights} night${nights > 1 ? 's' : ''}` : '— nights';
  
  // Guests - FIXED: Use != instead of !== for compatibility
  const childLabel = bookingData.children != 1 ? 'ren' : '';
  document.getElementById('summaryGuests').textContent = 
    `${bookingData.adults} Adult${bookingData.adults > 1 ? 's' : ''}, ${bookingData.children} Child${childLabel}`;
  
  // Room
  if (bookingData.room) {
    const room = roomData[bookingData.room];
    document.getElementById('summaryRoomInfo').style.display = 'block';
    document.getElementById('summaryRoomName').textContent = room.name;
    document.getElementById('summaryRoomDesc').textContent = room.desc;
    document.getElementById('summaryRoomRate').textContent = 
      `LKR ${bookingData.roomPrice.toLocaleString()} × ${nights} night${nights > 1 ? 's' : ''}`;
  } else {
    document.getElementById('summaryRoomInfo').style.display = 'none';
    document.getElementById('summaryRoomRate').textContent = 'LKR 0 × 0 nights';
  }
  
  // Calculate totals
  const subtotal = bookingData.roomPrice * nights;
  const taxes = Math.round(subtotal * 0.15); // 15% tax
  const total = subtotal + taxes;
  
  document.getElementById('summaryTaxes').textContent = `LKR ${taxes.toLocaleString()}`;
  document.getElementById('summaryTotal').textContent = `LKR ${total.toLocaleString()}`;
}

// Step Navigation
function nextStep() {
  // Validation
  if (bookingData.currentStep === 1) {
    if (!bookingData.checkIn || !bookingData.checkOut) {
      alert('Please select check-in and check-out dates');
      return;
    }
    if (!bookingData.room) {
      alert('Please select a room');
      return;
    }
  }
  
  if (bookingData.currentStep === 2) {
    const firstName = document.getElementById('firstName').value.trim();
    const lastName = document.getElementById('lastName').value.trim();
    const email = document.getElementById('email').value.trim();
    const phone = document.getElementById('phone').value.trim();
    
    if (!firstName || !lastName || !email || !phone) {
      alert('Please fill in all required fields');
      return;
    }
    
    bookingData.firstName = firstName;
    bookingData.lastName = lastName;
    bookingData.email = email;
    bookingData.phone = phone;
    bookingData.requests = document.getElementById('requests').value.trim();
  }
  
  // Move to next step
  bookingData.currentStep++;
  updateStepDisplay();
}

function prevStep() {
  bookingData.currentStep--;
  updateStepDisplay();
}

function updateStepDisplay() {
  // Hide all steps
  document.querySelectorAll('.form-step').forEach(step => {
    step.classList.remove('active');
  });
  
  // Show current step
  document.getElementById(`step${bookingData.currentStep}`).classList.add('active');
  
  // Update step indicators
  for (let i = 1; i <= 3; i++) {
    const dot = document.getElementById(`stepDot${i}`);
    if (i <= bookingData.currentStep) {
      dot.classList.add('active');
    } else {
      dot.classList.remove('active');
    }
  }
  
  // Update titles
  const titles = {
    1: { title: 'Select Your Dates', subtitle: 'Choose your check-in and check-out dates' },
    2: { title: 'Guest Information', subtitle: 'Please provide your details' },
    3: { title: 'Payment Details', subtitle: 'Secure payment to confirm your reservation' }
  };
  
  if (titles[bookingData.currentStep]) {
    document.getElementById('stepTitle').textContent = titles[bookingData.currentStep].title;
    document.getElementById('stepSubtitle').textContent = titles[bookingData.currentStep].subtitle;
  }
  
  // Scroll to top
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

function confirmBooking() {
  // Validate payment fields
  const cardNumber = document.getElementById('cardNumber').value.trim();
  const expiryDate = document.getElementById('expiryDate').value.trim();
  const cvv = document.getElementById('cvv').value.trim();
  const cardName = document.getElementById('cardName').value.trim();
  
  if (!cardNumber || !expiryDate || !cvv || !cardName) {
    alert('Please fill in all payment details');
    return;
  }
  
  // Generate confirmation code
  const confirmCode = `OVR-2026-${Math.floor(1000 + Math.random() * 9000)}`;
  document.getElementById('confirmationCode').textContent = confirmCode;
  
  // Show success message
  document.querySelectorAll('.form-step').forEach(step => {
    step.classList.remove('active');
  });
  document.getElementById('stepSuccess').classList.add('active');
  
  // Update step indicators to show completion
  for (let i = 1; i <= 3; i++) {
    document.getElementById(`stepDot${i}`).classList.add('active');
  }
  
  // Update header
  document.getElementById('stepTitle').textContent = 'Booking Confirmed';
  document.getElementById('stepSubtitle').textContent = 'Your reservation has been successfully completed';
  
  // Scroll to top
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Auto-format card number
document.addEventListener('DOMContentLoaded', () => {
  const cardInput = document.getElementById('cardNumber');
  if (cardInput) {
    cardInput.addEventListener('input', (e) => {
      let value = e.target.value.replace(/\s/g, '');
      let formattedValue = value.match(/.{1,4}/g)?.join(' ') || value;
      e.target.value = formattedValue;
    });
  }
  
  const expiryInput = document.getElementById('expiryDate');
  if (expiryInput) {
    expiryInput.addEventListener('input', (e) => {
      let value = e.target.value.replace(/\D/g, '');
      if (value.length >= 2) {
        value = value.slice(0, 2) + '/' + value.slice(2, 4);
      }
      e.target.value = value;
    });
  }
});
</script>

</body>
</html>