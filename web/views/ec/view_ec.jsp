<%-- 
    Document   : view_ec
    Created on : Jan 28, 2022, 2:21:54 PM
    Author     : User
--%>

<%@page import="_model.user"%>
<%@page import="_model.EvacCentre"%>
<%@include file="../../resources/prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Evacuation Centres";
    nav_ec = "active";
%>

<%-- servlet get --%>
<%
    EvacCentre ecentreToView = (EvacCentre) session.getAttribute("ecentreToView");
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
                        <h2>Evacuation Centre</h2>
                    </div>
                    <div>
                        <table class="table table-bordered">
                            <tr>
                                <td class="table-dark col-2">Centre ID:</td>
                                <td><%= ecentreToView.getId() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Centre Name:</td>
                                <td><%= ecentreToView.getCentreName() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Location:</td>
                                <td><%= ecentreToView.getCentreLoc() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Capacity:</td>
                                <td><%= ecentreToView.getCapacity() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Max Capacity:</td>
                                <td><%= ecentreToView.getMaxCapacity() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Max Capacity:</td>
                                <td><%= ecentreToView.getActivity() %></td>
                            </tr>
                        </table>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-1"><a href="?request=index" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Back</a></div>
                        <% 
                            user thisUser = (user) session.getAttribute("currUser");
                            
                            if (thisUser.getUserType().equals("admin")){ %>
                                <div class="col-1"><a href="?request=editForm_admin&id=<%= ecentreToView.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Edit</a></div>
                                <div class="col-1"><a href="?request=delete&id=<%= ecentreToView.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Delete</a></div>
                            <% }
                            else if (thisUser.getUserType().equals("agency")){ %>
                                <div class="col-1"><a href="?request=editForm_agency&id=<%= ecentreToView.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Update</a></div>
                            <% }
                        %>
                        
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
