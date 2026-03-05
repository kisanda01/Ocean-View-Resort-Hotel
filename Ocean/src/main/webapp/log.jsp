<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String status = request.getParameter("loginStatus");
    boolean loginFailed = "failed".equals(status);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — Ocean View Resort</title>
    <link rel="stylesheet" type="text/css" href="log.css">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

    <div class="ocean-bg">
        <div class="bubble b1"></div>
        <div class="bubble b2"></div>
        <div class="bubble b3"></div>
        <div class="bubble b4"></div>
        <div class="bubble b5"></div>
        <div class="light-ray r1"></div>
        <div class="light-ray r2"></div>
        <div class="light-ray r3"></div>
    </div>

    <div class="waves-wrapper">
        <div class="wave wave1"></div>
        <div class="wave wave2"></div>
        <div class="wave wave3"></div>
    </div>
    <div class="login-container">
        <div class="login-card">

            <div class="resort-crest">
                <svg viewBox="0 0 80 60" xmlns="http://www.w3.org/2000/svg" class="crest-icon">
                    <path d="M40 5 Q55 18 55 30 Q55 45 40 55 Q25 45 25 30 Q25 18 40 5Z" fill="none" stroke="#c9a96e" stroke-width="1.2"/>
                    <path d="M20 35 Q30 20 40 25 Q50 20 60 35" fill="none" stroke="#c9a96e" stroke-width="1.2"/>
                    <path d="M15 42 Q27 28 40 33 Q53 28 65 42" fill="none" stroke="#7ab8d9" stroke-width="1"/>
                    <circle cx="40" cy="30" r="4" fill="#c9a96e" opacity="0.8"/>
                    <path d="M32 50 L40 44 L48 50" fill="none" stroke="#c9a96e" stroke-width="1"/>
                </svg>
            </div>

            <div class="resort-title">
                <h1>Ocean View</h1>
                <span class="resort-subtitle">R E S O R T</span>
                <div class="title-divider">
                    <span></span><span class="diamond">◆</span><span></span>
                </div>
            </div>
            <% if (loginFailed) { %>
            <div class="error-toast" id="errorToast">
                <svg viewBox="0 0 20 20" fill="currentColor" width="16" height="16">
                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                </svg>
                <span>Invalid credentials. Please try again.</span>
            </div>
            <% } %>
            <form action="LoginServlet" method="post" class="login-form">

                <div class="input-group">
                    <label for="username">Username</label>
                    <div class="input-wrapper">
                        <svg class="input-icon" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
                        </svg>
                        <input type="text" id="username" name="username"
                               placeholder="Enter your username" required
                               autocomplete="username">
                    </div>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <svg class="input-icon" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                        </svg>
                        <input type="password" id="password" name="password"
                               placeholder="Enter your password" required
                               autocomplete="current-password">
                        <button type="button" class="toggle-pwd" onclick="togglePassword()" tabindex="-1">
                            <svg id="eyeIcon" viewBox="0 0 20 20" fill="currentColor" width="16" height="16">
                                <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/>
                                <path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>
                            </svg>
                        </button>
                    </div>
                </div>

                <button type="submit" class="login-btn">
                    <span class="btn-text">Welcome In</span>
                    <svg class="btn-arrow" viewBox="0 0 20 20" fill="currentColor" width="18" height="18">
                        <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"/>
                    </svg>
                </button>

                <div class="form-footer">
                    <a href="#" class="forgot-link">Forgot Password?</a>
                </div>

            </form>

            <div class="card-footer">
                <p>© 2025 Ocean View Resort. All rights reserved.</p>
            </div>

        </div>
    </div>

    <script>
        function togglePassword() {
            const input = document.getElementById('password');
            const icon = document.getElementById('eyeIcon');
            if (input.type === 'password') {
                input.type = 'text';
                icon.innerHTML = '<path fill-rule="evenodd" d="M3.707 2.293a1 1 0 00-1.414 1.414l14 14a1 1 0 001.414-1.414l-1.473-1.473A10.014 10.014 0 0019.542 10C18.268 5.943 14.478 3 10 3a9.958 9.958 0 00-4.512 1.074l-1.78-1.781zm4.261 4.26l1.514 1.515a2.003 2.003 0 012.45 2.45l1.514 1.514a4 4 0 00-5.478-5.478z" clip-rule="evenodd"/><path d="M12.454 16.697L9.75 13.992a4 4 0 01-3.742-3.741L2.335 6.578A9.98 9.98 0 00.458 10c1.274 4.057 5.064 7 9.542 7 .847 0 1.669-.105 2.454-.303z"/>';
            } else {
                input.type = 'password';
                icon.innerHTML = '<path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/><path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>';
            }
        }

        // Staggered card entrance animation
        window.addEventListener('DOMContentLoaded', () => {
            document.querySelector('.login-card').style.opacity = '1';
            document.querySelector('.login-card').style.transform = 'translateY(0)';
        });
    </script>

</body>
</html>
