<%-- 
    Document   : prereq
    Created on : Jan 5, 2022, 10:55:32 PM
    Author     : User
--%>

<%
    String root = request.getContextPath();
    String views = root + "/views";
    String resources = root + "/resources";
    String bootstrap = resources + "/bootstrap";
%>

<%-- view url --%>
<%
    String dashboard = views + "/dashboard";
    String forum = views + "/forum";
    String heatmap = views + "/heatmap";
    String disaster = views + "/disaster";
    String relief = views + "/relief";
%>

<%-- external css --%>
<%
    String bootstrapCSS = bootstrap + "/css/bootstrap.min.css";
    String pageCSS = bootstrap + "/dashboard/dashboard.css";
    String defaultCSS = bootstrap + "";
%>

<%-- external js --%>
<%
    String bootstrapJS = bootstrap + "/js/bootstrap.bundle.min.js";
    String chartJS = resources + "/chartjs/chart.min.js";
    String featherJS = resources + "/feather-icons/feather.min.js";
    String pageJS = bootstrap + "/dashboard/dashboard.js";
    String defaultJS = bootstrap + "";
%>

<%-- active sidebar --%>
<%
    String nav_dashboard;
    String nav_forum;
    String nav_heatmap;
    String nav_disaster;
    String nav_relief;
%>

