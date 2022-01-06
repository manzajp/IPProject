<%-- 
    Document   : view_relief
    Created on : Jan 5, 2022, 8:37:59 PM
    Author     : User
--%>

<%@include file="../../resources/prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Relief";
    nav_relief = "active";
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
                        <h2>Relief</h2>
                    </div>
                    <div class="row">
                        <div class="col">Name</div>
                        <div class="col">${reliefTitle}</div>
                    </div>
                    <div class="row">
                        <div class="col">Active State</div>
                        <div class="col">Active</div>
                    </div>
                </main>
            </div>
        </div>
        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
