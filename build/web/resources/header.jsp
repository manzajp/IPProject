<%-- 
    Document   : nav
    Created on : Jan 6, 2022, 9:19:21 AM
    Author     : User
--%>


<header class="navbar navbar-expand navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Team 4 - Red Shirt Kids</a>
    <div class="navbar-nav">
        <div class="nav-item text-nowrap">
            <a class="nav-link px-3" href="<%= views %>/profile/profile.jsp">Profile</a>
        </div>
        <div class="nav-item text-nowrap">
            <a class="nav-link px-3" href="<%= root %>/loginServlet?logout=1">Sign out</a>
        </div>
    </div>
</header>