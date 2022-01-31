<%-- 
    Document   : create_report
    Created on : Jan 30, 2022, 7:09:31 PM
    Author     : User
--%>
<%@page import="_model.user"%>
<%@page import="_model.report"%>
<%@include file="../../resources/prereq.jsp"%>
<%-- page settings --%>
<%   
    title = "Disaster Information Relief System - Reports";
    nav_disaster = "active";
%>

<%
    user thisUser = (user) session.getAttribute("currUser");
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
                        <h2>Make a Report</h2>
                    </div>
                    <div>
                        <script>
                            function formValidate(){
                                let date = document.forms["reportEditForm"]["date"].value;
                                let location = document.forms["reportEditForm"]["location"].value;
                                let disaster_type = document.forms["reportEditForm"]["disaster_type"].value;
                                let asst_type = document.forms["reportEditForm"]["asst_type"].value;
                                let asst_source = document.forms["reportEditForm"]["asst_source"].value;
                                
                                if (date === "") {
                                  alert("Date must be filled out!");
                                  return false;
                                } 
                                if (location === "") {
                                  alert("Location must be selected!");
                                  return false;
                                } 
                                if (disaster_type === "") {
                                  alert("Disaster type must be filled out!");
                                  return false;
                                }
                                if (asst_type === "") {
                                  alert("Assistance type must be selected!");
                                  return false;
                                } 
                                if (asst_source === "") {
                                  alert("Assistance source type must be selected!");
                                  return false;
                                }
                                return true;
                            }
                        </script>
                        <form name="reportEditForm" onsubmit="return formValidate()" action="<%= root %>/reportController?request=add" method="POST">
                            <div class="form-group">
                                <div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td class="table-dark col-2">Date</td>
                                            <td><input name="date" id="date" type="date" class="form-control" aria-describedby="dateHelp" placeholder="Enter a date">
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Location</td>
                                            <td>
                                            <select name="location" id="location" class="form-control" aria-describedby="locationHelp" placeholder="Select a location">
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
                                            <td class="table-dark col-2">Disaster Type</td>
                                            <td><input name="disaster_type" id="disaster_type" type="text" class="form-control" aria-describedby="disaster_typeHelp" placeholder="Enter a disaster type"></td>
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
                                            <td>
                                                <select name="asst_source" id="asst_source" class="form-control" aria-describedby="asst_sourceHelp" placeholder="Select the assistance source preferred">
                                                    <option value="Community">Community</option>
                                                    <option value="Agencies">Agencies</option>
                                                    <option value="Agencies">Government</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <br/>
                            <div class="row justify-content-center">
                                <div class="col-1"><button type="submit" class="btn btn-dark">Submit</button></div>
                                <div class="col-1"><a href="?request=index" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Back</a></div>
                            </div>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
