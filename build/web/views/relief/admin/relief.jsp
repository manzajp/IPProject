<%@page import="_model.user"%>
<%@page import="_model.Relief"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../../../resources/prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Relief";
    nav_relief = "active";
%>

<%-- servlet get --%>
<%    
    ArrayList<Relief> reliefs = (ArrayList<Relief>) request.getAttribute("reliefs");
    user userToView = (user) session.getAttribute("userToView");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../../resources/head.jsp"%>
    <body>
        <%@include file="../../../resources/header.jsp"%>

        <div class="container-fluid">
            <div class="row">
                <%@include file="../../../resources/sidebar.jsp"%>

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>List of Reliefs</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <td>Title</td>
                                    <td>Description</td>
                                    <td>Location</td>
                                    <td>Date</td>
                                    <td>Active State</td>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- loop -->
                                <% for(int i = 0; i < reliefs.size(); i++) {%>
                                <tr onclick="window.location = 'relief?request=view&id=<%= reliefs.get(i).getId() %>';">
                                    <td><%= reliefs.get(i).getTitle() %></td>
                                    <td><%= reliefs.get(i).getDescription() %></td>
                                    <td><%= reliefs.get(i).getLocation() %></td>
                                    <td><%= reliefs.get(i).getStartDate() %></td>  
                                    <td><%= reliefs.get(i).getState() %></td>  
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% 
                        user thisUser = (user) session.getAttribute("currUser");
                        if (thisUser.getUserType().equals("admin")){ %>
                            <div>
                                <a class="btn btn-dark" href="relief?request=newForm" role="button">Add</a>
                            </div>
                        <% }
                    %>
                </main>
            </div>
        </div>

        <%@include file="../../../resources/footer.jsp"%>
    </body>
</html>
