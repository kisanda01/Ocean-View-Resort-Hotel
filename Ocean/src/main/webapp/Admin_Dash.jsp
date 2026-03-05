<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Ocean View</title>
    <link rel="stylesheet" type="text/css" href="Admin_Dash.css">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>

<!-- Sidebar -->
<nav class="admin-sidebar">
    <div class="sidebar-header">
        <div class="logo-mark">OV</div>
        <div class="logo-text">
            <span class="logo-name">Ocean View</span>
            <span class="logo-role">Admin Panel</span>
        </div>
    </div>

    <div class="nav-section">
        <span class="nav-section-label">MANAGEMENT</span>
        <ul class="nav-links">
            <li>
                <a href="staff_reg.jsp" class="nav-item">
                    <span class="nav-icon">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                    </span>
                    <span class="nav-text">Register Staff</span>
                    <span class="nav-arrow">›</span>
                </a>
            </li>
            <li>
                <a href="add_rooms.jsp" class="nav-item">
                    <span class="nav-icon">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9,22 9,12 15,12 15,22"/></svg>
                    </span>
                    <span class="nav-text">Add Rooms</span>
                    <span class="nav-arrow">›</span>
                </a>
            </li>
            <li>
                <a href="view_rooms.jsp" class="nav-item">
                    <span class="nav-icon">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M19.07 4.93a10 10 0 0 1 0 14.14"/><path d="M4.93 4.93a10 10 0 0 0 0 14.14"/></svg>
                    </span>
                    <span class="nav-text">View Rooms</span>
                    <span class="nav-arrow">›</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="sidebar-footer">
    <a href="Home.jsp" class="exit-btn">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
            <polyline points="16,17 21,12 16,7"/>
            <line x1="21" y1="12" x2="9" y2="12"/>
        </svg>
        <span>Sign Out</span>
    </a>
</div>
</nav>

<!-- Main Content -->
<div class="main-content">

    <!-- Top Bar -->
    <div class="topbar">
        <div class="topbar-left">
            <h1 class="page-title">Dashboard <span class="title-accent">Overview</span></h1>
            <p class="page-subtitle">Manage your staff and hotel rooms efficiently.</p>
        </div>
        <div class="topbar-right">
            <div class="admin-badge">
                <div class="admin-avatar">A</div>
                <div class="admin-info">
                    <span class="admin-name">Administrator</span>
                    <span class="admin-status"><span class="status-dot"></span>Active</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="section-title">Quick Actions</div>
    <div class="quick-actions">
        <a href="staff_reg.jsp" class="action-card">
            <div class="action-icon">👨‍💼</div>
            <span class="action-label">Register New Staff</span>
            <span class="action-desc">Add hotel staff members</span>
        </a>
        <a href="add_rooms.jsp" class="action-card">
            <div class="action-icon">🏨</div>
            <span class="action-label">Add New Room</span>
            <span class="action-desc">Configure room details</span>
        </a>
        <a href="view_rooms.jsp" class="action-card">
            <div class="action-icon">⚙️</div>
            <span class="action-label">View Rooms</span>
            <span class="action-desc">Control user access</span>
        </a>
    </div>

</div>

</body>
</html>
