<%-- 
    Document   : nav
    Created on : Jan 6, 2022, 9:19:21 AM
    Author     : User
--%>


<header class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Team 4 - Red Shirt Kids</a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link px-3" href="<%= views %>/profile/profile.jsp">Profile</a>
        </li>
        <li class="nav-item">
            <a class="nav-link px-3" href="<%= root %>/loginServlet?logout=1">Sign out</a>
        </li>
    </ul>
</header>