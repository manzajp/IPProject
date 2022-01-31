<%-- 
    Document   : sidebar
    Created on : Jan 6, 2022, 9:35:19 AM
    Author     : User
--%>

<%@page import="_model.user"%>
<% 
    user currUser = (user) session.getAttribute("currUser");
    String userType = currUser.getUserType().toUpperCase();
%>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
    <div class="position-sticky pt-3">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link disabled">
                    <span data-feather="user"></span>
                    <%= userType %>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_dashboard%>" href="<%= root %>/dashboardController?request=start">
                    <span data-feather="home"></span>
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_users%>" href="<%= root %>/usersController?request=index">
                    <span data-feather="users"></span>
                    View Users
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_ec %>" href="<%= root%>/evacController?request=index">
                    <span data-feather="map-pin"></span>
                    View Evacuation Centres
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_disaster %>" href="<%= root%>/reportController?request=index">
                    <span data-feather="alert-circle"></span>
                    Report a Disaster
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_relief%>" href="<%= root %>/relief?request=index">
                    <span data-feather="flag"></span>
                    Request Relief/Help
                </a>
            </li>
        </ul>
    </div>
</nav>
