<%-- 
    Document   : view_report
    Created on : Jan 30, 2022, 11:16:27 AM
    Author     : User
--%>
<%@page import="_model.user"%>
<%@page import="_model.report"%>
<%@include file="../../resources/prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Reports";
    nav_disaster = "active";
%>

<%-- servlet get --%>
<%
    report reportToView = (report) session.getAttribute("reportToView");
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
                        <h2>Report</h2>
                    </div>
                    <div>
                        <table class="table table-bordered">
                            <tr>
                                <td class="table-dark col-2">Report ID:</td>
                                <td><%= reportToView.getId() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Date:</td>
                                <td><%= reportToView.getDate() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Location:</td>
                                <td><%= reportToView.getLocation() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Disaster Type:</td>
                                <td><%= reportToView.getDisaster_type() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Assistance Type:</td>
                                <td><%= reportToView.getAsst_type() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Assistance Source:</td>
                                <td><%= reportToView.getAsst_source() %></td>
                            </tr>
                        </table>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-1"><a href="?request=index" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Back</a></div>
                        <% 
                            user thisUser = (user) session.getAttribute("currUser");
                            
                            if (thisUser.getUserType().equals("admin")){ %>
                                <div class="col-1"><a href="?request=delete&id=<%= reportToView.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Delete</a></div>
                            <% }
                            else if (thisUser.getUserType().equals("user")){ %>
                                <div class="col-1"><a href="?request=editForm&id=<%= reportToView.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Edit</a></div>
                            <% }
                        %>
                        
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>