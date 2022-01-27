<%@page import="_model.user"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../../resources/prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Users";
    nav_users = "active";
%>

<%-- servlet get --%>
<%
    ArrayList<user> users = (ArrayList<user>) session.getAttribute("users");
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
                        <h2>List of Users</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <td>User ID</td>
                                    <td>Username</td>
                                    <td>User Type</td>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- loop -->
                                <% for(int i = 0; i < users.size(); i++) {%>
                                    <tr onclick="window.location = '<%= root %>/usersController?request=view&id=<%= users.get(i).getId() %>';">
                                        <td><%= users.get(i).getId() %></td>
                                        <td><%= users.get(i).getUsername() %></td>
                                        <td><%= users.get(i).getUserType() %></td>
                                    </tr>
                                <%  } %>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <% 
                            user thisUser = (user) session.getAttribute("currUser");
                            
                            if (thisUser.getUserType().equals("admin")){ %>
                                <a class="btn btn-dark" href="<%= root %>/usersController?request=add" role="button">Add</a>
                            <% }
                        %>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
