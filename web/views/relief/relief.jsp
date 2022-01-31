<%@page import="_model.user"%>
<%@page import="_model.Relief"%>
<%@page import="java.util.ArrayList"%>
<%@include file="_prereq.jsp"%>
<%-- page settings --%>
<%    
    title = "Disaster Information Relief System - Relief";
    nav_relief = "active";
%>

<%-- servlet get --%>
<%    
    ArrayList<Relief> reliefs = (ArrayList<Relief>) request.getAttribute("reliefs");
    ArrayList<Integer> userReliefs = (ArrayList<Integer>) request.getAttribute("userReliefs");
    ArrayList<Integer> noUserReliefs = (ArrayList<Integer>) request.getAttribute("noUserReliefs");
    user thisUser = (user) session.getAttribute("currUser");
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
                        <h2>List of Reliefs</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <td>Title</td>
                                    <td>Description</td>
                                    <td>Location</td>
                                    <td>Date</td>
                                    <td>Active State</td>
                                    <td>No of Users</td>
                                    <td>Joined</td>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- loop -->
                                <% int j = 0; %>
                                <% for(int i = 0; i < reliefs.size(); i++) {%>
                                    <tr onclick="window.location = 'relief?request=view&id=<%= reliefs.get(i).getId() %>';">
                                        <td><%= reliefs.get(i).getTitle() %></td>
                                        <td><%= reliefs.get(i).getDescription() %></td>
                                        <td><%= reliefs.get(i).getLocation() %></td>
                                        <td><%= reliefs.get(i).getStartDate() %></td>  
                                        <td><%= reliefs.get(i).getState() %></td>  
                                        <td><%= noUserReliefs.get(i) %></td>
                                        <% if (reliefs.get(i).getState().equals("Active")) { %>
                                            <% if ((j < userReliefs.size()) && (reliefs.get(i).getId() ==  userReliefs.get(j))) { %>
                                                    <td>
                                                        <a class="btn btn-dark col-12 disabled" href="#" role="button" aria-disabled="true">Joined</a>
                                                    </td>
                                                    <% j++; %>
                                            <% } else { %>
                                                <td>
                                                    <a class="btn btn-dark col-12" onclick="return confirm('You want to apply for this relief?')" href="relief?request=join&id=<%= reliefs.get(i).getId() %>" role="button">Join</a>
                                                </td>
                                            <% } %>                                        
                                        <% } else { %>
                                            <td>
                                                <a class="btn btn-dark col-12 disabled" href="#" role="button" aria-disabled="true">Cannot Join</a>
                                            </td>
                                        <% } %> 
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% 
                        if (thisUser.getUserType().equals("admin") || thisUser.getUserType().equals("agency")){ %>
                            <div>
                                <a class="btn btn-dark" href="relief?request=newForm" role="button">Add</a>
                            </div>
                        <% }
                    %>
                </main>
            </div>
        </div>

        <%@include file="_footer.jsp"%>
    </body>
</html>
