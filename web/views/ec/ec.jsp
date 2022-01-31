<%-- 
    Document   : ec
    Created on : Jan 28, 2022, 2:21:38 PM
    Author     : User
--%>

<%@page import="_model.EvacCentre"%>
<%@page import="_model.user"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../../resources/prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Evacuation Centres";
    nav_ec = "active";
%>

<%-- servlet get --%>
<%
    ArrayList<EvacCentre> ecentres = (ArrayList<EvacCentre>) session.getAttribute("ecentres");
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
                        <h2>List of Evacuation Centres</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <td>Centre ID</td>
                                    <td>Centre Name</td>
                                    <td>Location</td>
                                    <td>Current Capacity</td>
                                    <td>Max Capacity</td>
                                    <td>Activity</td>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- loop -->
                                <% for(int i = 0; i < ecentres.size(); i++) {%>
                                    <tr onclick="window.location = '<%= root %>/evacController?request=view&id=<%= ecentres.get(i).getId() %>';">
                                        <td><%= ecentres.get(i).getId() %></td>
                                        <td><%= ecentres.get(i).getCentreName() %></td>
                                        <td><%= ecentres.get(i).getCentreLoc() %></td>
                                        <td><%= ecentres.get(i).getCapacity() %></td>
                                        <td><%= ecentres.get(i).getMaxCapacity() %></td>
                                        <td><%= ecentres.get(i).getActivity() %></td>
                                    </tr>
                                <%  } %>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <% 
                            user thisUser = (user) session.getAttribute("currUser");
                            
                            if (thisUser.getUserType().equals("admin")){ %>
                                <a class="btn btn-dark" href="<%= root %>/evacController?request=addForm" role="button">Add</a>
                            <% }
                        %>
                        
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
