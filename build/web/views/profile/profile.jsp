<%@include file="../../resources/prereq.jsp"%>
<%-- active sidebar --%>
<%    
    title = "Disaster Information Relief System - Profile";
    nav_dashboard = "";
    nav_forum = "";
    nav_heatmap = "";
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
                        
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
