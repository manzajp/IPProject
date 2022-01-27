<%@page import="_model.user"%>
<%@include file="../../../resources/prereq.jsp"%>
<%-- page settings --%>
<%   
    title = "Disaster Information Relief System - Users";
    nav_users = "active";
%>

<%
    user thisUser = (user) session.getAttribute("currUser");
    if (!thisUser.getUserType().equals("admin")){
        String dash = "0; url='" + request.getContextPath() + "/views/dashboard/dashboard.jsp'"; %>
        <meta http-equiv="Refresh" content="<%= dash %>" /> <%
    }
%>    

<%    
    user userToEdit = (user) session.getAttribute("userToView");
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
                                let uname = document.forms["usersEditForm"]["uname"].value;
                                let utype = document.forms["usersEditForm"]["userType"].value;
                                
                                if (uname === "") {
                                  alert("Title must be filled out!");
                                  return false;
                                } 
                                if (utype === "") {
                                  alert("Description must be filled out!");
                                  return false;
                                }
                                return true;
                            }
                        </script>
                        <form name="usersEditForm" onsubmit="return formValidate()" action="<%= root %>/usersController?request=edit" method="POST">
                            <div class="form-group">
                                <div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td class="table-dark col-2">Username</td>
                                            <td><input name="uname" id="uname" type="text" class="form-control" aria-describedby="unameHelp" placeholder="Enter new username" value="<%= userToEdit.getUsername() %>"></td>
                                        </tr>
                                        <tr>
                                            <td class="table-dark col-2">User Type</td>
                                            <td>
                                                <select name="userType" id="userType" class="form-control" aria-describedby="userTypeHelp" placeholder="Select a user type">
                                                    <option value="admin">Admin</option>
                                                    <option value="user">User</option>
                                                    <option value="agency">Agency</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <br/>
                            <div class="row justify-content-center">
                                <div class="col-1"><button type="submit" class="btn btn-dark">Submit</button></div>
                                <div class="col-1"><a href="?request=view&id=<%= userToEdit.getId() %>" class="btn btn-primary btn-block active" role="button" aria-pressed="true">Back</a></div>
                            </div>
                            <input name="id" id="id" type="hidden" value="<%= userToEdit.getId() %>">
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../../../resources/footer.jsp"%>
    </body>
</html>
