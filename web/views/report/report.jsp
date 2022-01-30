<%-- 
    Document   : report
    Created on : Jan 30, 2022, 11:14:56 AM
    Author     : User
--%>

<%@page import="_model.report"%>
<%@page import="_model.user"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../../resources/prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Reports";
    nav_disaster = "active";
%>

<%-- servlet get --%>
<%
    ArrayList<report> pastReports = (ArrayList<report>) session.getAttribute("pastReports");
    ArrayList<report> todayReports = (ArrayList<report>) session.getAttribute("todayReports");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../resources/head.jsp"%>
    <body>
        <%@include file="../../resources/header.jsp"%>

        <div class="container-fluid">
            <div class="row">
                <%@include file="../../resources/sidebar.jsp"%>

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>List of Recent Reports</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <td>Report ID</td>
                                    <td>Date</td>
                                    <td>Location</td>
                                    <td>Disaster Type</td>
                                    <td>Assistance Type</td>
                                    <td>Assistance Source</td>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- loop -->
                                <% for(int i = 0; i < todayReports.size(); i++) {%>
                                    <tr onclick="window.location = '<%= root %>/reportController?request=view&id=<%= todayReports.get(i).getId() %>';">
                                        <td><%= todayReports.get(i).getId() %></td>
                                        <td><%= todayReports.get(i).getDate() %></td>
                                        <td><%= todayReports.get(i).getLocation() %></td>
                                        <td><%= todayReports.get(i).getDisaster_type() %></td>
                                        <td><%= todayReports.get(i).getAsst_type() %></td>
                                        <td><%= todayReports.get(i).getAsst_source() %></td>
                                    </tr>
                                <%  } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>List of Past Reports</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <td>Report ID</td>
                                    <td>Date</td>
                                    <td>Location</td>
                                    <td>Disaster Type</td>
                                    <td>Assistance Type</td>
                                    <td>Assistance Source</td>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- loop -->
                                <% for(int i = 0; i < pastReports.size(); i++) {%>
                                    <tr onclick="window.location = '<%= root %>/reportController?request=view&id=<%= pastReports.get(i).getId() %>';">
                                        <td><%= pastReports.get(i).getId() %></td>
                                        <td><%= pastReports.get(i).getDate() %></td>
                                        <td><%= pastReports.get(i).getLocation() %></td>
                                        <td><%= pastReports.get(i).getDisaster_type() %></td>
                                        <td><%= pastReports.get(i).getAsst_type() %></td>
                                        <td><%= pastReports.get(i).getAsst_source() %></td>
                                    </tr>
                                <%  } %>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <% 
                            user thisUser = (user) session.getAttribute("currUser");
                            
                            if (thisUser.getUserType().equals("user")){ %>
                                <a class="btn btn-dark" href="<%= root %>/reportController?request=addForm" role="button">Add</a>
                            <% }
                            else if (thisUser.getUserType().equals("admin")){ %>
                                <a class="btn btn-dark" href="<%= root %>/reportController?request=delete" role="button">Delete</a>
                            <% }
                        %>
                        
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
