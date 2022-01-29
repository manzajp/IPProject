<%@include file="../../resources/prereq.jsp"%>
<%-- active sidebar --%>
<%    
    title = "Disaster Information Relief System - Profile";
    nav_dashboard = "";
    nav_users = "";
    nav_ec = "";
    nav_disaster = "";
    nav_relief = "";
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../resources/head.jsp"%>
    <body>
        <%@include file="../../resources/header.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <%@include file= "../../resources/sidebar.jsp"%>
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>Your Profile</h2>
                    </div>
                    <div>
                        <%
                            user thisUser = (user) session.getAttribute("currUser");
                        %>
                        <h5>User Type: <%= thisUser.getUserType() %></h5>
                        <br>
                        <h5>User ID: <%= thisUser.getId() %></h5>
                        <br>
                        <h5>Username: <%= thisUser.getUsername() %></h5>
                        <br>
                        <button class="btn btn-warning" onclick="window.location.href='<%= views %>/profile/editProfile.jsp';">Edit profile</button>
                    </div>
                </main>
            </div>
        </div>
        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
