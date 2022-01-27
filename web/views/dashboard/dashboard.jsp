<%-- 
    Document   : dashboard
    Created on : Jan 5, 2022, 10:10:20 PM
    Author     : User
--%>

<%@include file="../../resources/prereq.jsp"%>
<%-- active sidebar --%>
<%    
    title = "Disaster Information Relief System - Dashboard";
    nav_dashboard = "active";
    nav_forum = "";
    nav_heatmap = "";
    nav_disaster = "";
    nav_relief = "";
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../resources/head.jsp"%>
<!--    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Disaster Information Relief System - Dashboard</title>

         Bootstrap core CSS 
        <link href="%= bootstrapCSS%>" rel="stylesheet">

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>

         Custom styles for this template 
        <link href="%= pageCSS%>" rel="stylesheet">
        
        
    </head>-->
    <body>
        <%@include file="../../resources/header.jsp"%>

        <div class="container-fluid">
            <div class="row">
                <%@include file="../../resources/sidebar.jsp"%>
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

