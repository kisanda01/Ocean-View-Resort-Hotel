<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.RoomDAO" %>
<%@ page import="Models.Room" %>

<%
    RoomDAO roomDAO = new RoomDAO();
    List<Room> rooms = roomDAO.getAllRooms();

    String successMsg = request.getParameter("success");
    String errorMsg   = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Rooms - Ocean View</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/viewrooms.css?v=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<% if ("updated".equals(successMsg)) { %>
<div class="toast toast-success" id="toast">
    <div class="toast-icon">&#10003;</div>
    <div class="toast-text"><strong>Room Updated!</strong><span>Room details have been saved.</span></div>
    <button class="toast-close" onclick="closeToast()">&#10005;</button>
    <div class="toast-progress" id="toastProgress"></div>
</div>
<% } else if ("deleted".equals(successMsg)) { %>
<div class="toast toast-success" id="toast">
    <div class="toast-icon">&#128465;</div>
    <div class="toast-text"><strong>Room Deleted!</strong><span>Room removed from the system.</span></div>
    <button class="toast-close" onclick="closeToast()">&#10005;</button>
    <div class="toast-progress" id="toastProgress"></div>
</div>
<% } else if ("error".equals(errorMsg)) { %>
<div class="toast toast-error" id="toast">
    <div class="toast-icon">&#9888;</div>
    <div class="toast-text"><strong>Action Failed!</strong><span>Something went wrong. Please try again.</span></div>
    <button class="toast-close" onclick="closeToast()">&#10005;</button>
    <div class="toast-progress" id="toastProgress"></div>
</div>
<% } %>

<div class="page-wrapper">

    <div class="top-bar">
        <div class="top-left">
            <a href="Admin_Dash.jsp" class="back-btn">
                <span>&#8592;</span> Back to Dashboard
            </a>
            <div class="title-block">
                <h1>&#127968; Room Management</h1>
                <p>View, update and manage all hotel rooms</p>
            </div>
        </div>
        <div class="top-right">
            <div class="room-count-badge">
                <span class="count-num"><%= rooms.size() %></span>
                <span class="count-label">Total Rooms</span>
            </div>
        </div>
    </div>

    <div class="search-wrap">
        <span class="search-icon">&#128269;</span>
        <input type="text" id="searchInput" placeholder="Search by room number, type or facilities…" oninput="filterRooms()">
    </div>

    <% if (rooms.isEmpty()) { %>
    <div class="empty-state">
        <div class="empty-icon">&#127968;</div>
        <h3>No Rooms Added Yet</h3>
        <p>Rooms added by admin will appear here.</p>
    </div>
    <% } else { %>
    <div class="rooms-grid" id="roomsGrid">
        <% for (Room r : rooms) { %>
        <div class="room-card" data-search="<%= r.getRoomNo().toLowerCase() %> <%= r.getRoomType().toLowerCase() %> <%= r.getFacilities().toLowerCase() %>">

            <div class="card-img-wrap">
                <% if (r.getRoomPhoto() != null && !r.getRoomPhoto().isEmpty()) { %>
                    <img src="<%= request.getContextPath() %>/roomImages/<%= r.getRoomPhoto() %>"
                         alt="Room <%= r.getRoomNo() %>"
                         onerror="this.parentElement.innerHTML='<div class=\'img-placeholder\'>&#127968;</div>'">
                <% } else { %>
                    <div class="img-placeholder">&#127968;</div>
                <% } %>
                <div class="room-no-badge">Room <%= r.getRoomNo() %></div>
                <div class="room-type-chip"><%= r.getRoomType() %></div>
            </div>

            <div class="card-body">
                <div class="card-top-row">
                    <h3 class="room-title"><%= r.getRoomType() %></h3>
                    <div class="price-tag">
                        <span class="price-currency">LKR</span>
                        <span class="price-amount"><%= String.format("%,.0f", r.getPrice()) %></span>
                        <span class="price-per">/night</span>
                    </div>
                </div>

                <% if (r.getDescription() != null && !r.getDescription().isEmpty()) { %>
                <p class="room-desc"><%= r.getDescription() %></p>
                <% } %>

                <% if (r.getFacilities() != null && !r.getFacilities().isEmpty()) { %>
                <div class="facilities-wrap">
                    <% for (String fac : r.getFacilities().split(",")) { %>
                    <span class="fac-tag"><%= fac.trim() %></span>
                    <% } %>
                </div>
                <% } %>

                <div class="card-actions">
                    <button class="btn-edit" onclick="openEdit(
                        '<%= r.getRoomNo() %>',
                        '<%= r.getRoomType().replace("'","\\'") %>',
                        '<%= r.getFacilities().replace("'","\\'") %>',
                        '<%= r.getDescription() != null ? r.getDescription().replace("'","\\'").replace("\n","\\n") : "" %>',
                        '<%= r.getRoomPhoto() != null ? r.getRoomPhoto() : "" %>',
                        '<%= r.getPrice() %>'
                    )">&#9998; Edit Room</button>
                    <button class="btn-delete" onclick="confirmDelete('<%= r.getRoomNo() %>')">
                        &#128465; Delete
                    </button>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <% } %>

</div>

<div class="modal-overlay" id="editOverlay" onclick="closeEditModal(event)">
    <div class="modal-card">
        <div class="modal-header">
            <div>
                <h2>&#9998; Edit Room</h2>
                <p>Update room details below</p>
            </div>
            <button class="modal-close" onclick="closeEditModal()">&#10005;</button>
        </div>
        <form action="UpdateRoomServlet" method="post" enctype="multipart/form-data" class="modal-form">
            <input type="hidden" id="editRoomNo" name="roomNo">
            <input type="hidden" id="editOldPhoto" name="oldPhoto">

            <div class="modal-row">
                <div class="modal-field">
                    <label>Room Number</label>
                    <input type="text" id="editRoomNoDisplay" disabled class="input-disabled">
                </div>
                <div class="modal-field">
                    <label>Room Type</label>
                    <select id="editRoomType" name="roomType">
                        <option value="Single">Single</option>
                        <option value="Double">Double</option>
                        <option value="Twin">Twin</option>
                        <option value="Suite">Suite</option>
                        <option value="Deluxe">Deluxe</option>
                        <option value="Family">Family</option>
                        <option value="Presidential">Presidential</option>
                    </select>
                </div>
            </div>
            <div class="modal-row">
                <div class="modal-field">
                    <label>Price per Night (LKR)</label>
                    <input type="number" id="editPrice" name="price" min="0" step="0.01" placeholder="e.g. 15000">
                </div>
                <div class="modal-field">
                    <label>Room Photo</label>
                    <input type="file" id="editPhoto" name="roomPhoto" accept="image/*">
                    <span class="current-photo-hint" id="currentPhotoHint"></span>
                </div>
            </div>
            <div class="modal-field">
                <label>Facilities <span class="hint">(comma separated)</span></label>
                <input type="text" id="editFacilities" name="facilities" placeholder="e.g. AC, WiFi, TV, Mini Bar">
            </div>
            <div class="modal-field">
                <label>Description</label>
                <textarea id="editDescription" name="description" rows="3" placeholder="Room description…"></textarea>
            </div>
            <div class="modal-btns">
                <button type="submit" class="save-btn">&#10003;&nbsp; Save Changes</button>
                <button type="button" class="cancel-btn" onclick="closeEditModal()">Cancel</button>
            </div>
        </form>
    </div>
</div>
<div class="modal-overlay" id="deleteOverlay" onclick="closeDeleteModal(event)">
    <div class="modal-card modal-card-sm">
        <div class="modal-header modal-header-danger">
            <div>
                <h2>Delete Room</h2>
                <p>This action cannot be undone</p>
            </div>
            <button class="modal-close" onclick="closeDeleteModal()">&#10005;</button>
        </div>
        <div class="delete-modal-body">
            <div class="delete-icon-wrap">&#9888;</div>
            <p class="delete-msg">Are you sure you want to delete<br><strong id="deleteRoomNo"></strong>?</p>
            <p class="delete-sub">This will permanently remove the room from the database.</p>
            <form action="DeleteRoomServlet" method="post">
                <input type="hidden" id="deleteRoomId" name="roomNo">
                <div class="modal-btns">
                    <button type="submit" class="danger-btn">&#128465;&nbsp; Yes, Delete</button>
                    <button type="button" class="cancel-btn" onclick="closeDeleteModal()">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    (function () {
        const toast = document.getElementById('toast');
        if (!toast) return;
        setTimeout(() => toast.classList.add('toast-show'), 100);
        const bar = document.getElementById('toastProgress');
        if (bar) { bar.style.transition = 'width 4s linear'; setTimeout(() => { bar.style.width = '0%'; }, 200); }
        setTimeout(() => hideToast(), 4500);
    })();
    function hideToast() {
        const t = document.getElementById('toast');
        if (t) { t.classList.remove('toast-show'); t.classList.add('toast-hide'); setTimeout(() => t.remove(), 400); }
    }
    function closeToast() { hideToast(); }

    function openEdit(roomNo, roomType, facilities, description, photo, price) {
        document.getElementById('editRoomNo').value        = roomNo;
        document.getElementById('editRoomNoDisplay').value = roomNo;
        document.getElementById('editOldPhoto').value      = photo;
        document.getElementById('editFacilities').value    = facilities;
        document.getElementById('editDescription').value   = description.replace(/\\n/g, '\n');
        document.getElementById('editPrice').value         = price;
        document.getElementById('currentPhotoHint').textContent = photo ? 'Current: ' + photo : 'No photo uploaded';

        const sel = document.getElementById('editRoomType');
        for (let i = 0; i < sel.options.length; i++) {
            if (sel.options[i].value === roomType) { sel.selectedIndex = i; break; }
        }

        document.getElementById('editOverlay').classList.add('active');
        document.body.style.overflow = 'hidden';
    }
    function closeEditModal(e) {
        if (!e || e.target === document.getElementById('editOverlay')) {
            document.getElementById('editOverlay').classList.remove('active');
            document.body.style.overflow = '';
        }
    }
    function confirmDelete(roomNo) {
        document.getElementById('deleteRoomId').value          = roomNo;
        document.getElementById('deleteRoomNo').textContent    = 'Room ' + roomNo;
        document.getElementById('deleteOverlay').classList.add('active');
        document.body.style.overflow = 'hidden';
    }
    function closeDeleteModal(e) {
        if (!e || e.target === document.getElementById('deleteOverlay')) {
            document.getElementById('deleteOverlay').classList.remove('active');
            document.body.style.overflow = '';
        }
    }
    function filterRooms() {
        const q     = document.getElementById('searchInput').value.toLowerCase();
        const cards = document.querySelectorAll('.room-card');
        cards.forEach(card => {
            card.style.display = card.dataset.search.includes(q) ? '' : 'none';
        });
    }
</script>

</body>
</html>
