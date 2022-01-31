<%-- 
    Document   : dashboard
    Created on : Jan 5, 2022, 10:10:20 PM
    Author     : User
--%>

<%@page import="_model.EvacCentre"%>
<%@page import="_model.Relief"%>
<%@page import="_model.report"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../../resources/prereq.jsp"%>
<%-- active sidebar --%>
<%    
    title = "Disaster Information Relief System - Dashboard";
    nav_dashboard = "active";
    nav_users = "";
    nav_ec = "";
    nav_disaster = "";
    nav_relief = "";
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Disaster Information Relief System - Dashboard</title>

        <!-- Bootstrap core CSS -->
        <link href="<%= bootstrapCSS%>" rel="stylesheet">

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

        <!-- Custom styles for this template -->
        <link href="<%= pageCSS%>" rel="stylesheet">
        
        <% 
            if (session.getAttribute("currUser") == null){
                String login = "0; url='" + request.getContextPath() + "/views/login/login.jsp'"; %>
                <meta http-equiv="Refresh" content="<%= login %>" /> <%
            }
        %>
    </head>
    <body>
        <%@include file="../../resources/header.jsp"%>

        <div class="container-fluid">
            <div class="row">
                <%@include file="../../resources/sidebar.jsp"%>
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Reports</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <div class="dropdown">
                                <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span data-feather="calendar"></span>
                                    <% 
                                        if (session.getAttribute("duration") == null) { %>
                                            Today
                                        <% } else {
                                            String dur = (String) session.getAttribute("duration");
                                            if (dur.equals("today")) { %>
                                                Today
                                            <% } else if (dur.equals("month")) { %>
                                                This Month
                                            <% } else if (dur.equals("year")) { %>
                                                This Year
                                            <% }
                                        }
                                    %>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="<%= root %>/dashboardController?request=report_today">Today</a>
                                    <a class="dropdown-item" href="<%= root %>/dashboardController?request=report_month">This Month</a>
                                    <a class="dropdown-item" href="<%= root %>/dashboardController?request=report_year">This Year</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% 
                        ArrayList<report> reports = (ArrayList<report>) session.getAttribute("reports");
                        if (reports.size() != 0){ %>
                            <table class="table table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th scope="col">ID#</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Location</th>
                                        <th scope="col">Disaster Type</th>
                                        <th scope="col">Assistance Type</th>
                                        <th scope="col">Assistance Source</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(int i = 0; i < reports.size(); i++) {%>
                                            <tr onclick="window.location = '<%= root %>/reportController?request=view&id=<%= reports.get(i).getId() %>';">
                                                <td><%= reports.get(i).getId() %></td>
                                                <td><%= reports.get(i).getDate() %></td>
                                                <td><%= reports.get(i).getLocation() %></td>
                                                <td><%= reports.get(i).getDisaster_type() %></td>
                                                <td><%= reports.get(i).getAsst_type() %></td>
                                                <td><%= reports.get(i).getAsst_source() %></td>
                                            </tr>
                                        <% } %>
                                </tbody>
                            </table>
                        <% } else { %>
                            <h6>No Reports</h6>
                        <% }
                    %>
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>Active Evacuation Centers</h2>
                    </div>
                    <% 
                        ArrayList<EvacCentre> ecs = (ArrayList<EvacCentre>) session.getAttribute("ecs");
                        if (ecs.size() != 0){ %>
                            <table class="table table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th scope="col">ID#</th>
                                        <th scope="col">Center Name</th>
                                        <th scope="col">Location</th>
                                        <th scope="col">Current Capacity</th>
                                        <th scope="col">Max Capacity</th>
                                        <th scope="col">Activity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(int i = 0; i < ecs.size(); i++) {%>
                                            <tr onclick="window.location = '<%= root %>/reportController?request=view&id=<%= ecs.get(i).getId() %>';">
                                                <td><%= ecs.get(i).getId() %></td>
                                                <td><%= ecs.get(i).getCentreName() %></td>
                                                <td><%= ecs.get(i).getCentreLoc() %></td>
                                                <td><%= ecs.get(i).getCapacity() %></td>
                                                <td><%= ecs.get(i).getMaxCapacity() %></td>
                                                <td><%= ecs.get(i).getActivity() %></td>
                                            </tr>
                                        <% } %>
                                </tbody>
                            </table>
                        <% } else { %>
                            <h6>No Evacuation Centres Available</h6>
                        <% }
                    %>

                    <br>
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>Active Reliefs</h2>
                    </div>
                    <% 
                        ArrayList<Relief> reliefs = (ArrayList<Relief>) session.getAttribute("reliefs");
                        if (reliefs.size() != 0){ %>
                            <table class="table table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th scope="col">ID#</th>
                                        <th scope="col">Title</th>
                                        <th scope="col">User ID</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Location</th>
                                        <th scope="col">Start Date</th>
                                        <th scope="col">End Date</th>
                                        <th scope="col">State</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(int i = 0; i < reliefs.size(); i++) {%>
                                        <tr onclick="window.location = '<%= root %>/relief?request=view&id=<%= reliefs.get(i).getId() %>';">
                                            <td><%= reliefs.get(i).getId() %></td>
                                            <td><%= reliefs.get(i).getTitle() %></td>
                                            <td><%= reliefs.get(i).getUser() %></td>
                                            <td><%= reliefs.get(i).getDescription()%></td>
                                            <td><%= reliefs.get(i).getLocation() %></td>
                                            <td><%= reliefs.get(i).getStartDate() %></td>
                                            <td><%= reliefs.get(i).getEndDate() %></td>
                                            <td><%= reliefs.get(i).getState() %></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        <% } else { %>
                            <h6>No Reliefs Available</h6>
                        <% }
                    %>

                    <br>
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

