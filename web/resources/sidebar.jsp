<%-- 
    Document   : sidebar
    Created on : Jan 6, 2022, 9:35:19 AM
    Author     : User
--%>

<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
    <div class="position-sticky pt-3">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link disabled">
                    <span data-feather="user"></span>
                    Admin
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_dashboard%>" href="<%= dashboard%>/dashboard.jsp">
                    <span data-feather="home"></span>
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_forum%>" href="#">
                    <span data-feather="users"></span>
                    Forum
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_heatmap%>" href="<%= heatmap%>/map.jsp">
                    <span data-feather="map"></span>
                    Disaster Heat Map
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_disaster%>" href="#">
                    <span data-feather="alert-circle"></span>
                    Report a Disaster
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= nav_relief%>" href="#">
                    <span data-feather="flag"></span>
                    Request Relief/Help
                </a>
            </li>
        </ul>
    </div>
</nav>
