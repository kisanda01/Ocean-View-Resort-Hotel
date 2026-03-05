<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.GuestDAO" %>
<%@ page import="Models.Guest" %>

<%
    GuestDAO guestDAO = new GuestDAO();
    List<Guest> guests = guestDAO.getAllGuests();

    String successMsg = request.getParameter("success");
    String errorMsg   = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Guests - Ocean View</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/viewguests.css?v=4.0">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<% if ("updated".equals(successMsg)) { %>
<div class="toast toast-success" id="toast">
    <div class="toast-icon">&#10003;</div>
    <div class="toast-text">
        <strong>Updated Successfully!</strong>
        <span>Guest details have been saved.</span>
    </div>
    <button class="toast-close" onclick="closeToast()">&#10005;</button>
    <div class="toast-progress" id="toastProgress"></div>
</div>
<% } else if ("deleted".equals(successMsg)) { %>
<div class="toast toast-success" id="toast">
    <div class="toast-icon">&#128465;</div>
    <div class="toast-text">
        <strong>Deleted Successfully!</strong>
        <span>Guest has been removed from the system.</span>
    </div>
    <button class="toast-close" onclick="closeToast()">&#10005;</button>
    <div class="toast-progress" id="toastProgress"></div>
</div>
<% } else if ("error".equals(errorMsg)) { %>
<div class="toast toast-error" id="toast">
    <div class="toast-icon">&#9888;</div>
    <div class="toast-text">
        <strong>Action Failed!</strong>
        <span>Something went wrong. Please try again.</span>
    </div>
    <button class="toast-close" onclick="closeToast()">&#10005;</button>
    <div class="toast-progress" id="toastProgress"></div>
</div>
<% } %>

<div class="page-wrapper">

    <div class="top-bar">
        <div class="top-left">
            <a href="Reception_Dash.jsp" class="back-btn">
                <span class="back-arrow">&#8592;</span> Back to Dashboard
            </a>
            <div class="title-block">
                <h1>&#128101; Guest Directory</h1>
                <p>View and manage all registered guests</p>
            </div>
        </div>
        <div class="guest-count-badge">
            <span class="count-num"><%= guests.size() %></span>
            <span class="count-label">Registered Guests</span>
        </div>
    </div>
    <div class="search-wrap">
        <span class="search-icon">&#128269;</span>
        <input type="text" id="searchInput" placeholder="Search by name, ID, email or phone…" oninput="filterGuests()">
    </div>

    <div class="table-wrap">
        <table id="guestTable">
            <colgroup>
                <col style="width:48px">
                <col style="width:22%">
                <col style="width:13%">
                <col style="width:12%">
                <col style="width:17%">
                <col style="width:14%">
                <col style="width:160px">
            </colgroup>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Full Name</th>
                    <th>ID / Passport</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int i = 1;
                    for (Guest g : guests) {
                %>
                <tr>
                    <td class="td-num"><%= i++ %></td>
                    <td class="td-name">
                        <div class="guest-avatar"><%= g.getFullname().substring(0,1).toUpperCase() %></div>
                        <span><%= g.getFullname() %></span>
                    </td>
                    <td><span class="id-badge"><%= g.getIdPassport() %></span></td>
                    <td>&#128222; <%= g.getPhone() %></td>
                    <td>&#128140; <%= g.getEmail() %></td>
                    <td class="td-address"><%= g.getAddress() %></td>
                    <td class="td-actions">
                        <button class="edit-btn"
                            onclick="openEdit(
                                '<%= g.getIdPassport() %>',
                                '<%= g.getFullname().replace("'", "\\'") %>',
                                '<%= g.getPhone() %>',
                                '<%= g.getEmail() %>',
                                '<%= g.getAddress().replace("'", "\\'").replace("\n","\\n") %>'
                            )">
                            &#9998; Edit
                        </button>
                        <button class="delete-btn"
                            onclick="confirmDelete(
                                '<%= g.getIdPassport() %>',
                                '<%= g.getFullname().replace("'", "\\'") %>'
                            )">
                            &#128465; Delete
                        </button>
                    </td>
                </tr>
                <%
                    }
                    if (guests.isEmpty()) {
                %>
                <tr>
                    <td colspan="7" class="empty-row">&#128100; No guests registered yet.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</div>
<div class="modal-overlay" id="modalOverlay" onclick="closeEdit(event)">
    <div class="modal-card">
        <div class="modal-header">
            <div>
                <h2>Edit Guest</h2>
                <p>Update guest details below</p>
            </div>
            <button class="modal-close" onclick="closeModal()">&#10005;</button>
        </div>
        <form action="UpdateGuestServlet" method="post" class="modal-form">
            <input type="hidden" id="editId" name="idPassport">
            <div class="modal-field">
                <label for="editName">Full Name</label>
                <input type="text" id="editName" name="fullname" required placeholder="Full name">
            </div>
            <div class="modal-row">
                <div class="modal-field">
                    <label for="editPhone">Phone Number</label>
                    <input type="tel" id="editPhone" name="phone" required placeholder="07XXXXXXXX">
                </div>
                <div class="modal-field">
                    <label for="editEmail">Email Address</label>
                    <input type="email" id="editEmail" name="email" required placeholder="example@mail.com">
                </div>
            </div>
            <div class="modal-field">
                <label for="editAddress">Address</label>
                <textarea id="editAddress" name="address" rows="3" placeholder="Home address"></textarea>
            </div>
            <div class="modal-btns">
                <button type="submit" class="save-btn">&#10003;&nbsp; Save Changes</button>
                <button type="button" class="cancel-btn" onclick="closeModal()">Cancel</button>
            </div>
        </form>
    </div>
</div>

<div class="modal-overlay" id="deleteOverlay" onclick="closeDeleteModal(event)">
    <div class="modal-card modal-card-sm">
        <div class="modal-header modal-header-danger">
            <div>
                <h2>Delete Guest</h2>
                <p>This action cannot be undone</p>
            </div>
            <button class="modal-close" onclick="closeDeleteModal()">&#10005;</button>
        </div>
        <div class="delete-modal-body">
            <div class="delete-icon-wrap">&#9888;</div>
            <p class="delete-msg">
                Are you sure you want to delete<br>
                <strong id="deleteGuestName"></strong>?
            </p>
            <p class="delete-sub">This will permanently remove the guest from the database.</p>
            <form action="DeleteGuestServlet" method="post">
                <input type="hidden" id="deleteGuestId" name="idPassport">
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
        if (bar) {
            bar.style.transition = 'width 4s linear';
            setTimeout(() => { bar.style.width = '0%'; }, 200);
        }
        setTimeout(() => hideToast(), 4500);
    })();

    function hideToast() {
        const toast = document.getElementById('toast');
        if (toast) {
            toast.classList.remove('toast-show');
            toast.classList.add('toast-hide');
            setTimeout(() => toast.remove(), 400);
        }
    }
    function closeToast() { hideToast(); }

    function openEdit(id, name, phone, email, address) {
        document.getElementById('editId').value      = id;
        document.getElementById('editName').value    = name;
        document.getElementById('editPhone').value   = phone;
        document.getElementById('editEmail').value   = email;
        document.getElementById('editAddress').value = address.replace(/\\n/g, '\n');
        document.getElementById('modalOverlay').classList.add('active');
        document.body.style.overflow = 'hidden';
    }
    function closeModal() {
        document.getElementById('modalOverlay').classList.remove('active');
        document.body.style.overflow = '';
    }
    function closeEdit(e) {
        if (e.target === document.getElementById('modalOverlay')) closeModal();
    }

    function confirmDelete(id, name) {
        document.getElementById('deleteGuestId').value        = id;
        document.getElementById('deleteGuestName').textContent = name;
        document.getElementById('deleteOverlay').classList.add('active');
        document.body.style.overflow = 'hidden';
    }
    function closeDeleteModal(e) {
        if (!e || e.target === document.getElementById('deleteOverlay')) {
            document.getElementById('deleteOverlay').classList.remove('active');
            document.body.style.overflow = '';
        }
    }

    function filterGuests() {
        const q    = document.getElementById('searchInput').value.toLowerCase();
        const rows = document.querySelectorAll('#guestTable tbody tr');
        rows.forEach(row => {
            row.style.display = row.textContent.toLowerCase().includes(q) ? '' : 'none';
        });
    }
</script>

</body>
</html>
