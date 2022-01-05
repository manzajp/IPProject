<%-- 
    Document   : relief
    Created on : Jan 5, 2022, 8:37:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/bootstrap/dashboard/dashboard.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disaster Information Relief System - Relief</title>
    </head>
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
                            <a class="nav-link" href="#">
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
                            <a class="nav-link" href="heatmap/map.jsp">
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
                            <a class="nav-link active" aria-current="page" href="#">
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
                            <a class="nav-link" href="#">
                                <span data-feather="file-text"></span>
                                Report #1
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="file-text"></span>
                                Report #2
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="file-text"></span>
                                Report #3
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="file-text"></span>
                                Report #4
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

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
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/chartjs/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/dashboard/dashboard.js"></script>
</body>
</html>
