<%-- 
    Document   : edit_ec_admin
    Created on : Jan 28, 2022, 2:20:33 PM
    Author     : User
--%>

<%@page import="_model.user"%>
<%@page import="_model.EvacCentre"%>
<%@include file="../../../resources/prereq.jsp"%>
<%-- page settings --%>
<%   
    title = "Disaster Information Relief System - Evacuation Centres";
    nav_ec = "active";
%>

<%
    user thisUser = (user) session.getAttribute("currUser");
    if (!thisUser.getUserType().equals("admin")){
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
                                let centreName = document.forms["ecentreEditForm"]["centreName"].value;
                                let centreLoc = document.forms["ecentreEditForm"]["centreLoc"].value;
                                
                                if (centreName === "") {
                                  alert("Centre name must be filled out!");
                                  return false;
                                } 
                                if (centreLoc === "") {
                                  alert("Location must be selected!");
                                  return false;
                                }
                                return true;
                            }
                        </script>
                        <form name="ecentreEditForm" onsubmit="return formValidate()" action="<%= root %>/evacController?request=edit&id=<%= id %>" method="POST">
                            <div class="form-group">
                                <div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td class="table-dark col-2">Centre Name</td>
                                            <td><input name="centreName" id="centreName" type="text" class="form-control" aria-describedby="centreNameHelp" placeholder="Enter new centre name" value="<%= ecentreToEdit.getCentreName() %>"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Location</td>
                                            <td>
                                                <select name="centreLoc" id="centreLoc" class="form-control" aria-describedby="centreLocHelp" placeholder="Select a location">
                                                    <option value="Johor">Johor</option>
                                                    <option value="Kedah">Kedah</option>
                                                    <option value="Kelantan">Kelantan</option>
                                                    <option value="Melaka">Melaka</option>
                                                    <option value="Negeri Sembilan">Negeri Sembilan</option>
                                                    <option value="Pahang">Pahang</option>
                                                    <option value="Penang">Penang</option>
                                                    <option value="Perak">Perak</option>
                                                    <option value="Perlis">Perlis</option>
                                                    <option value="Selangor">Selangor</option>
                                                    <option value="Terengganu">Terengganu</option>
                                                    <option value="Sabah">Sabah</option>
                                                    <option value="Sarawak">Sarawak</option>
                                                    <option value="Kuala Lumpur">Kuala Lumpur</option>
                                                    <option value="Labuan">Labuan</option>
                                                    <option value="Putrajaya">Putrajaya</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Max Capacity</td>
                                            <td><input name="maxCapacity" id="maxCapacity" type="number" class="form-control" aria-describedby="maCapacityHelp" placeholder="Enter new max capacity" value="<%= ecentreToEdit.getMaxCapacity()%>"></td>
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
