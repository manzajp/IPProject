<%@page import="_model.Relief"%>
<%@include file="_prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Relief";
    nav_relief = "active";
%>

<%-- servlet get --%>
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
                        <h2>Relief</h2>
                    </div>
                    <div>
                        <table class="table table-bordered">
                            <tr>
                                <td class="table-dark col-2">Title</td>
                                <td><%= _relief.getTitle() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Description</td>
                                <td><%= _relief.getDescription() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Location</td>
                                <td><%= _relief.getLocation() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Start Date</td>
                                <td><%= _relief.getStartDate() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">End Date</td>
                                <td><%= _relief.getEndDate() %></td>
                            </tr>
                            <tr>
                                <td class="table-dark col-2">Active State</td>
                                <td><%= _relief.getState() %></td>
                            </tr>
                        </table>
                    </div>
                    <% 
                        user thisUser = (user) session.getAttribute("currUser");
                        if (thisUser.getUserType().equals("agency") || thisUser.getUserType().equals("admin")){ 
                    %>
                            <div class="row justify-content-center">
                                <div class="col-1"><a href="?request=editForm&id=<%= _relief.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Edit</a></div>
                                
                    <% 
                        }
                    %>
                            <% 
                                if (thisUser.getUserType().equals("admin")){ 
                            %>
                                <div class="col-1"><a onclick="return confirm('Are you sure about deleting this relief?')" href="?request=delete&id=<%= _relief.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Delete</a></div>
                            <% 
                                }
                            %>
                            </div>
                </main>
            </div>
        </div>
        <%@include file="_footer.jsp"%>
    </body>
</html>
