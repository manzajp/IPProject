<%-- 
    Document   : relief
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
                        <h2>Reliefs</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <td>Title</td>
                                    <td>Date Started</td>
                                    <td>Active State</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr onclick="window.location = '<%= dashboard%>/dashboard.jsp';">
                                    <td>Batu Caves Relief!</td>
                                    <td>10/01/2021</td>
                                    <td>Active</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <a class="btn btn-dark" href="<%= relief %>/relief_form.jsp" role="button">Add</a>
                    </div>
                </main>



            </div>
        </div>

        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
