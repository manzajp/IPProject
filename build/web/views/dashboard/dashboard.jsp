<%-- 
    Document   : dashboard
    Created on : Jan 5, 2022, 10:10:20 PM
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
        <title>Disaster Information Relief System - Dashboard</title>

        <!-- Bootstrap core CSS -->
        <link href="<%= bootstrapCSS%>" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="<%= pageCSS%>" rel="stylesheet">
    </head>
    <body>

        <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Team 4 - Red Shirt Kids</a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
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
                                <a class="nav-link active" aria-current="page" href="#">
                                    <span data-feather="home"></span>
                                    Dashboard
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="users"></span>
                                    Forum
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<%= views%>/heatmap/map.jsp">
                                    <span data-feather="map"></span>
                                    Disaster Heat Map
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="alert-circle"></span>
                                    Report a Disaster
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<%= views%>/relief/relief.jsp">
                                    <span data-feather="flag"></span>
                                    Request Relief/Help
                                </a>
                            </li>
                        </ul>

                        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1">
                            <a class="nav-link" href="#">
                                <span data-feather="book-open"></span>
                                Your Disaster Reports
                            </a>
                            <a class="link-secondary" href="#" aria-label="Add a new report">
                                <span data-feather="plus-circle"></span>
                            </a>
                        </h6>
                        <ul class="nav flex-column mb-2">
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
                        <h1 class="h2">Report Count</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <div class="btn-group me-2">
                                <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                            </div>
                            <div class="dropdown">
                                <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span data-feather="calendar"></span>
                                    This Week
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">This Month</a>
                                    <a class="dropdown-item" href="#">This Year</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>Reports</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">ID#</th>
                                    <th scope="col">User</th>
                                    <th scope="col">Disaster Type</th>
                                    <th scope="col">Location</th>
                                    <th scope="col">Date-Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1,001</td>
                                    <td>username1</td>
                                    <td>Flood</td>
                                    <td>
                                        <a class="link" href="#">Location 1</a>
                                    </td>
                                    <td>DD/MM/YYYY-HH:MM</td>
                                </tr>
                                <tr>
                                    <td>1,002</td>
                                    <td>username2</td>
                                    <td>Flood</td>
                                    <td>
                                        <a class="link" href="#">Location 2</a>
                                    </td>
                                    <td>DD/MM/YYYY-HH:MM</td>
                                </tr>
                                <tr>
                                    <td>1,003</td>
                                    <td>username3</td>
                                    <td>Hurricane</td>
                                    <td>
                                        <a class="link" href="#">Location 3</a>
                                    </td>
                                    <td>DD/MM/YYYY-HH:MM</td>
                                </tr>
                                <tr>
                                    <td>1,004</td>
                                    <td>username4</td>
                                    <td>Fire</td>
                                    <td>
                                        <a class="link" href="#">Location 4</a>
                                    </td>
                                    <td>DD/MM/YYYY-HH:MM</td>
                                </tr>
                                <tr>
                                    <td>1,005</td>
                                    <td>username5</td>
                                    <td>Terrorist Attack</td>
                                    <td>
                                        <a class="link" href="#">Location 5</a>
                                    </td>
                                    <td>DD/MM/YYYY-HH:MM</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <br>
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>User Forum Activity</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">ID#</th>
                                    <th scope="col">User</th>
                                    <th scope="col">Topic</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>101</td>
                                    <td>username1</td>
                                    <td>Emergency Relief Funding</td>
                                </tr>
                                <tr>
                                    <td>102</td>
                                    <td>username2</td>
                                    <td>Flood in Damansara</td>
                                </tr>
                                <tr>
                                    <td>103</td>
                                    <td>username3</td>
                                    <td>Get Started</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <br>
                    <h2>Active Reliefs</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><button type="button" class="btn btn-primary" onclick="document.location = '#'">Batu Caves Relief! 10/01/2021</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="<%= bootstrapJS%>"></script>
        <script src="<%= featherJS%>"></script>
        <script src="<%= chartJS%>"></script>
        <script src="<%= pageJS%>"></script>
    </body>
</html>

