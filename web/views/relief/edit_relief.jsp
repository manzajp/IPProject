
<%@page import="_model.Relief"%>
<%@include file="_prereq.jsp"%>
<%-- page settings --%>
<%   
    title = "Disaster Information Relief System - Relief";
    nav_relief = "active";
%>

<%    
    Relief _relief = (Relief) request.getAttribute("relief");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="_head.jsp"%>
    <body>
        <%@include file="_header.jsp"%>

        <div class="container-fluid">
            <div class="row">
                <%@include file="_sidebar.jsp"%>

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>Edit Relief</h2>
                    </div>
                    <div>
                        <script>
                            function formValidate(){
                                let title = document.forms["reliefForm"]["title"].value;
                                let description = document.forms["reliefForm"]["description"].value;
                                let startDate = document.forms["reliefForm"]["startDate"].value;
                                let endDate = document.forms["reliefForm"]["endDate"].value;
                                let state = document.forms["reliefForm"]["state"].value;
                                
                                if (title == "") {
                                  alert("Title must be filled out!");
                                  return false;
                                } 
                                if (description == "") {
                                  alert("Description must be filled out!");
                                  return false;
                                }
                                if (startDate == "") {
                                  alert("Start date must be filled out!");
                                  return false;
                                }
                                if (endDate == "") {
                                  alert("End date must be filled out!");
                                  return false;
                                }
                                if (state == "") {
                                  alert("State must be filled out!");
                                  return false;
                                }
                            }
                        </script>
                        <form name="reliefForm" onsubmit="return formValidate();" action="relief?request=edit&id=<%= _relief.getId()%>" method="POST">
                            <div class="form-group">
                                <div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td class="table-dark col-2">Title</td>
                                            <td><input name="title" id="title" type="text" class="form-control" aria-describedby="titleHelp" placeholder="Enter relief's title" value="<%= _relief.getTitle()%>"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Description</td>
                                            <td><input name="description" id="description" type="text" class="form-control" aria-describedby="descHelp" placeholder="Enter relief's description" value="<%= _relief.getDescription() %>"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Location</td>
                                            <td>
                                                <select name="location" id="location" class="form-control" aria-describedby="locationHelp" placeholder="Enter a location" value="<%= _relief.getLocation() %>">
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
                                            <td class="table-dark col-2">Start Date</td>
                                            <td><input name="startDate" id="startDate" type="date" class="form-control" aria-describedby="startDateHelp" placeholder="Enter a date" value="<%= _relief.getStartDate() %>"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">End Date</td>
                                            <td><input name="endDate" id="endDate" type="date" class="form-control" aria-describedby="endDateHelp" placeholder="Enter a date" value="<%= _relief.getEndDate() %>"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">Active State</td>
                                            <td>
                                                <select name="state" id="state" class="form-control" aria-describedby="stateHelp" placeholder="Enter a state" value="<%= _relief.getState() %>">
                                                    <option value="Active">Active</option>
                                                    <option value="Inactive">Inactive</option>
                                                    <option value="Completed">Completed</option>
                                                    <option value="Delayed">Delayed</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <br/>
                            <button type="submit" class="btn btn-dark">Submit</button>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="_footer.jsp"%>
    </body>
</html>
