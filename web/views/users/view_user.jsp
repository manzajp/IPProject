<%@page import="_model.user"%>
<%@include file="../../resources/prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Users";
    nav_users = "active";
%>

<%-- servlet get --%>
<%
    user userToView = (user) session.getAttribute("userToView");
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
                        <h2>User</h2>
                    </div>
                    <div>
                        <table class="table table-bordered">
                            <tr>
                                <td class="table-dark col-2">User ID:</td>
                                <td><%= userToView.getId() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Username:</td>
                                <td><%= userToView.getUsername() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">User Type:</td>
                                <td><%= userToView.getUserType() %></td>
                            </tr>
                        </table>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-1"><a href="?request=index" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Back</a></div>
                        <% 
                            user thisUser = (user) session.getAttribute("currUser");
                            
                            if (thisUser.getUserType().equals("admin")){ %>
                                <div class="col-1"><a href="?request=editForm&id=<%= userToView.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Edit</a></div>
                                <div class="col-1"><a href="?request=delete&id=<%= userToView.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Delete</a></div>
                            <% }
                        %>
                        
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
