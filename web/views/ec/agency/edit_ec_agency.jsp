<%-- 
    Document   : edit_ec_agency
    Created on : Jan 28, 2022, 2:20:15 PM
    Author     : User
--%>

@page import="_model.user"%>
<%@page import="_model.EvacCentre"%>
<%@include file="../../../resources/prereq.jsp"%>
<%-- page settings --%>
<%   
    title = "Disaster Information Relief System - Evacuation Centres";
    nav_ec = "active";
%>

<%
    user thisUser = (user) session.getAttribute("currUser");
    if (!thisUser.getUserType().equals("agency")){
        String dash = "0; url='" + request.getContextPath() + "/views/dashboard/dashboard.jsp'"; %>
        <meta http-equiv="Refresh" content="<%= dash %>" /> <%
    }
%>    

<%  
    int id = Integer.parseInt(request.getParameter("id"));
    EvacCentre ecentreToEdit = (EvacCentre) session.getAttribute("ecentreToView");
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
                        <h2>Edit User</h2>
                    </div>
                    <div>
                        <script>
                            function formValidate(){
                                let capacity = document.forms["ecentreEditForm"]["capacity"].value;
                                
                                if (capacity === "") {
                                  alert("Capacity must be filled out!");
                                  return false;
                                }
                                return true;
                            }
                        </script>
                        <form name="ecentreEditForm" onsubmit="return formValidate()" action="<%= root %>/evacController?request=edit_agency&id=<%= id %>" method="POST">
                            <div class="form-group">
                                <div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td class="table-dark col-2">Centre Name</td>
                                            <td><input name="centreName" id="centreName" type="text" class="form-control" aria-describedby="centreNameHelp" placeholder="Enter new centre name" value="<%= ecentreToEdit.getCentreName() %>" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Max Capacity</td>
                                            <td><input name="maxCapacity" id="maxCapacity" type="number" class="form-control" aria-describedby="maxCapacityHelp" placeholder="Enter new max capacity" value="<%= ecentreToEdit.getMaxCapacity()%>" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Capacity</td>
                                            <td><input name="capacity" id="capacity" type="number" class="form-control" aria-describedby="capacityHelp" placeholder="Enter new capacity" value="<%= ecentreToEdit.getCapacity()%>"></td>
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
