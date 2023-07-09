<header>
    <div class="toogle-logo">
        <p class="logo">Teman Nusa</p>
        <img class="navbar-toogle" onclick="toogleNavbar()" src="assets/menu.svg" alt="">
    </div>
    <nav id="navbar">
        <div class="navbar-nav">
            <div class="navbar-item"><a class="navbar-link" href="home.jsp">Home</a></div>
            <div class="navbar-item"><a class="navbar-link" href="gender.jsp">Gender</a></div>
            <div class="navbar-item"><a class="navbar-link" href="bidangPekerjaan.jsp">Bidang Pekerjaan</a></div>
        </div>
        <%
            if(session.getAttribute("userID") == null){
                // kalo guest
        %>
                <div class="navbar-item"><a class="navbar-link" href="login.jsp">Login</a></div>
        <%
            } else {
                // kalo udah login
        %> 
            <div class="navbar-nav">
                <div class="navbar-item"><a class="navbar-link" href="wishlist.jsp">Wishlist</a></div>
                <div class="navbar-item"><a class="navbar-link" href="avatar.jsp">Collector Angels</a></div>
                <div class="navbar-item"><a class="navbar-link" href="topup.jsp">Topup</a></div>
                <div class="navbar-item"><a class="navbar-link" href="settings.jsp">Settings</a></div>
                <div class="navbar-item"><a class="navbar-link" href="controller/logoutController.jsp">Logout</a></div>
            </div>        
        <%
            }
        %>
    </nav>
</header>