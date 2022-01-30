<%-- 
    Document   : edit_report
    Created on : Jan 30, 2022, 11:16:02 AM
    Author     : User
--%>

<%@page import="_model.user"%>
<%@page import="_model.report"%>
<%@include file="../../../resources/prereq.jsp"%>
<%-- page settings --%>
<%   
    title = "Disaster Information Relief System - Reports";
    nav_disaster = "active";
%>

<%
    user thisUser = (user) session.getAttribute("currUser");
    if (!thisUser.getUserType().equals("user")){
        String dash = "0; url='" + request.getContextPath() + "/views/dashboard/dashboard.jsp'"; %>
        <meta http-equiv="Refresh" content="<%= dash %>" /> <%
    }
%>    

<%  
    int id = Integer.parseInt(request.getParameter("id"));
    report reportToEdit = (report) session.getAttribute("reportToView");
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
                        <h2>Edit Report</h2>
                    </div>
                    <div>
                        <script>
                            function formValidate(){
                                let asst_type = document.forms["reportEditForm"]["asst_type"].value;
                                let asst_source = document.forms["reportEditForm"]["asst_source"].value;
                                
                                if (asst_type === "") {
                                  alert("Assitance type must be filled!");
                                  return false;
                                } 
                                if (asst_source === "") {
                                  alert("Assistance source must be selected!");
                                  return false;
                                }
                                return true;
                            }
                        </script>
                        <form name="reportEditForm" onsubmit="return formValidate()" action="<%= root %>/reportController?request=edit_user&id=<%= id %>" method="POST">
                            <div class="form-group">
                                <div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td class="table-dark col-2">Report ID</td>
                                            <td><input name="reportID" id="reportID" type="text" class="form-control" aria-describedby="reportIDHelp" placeholder="Enter new  name" value="<%= reportToEdit.getId() %>" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Date</td>
                                            <td><input name="date" id="date" type="text" class="form-control" aria-describedby="dateHelp" placeholder="Enter new  date" value="<%= reportToEdit.getDate() %>" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Location</td>
                                            <td><input name="location" id="location" type="text" class="form-control" aria-describedby="locationHelp" placeholder="Enter new location" value="<%= reportToEdit.getLocation() %>" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Disaster Type</td>
                                            <td><input name="disaster_type" id="disaster_type" type="text" class="form-control" aria-describedby="disaster_typeHelp" placeholder="Enter new disaster type" value="<%= reportToEdit.getDisaster_type() %>" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Assistance Type</td>
                                            <td>
                                                <select name="asst_type" id="asst_type" class="form-control" aria-describedby="asst_typeHelp" placeholder="Select the assistance type needed">
                                                    <option value="Food">Food</option>
                                                    <option value="Drinks">Drinks</option>
                                                    <option value="Shelter">Shelter</option>
                                                    <option value="Transportation">Transportation</option>
                                                    <option value="Clothings">Clothings</option>
                                                    <option value="Power supply">Power supply</option>
                                                    <option value="Manpower">Manpower</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Assistance Source</td>
                                                <select name="asst_source" id="asst_source" class="form-control" aria-describedby="asst_sourceHelp" placeholder="Select the assistance source preferred">
                                                    <option value="Community">Community</option>
                                                    <option value="Agencies">Agencies</option>
                                                </select>                                        
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <br/>
                            <div class="row justify-content-center">
                                <div class="col-1"><button type="submit" class="btn btn-dark">Submit</button></div>
                                <div class="col-1"><a href="?request=view&id=<%= id %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Back</a></div>
                            </div>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../../resources/footer.jsp"%>
    </body>
</html>
