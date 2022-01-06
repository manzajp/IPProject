<%-- 
    Document   : relief_form
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
                        <h2>Add Relief</h2>
                    </div>
                    <div>
                        <form name="reliefForm" action="<%= root %>/insertRelief" method="POST">
                            <div class="form-group">
                                <label for="reliefTitle">*Relief's Title</label>
                                <input name="reliefTitle" id="reliefTitle" type="text" class="form-control" aria-describedby="reliefTitleHelp" placeholder="Enter relief's title">
                                <small id="reliefTitleHelp" class="form-text text-muted">We'll never share your username with anyone else.</small>
                            </div>
                            <br/>
                            <button type="submit" class="btn btn-dark">Submit</button>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
