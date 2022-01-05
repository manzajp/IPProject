<%-- 
    Document   : relief
    Created on : Jan 5, 2022, 8:37:59 PM
    Author     : User
--%>

<%@include file="../../resources/prereq.jsp"%>
<%-- active sidebar --%>
<%
    nav_dashboard = "";
    nav_forum = "";
    nav_heatmap = "";
    nav_disaster = "";
    nav_relief = "active";
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Disaster Information Relief System - Relief</title>

        <!-- Bootstrap core CSS -->
        <link href="<%= bootstrapCSS %>" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="<%= pageCSS %>" rel="stylesheet">
    </head>

    <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
        <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Team 4 - Red Shirt Kids</a>
        <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-nav">
            <div class="nav-item text-nowrap">
                <a class="nav-link px-3" href="#">Sign out</a>
            </div>
        </div>
    </header>

    <div class="container-fluid">
        <div class="row">
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
                            <a class="nav-link <%= nav_dashboard %>" href="<%= dashboard %>/dashboard.jsp">
                                <span data-feather="home"></span>
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= nav_forum %>" href="#">
                                <span data-feather="users"></span>
                                Forum
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= nav_heatmap %>" href="<%= heatmap %>/map.jsp">
                                <span data-feather="map"></span>
                                Disaster Heat Map
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= nav_disaster %>" href="#">
                                <span data-feather="alert-circle"></span>
                                Report a Disaster
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= nav_relief %>" href="#">
                                <span data-feather="flag"></span>
                                Request Relief/Help
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h2>Reliefs</h2>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-dark">
                            <tr>
                                <td>Title</td>
                                <td>Date Started</td>
                                <td>Active State</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr onclick="window.location='<%= dashboard %>/dashboard.jsp';">
                                <td>Batu Caves Relief!</td>
                                <td>10/01/2021</td>
                                <td>Active</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="<%= bootstrapJS %>"></script>
    <script src="<%= featherJS %>"></script>
    <script src="<%= chartJS %>"></script>
    <script src="<%= pageJS %>"></script>
</body>
</html>
