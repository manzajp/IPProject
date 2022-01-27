<%-- 
    Document   : map
    Created on : 5 Jan 2022, 8:27:30 AM
    Author     : Admin
--%>

<%@include file="../../resources/prereq.jsp"%>
<%-- active sidebar --%>
<%    
    title = "Disaster Information Relief System - Heatmap";
    nav_dashboard = "";
    nav_forum = "";
    nav_heatmap = "active";
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
                <%@include file="../../resources/sidebar.jsp"%>
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div id="map"></div>
                </main>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"/>
        <script src="<%= bootstrapJS%>"/>
        <script src="<%= featherJS%>"/>
        <script src="<%= chartJS%>"/>
        <script src="<%= pageJS%>"/>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7Lhbf9lPZrTKVJundlM305jC12NnBu6Y&callback=initMap&v=weekly" async />
    </body>
</html>

