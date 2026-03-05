<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Room</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --primary:      #1a2e4a;
            --accent:       #c9a84c;
            --accent-light: #f5edd6;
            --red-dark:     #c0392b;
            --text-dark:    #1e2d3d;
            --text-mid:     #4a5568;
            --text-light:   #8492a6;
            --border:       #dde3ec;
            --bg-page:      #edf1f7;
            --bg-card:      #ffffff;
            --shadow-card:  0 8px 40px rgba(26,46,74,0.12);
            --radius:       12px;
            --radius-sm:    7px;
            --font-display: 'Playfair Display', Georgia, serif;
            --font-body:    'DM Sans', 'Segoe UI', sans-serif;
            --t:            0.25s ease;
        }

        body {
            font-family: var(--font-body);
            background: var(--bg-page);
            min-height: 100vh;
            padding: 0;
        }

        .page-wrapper {
            min-height: 100vh;
            padding: 28px 20px 50px;
            background:
                radial-gradient(ellipse at 10% 0%, rgba(201,168,76,0.08) 0%, transparent 55%),
                radial-gradient(ellipse at 90% 100%, rgba(26,46,74,0.07) 0%, transparent 55%),
                var(--bg-page);
        }

        /* Back Button */
        .top-bar {
            max-width: 700px;
            margin: 0 auto 18px;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            color: var(--primary);
            font-weight: 600;
            font-size: 14px;
            background: var(--bg-card);
            border: 1.5px solid var(--border);
            border-radius: 30px;
            padding: 9px 20px 9px 15px;
            box-shadow: 0 2px 10px rgba(26,46,74,0.07);
            transition: background var(--t), color var(--t), border-color var(--t),
                        box-shadow var(--t), transform var(--t);
        }

        .back-btn:hover {
            background: var(--primary);
            color: #fff;
            border-color: var(--primary);
            box-shadow: 0 4px 18px rgba(26,46,74,0.18);
            transform: translateY(-1px);
        }

        .back-arrow { font-size: 17px; line-height: 1; transition: transform var(--t); }
        .back-btn:hover .back-arrow { transform: translateX(-3px); }

        /* Card */
        .form-container { max-width: 700px; margin: 0 auto; }

        .form-card {
            background: var(--bg-card);
            border-radius: var(--radius);
            box-shadow: var(--shadow-card);
            overflow: hidden;
            animation: cardIn 0.45s cubic-bezier(0.22, 1, 0.36, 1) both;
        }

        @keyframes cardIn {
            from { opacity: 0; transform: translateY(22px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        /* Header */
        .card-header {
            background: var(--primary);
            padding: 32px 40px 28px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .card-header::before {
            content: '';
            position: absolute;
            inset: 0;
            background:
                radial-gradient(circle at 20% 50%, rgba(201,168,76,0.15) 0%, transparent 60%),
                radial-gradient(circle at 80% 20%, rgba(255,255,255,0.06) 0%, transparent 50%);
            pointer-events: none;
        }

        .card-header::after {
            content: '';
            display: block;
            width: 50px;
            height: 3px;
            background: var(--accent);
            border-radius: 2px;
            margin: 14px auto 0;
        }

        .header-icon {
            font-size: 36px;
            margin-bottom: 10px;
            display: block;
            filter: drop-shadow(0 2px 6px rgba(0,0,0,0.3));
        }

        .card-header h2 {
            font-family: var(--font-display);
            color: #fff;
            font-size: 26px;
            font-weight: 700;
            margin-bottom: 5px;
            letter-spacing: 0.3px;
        }

        .subtitle { color: rgba(255,255,255,0.6); font-size: 13.5px; }

        /* Alert */
        .alert {
            margin: 20px 40px 0;
            padding: 12px 18px;
            border-radius: var(--radius-sm);
            font-size: 14px;
            font-weight: 500;
        }

        .alert-success {
            background: #eafaf1;
            color: #1d7a45;
            border: 1px solid #a9dfbf;
        }

        /* Form */
        form { padding: 30px 40px 36px; }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px 24px;
        }

        .input-group { display: flex; flex-direction: column; gap: 7px; }
        .input-group.full-width { grid-column: 1 / -1; }

        label {
            font-size: 13px;
            font-weight: 600;
            color: var(--text-dark);
            letter-spacing: 0.3px;
            text-transform: uppercase;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            font-family: var(--font-body);
            font-size: 14.5px;
            color: var(--text-dark);
            background: #f8fafc;
            border: 1.5px solid var(--border);
            border-radius: var(--radius-sm);
            padding: 12px 14px;
            outline: none;
            width: 100%;
            transition: border-color var(--t), background var(--t), box-shadow var(--t);
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus,
        textarea:focus {
            border-color: var(--accent);
            background: #fff;
            box-shadow: 0 0 0 3px rgba(201,168,76,0.12);
        }

        input::placeholder, textarea::placeholder { color: var(--text-light); }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%238492a6' d='M6 8L1 3h10z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 14px center;
            padding-right: 36px;
            cursor: pointer;
        }

        textarea { resize: vertical; min-height: 100px; line-height: 1.6; }

        /* Price */
        .price-input-wrapper {
            display: flex;
            align-items: stretch;
            border: 1.5px solid var(--border);
            border-radius: var(--radius-sm);
            overflow: hidden;
            background: #f8fafc;
            transition: border-color var(--t), box-shadow var(--t);
        }

        .price-input-wrapper:focus-within {
            border-color: var(--accent);
            background: #fff;
            box-shadow: 0 0 0 3px rgba(201,168,76,0.12);
        }

        .currency-tag {
            background: var(--primary);
            color: var(--accent);
            font-weight: 700;
            font-size: 13px;
            padding: 0 14px;
            display: flex;
            align-items: center;
            white-space: nowrap;
            border-right: 1.5px solid var(--border);
            letter-spacing: 0.5px;
        }

        .price-input-wrapper input {
            border: none; border-radius: 0; background: transparent;
            box-shadow: none; flex: 1;
        }

        .price-input-wrapper input:focus {
            border: none; background: transparent; box-shadow: none;
        }

        /* Checkboxes */
        .checkbox-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            background: #f8fafc;
            padding: 15px;
            border-radius: var(--radius-sm);
            border: 1.5px solid var(--border);
        }

        .check-item {
            font-size: 13.5px;
            font-weight: 500 !important;
            text-transform: none !important;
            letter-spacing: 0 !important;
            color: var(--text-mid);
            display: flex;
            align-items: center;
            gap: 9px;
            cursor: pointer;
            padding: 8px 10px;
            border-radius: 6px;
            transition: background var(--t), color var(--t);
            user-select: none;
            white-space: nowrap;
        }

        .check-item:hover { background: var(--accent-light); color: var(--text-dark); }

        .check-item input[type="checkbox"] {
            width: 16px; height: 16px;
            accent-color: var(--accent);
            cursor: pointer; flex-shrink: 0;
            margin: 0; padding: 0;
            border: none; background: none; box-shadow: none;
        }

        /* File Upload */
        .file-upload-area {
            position: relative;
            border: 2px dashed var(--border);
            border-radius: var(--radius-sm);
            background: #f8fafc;
            text-align: center;
            padding: 28px 20px;
            cursor: pointer;
            transition: border-color var(--t), background var(--t);
        }

        .file-upload-area:hover { border-color: var(--accent); background: var(--accent-light); }

        .file-upload-area input[type="file"] {
            position: absolute; inset: 0; opacity: 0;
            cursor: pointer; width: 100%; height: 100%;
            padding: 0; border: none; background: none; box-shadow: none;
        }

        .upload-icon { font-size: 32px; margin-bottom: 8px; display: block; }

        .upload-placeholder p {
            font-size: 14px; font-weight: 600;
            color: var(--text-mid); margin-bottom: 4px;
        }

        .upload-placeholder small { font-size: 12px; color: var(--text-light); }

        /* Buttons */
        .button-group { display: flex; gap: 14px; margin-top: 28px; }

        .add-btn, .clear-btn {
            font-family: var(--font-body);
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: var(--radius-sm);
            cursor: pointer;
            padding: 14px 20px;
            transition: background var(--t), box-shadow var(--t), transform var(--t);
            letter-spacing: 0.3px;
        }

        .add-btn {
            flex: 2;
            background: var(--primary);
            color: #fff;
            box-shadow: 0 4px 14px rgba(26,46,74,0.22);
        }

        .add-btn:hover {
            background: #243d60;
            box-shadow: 0 6px 20px rgba(26,46,74,0.30);
            transform: translateY(-1px);
        }

        .add-btn:active { transform: translateY(0); }

        .clear-btn {
            flex: 1;
            background: #f1f3f7;
            color: var(--text-mid);
            border: 1.5px solid var(--border);
        }

        .clear-btn:hover {
            background: #fdecea;
            color: var(--red-dark);
            border-color: #f5c6c2;
            transform: translateY(-1px);
        }

        /* Responsive */
        @media (max-width: 600px) {
            .page-wrapper { padding: 18px 12px 40px; }
            .card-header  { padding: 24px 22px 22px; }
            form          { padding: 22px 22px 28px; }
            .form-grid    { grid-template-columns: 1fr; }
            .input-group.full-width { grid-column: 1; }
            .checkbox-container { grid-template-columns: repeat(2, 1fr); }
            .button-group { flex-direction: column; }
            .add-btn, .clear-btn { flex: unset; width: 100%; }
        }
    </style>
</head>
<body>

<%
    String status = request.getParameter("status");
    if ("success".equals(status)) {
%>
    <script type="text/javascript">alert("Room details saved successfully!");</script>
<%
    } else if ("error".equals(status)) {
%>
    <script type="text/javascript">alert("Something went wrong. Please try again.");</script>
<%
    }
%>

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
                <div class="header-icon">&#127970;</div>
                <h2>Add New Room</h2>
                <p class="subtitle">Fill in the details to list a new room</p>
            </div>

            <% if ("success".equals(status)) { %>
                <div class="alert alert-success">&#10003;&nbsp; Room added to the database successfully!</div>
            <% } %>

            <form action="UploadRoomServlet" method="post" enctype="multipart/form-data">

                <div class="form-grid">

                    <div class="input-group">
                        <label for="roomNo">Room Number</label>
                        <input type="text" id="roomNo" name="roomNo" placeholder="e.g. 101" required>
                    </div>

                    <div class="input-group">
                        <label for="roomType">Room Type</label>
                        <select id="roomType" name="roomType" required>
                            <option value="" disabled selected>Select Room Type</option>
                            <option value="Single">Single Room</option>
                            <option value="Double">Double Room</option>
                            <option value="Family">Family Room</option>
                            <option value="Luxury">Luxury Suite</option>
                        </select>
                    </div>

                    <div class="input-group full-width">
                        <label for="price">Price per Night (Rs.)</label>
                        <div class="price-input-wrapper">
                            <span class="currency-tag">Rs.</span>
                            <input type="number" step="0.01" id="price" name="price" placeholder="5000.00" required>
                        </div>
                    </div>

                    <div class="input-group full-width">
                        <label>Facilities</label>
                        <div class="checkbox-container">
                            <label class="check-item">
                                <input type="checkbox" name="facility" value="AC"> &#10052; A/C
                            </label>
                            <label class="check-item">
                                <input type="checkbox" name="facility" value="NonAC"> &#127777; Non A/C
                            </label>
                            <label class="check-item">
                                <input type="checkbox" name="facility" value="TV"> &#128250; TV
                            </label>
                            <label class="check-item">
                                <input type="checkbox" name="facility" value="Pool"> &#127946; Private Pool
                            </label>
                            <label class="check-item">
                                <input type="checkbox" name="facility" value="BeachSide"> &#127754; Beach View
                            </label>
                        </div>
                    </div>

                    <div class="input-group full-width">
                        <label for="description">Room Description</label>
                        <textarea id="description" name="description" rows="4" placeholder="Enter a brief description about the room..."></textarea>
                    </div>

                    <div class="input-group full-width">
                        <label for="roomPhoto">Upload Room Photo</label>
                        <div class="file-upload-area" id="uploadArea">
                            <input type="file" id="roomPhoto" name="roomPhoto" accept="image/*" required>
                            <div class="upload-placeholder">
                                <div class="upload-icon">&#128247;</div>
                                <p>Click to upload or drag &amp; drop</p>
                                <small>High-quality images recommended (JPG, PNG)</small>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="button-group">
                    <button type="submit" class="add-btn">&#43; Add Room</button>
                    <button type="reset" class="clear-btn">&#8635; Clear All</button>
                </div>

            </form>
        </div>
    </div>
</div>

<script>
    const fileInput = document.getElementById('roomPhoto');
    const uploadArea = document.getElementById('uploadArea');

    fileInput.addEventListener('change', function () {
        if (this.files && this.files[0]) {
            uploadArea.querySelector('p').textContent = this.files[0].name;
            uploadArea.querySelector('small').textContent = 'File selected \u2713';
            uploadArea.style.borderColor = '#2ecc71';
            uploadArea.style.background = '#f0faf4';
        }
    });

    uploadArea.addEventListener('dragover', (e) => {
        e.preventDefault();
        uploadArea.style.borderColor = '#3498db';
        uploadArea.style.background = '#eaf4fd';
    });

    uploadArea.addEventListener('dragleave', () => {
        uploadArea.style.borderColor = '#c8d6e5';
        uploadArea.style.background = '#f8fafc';
    });

    uploadArea.addEventListener('drop', (e) => {
        e.preventDefault();
        fileInput.files = e.dataTransfer.files;
        fileInput.dispatchEvent(new Event('change'));
    });
</script>

</body>
</html>
