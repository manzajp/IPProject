<%@include file="../../resources/prereq.jsp"%>
<%-- active sidebar --%>
<%    
    title = "Disaster Information Relief System - Profile";
    nav_dashboard = "";
    nav_forum = "";
    nav_heatmap = "";
    nav_disaster = "";
    nav_relief = "";
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../resources/head.jsp"%>
    <body>
        <%@include file="../../resources/header.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <%@include file= "../../resources/sidebar.jsp"%>
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h2>Edit Your Profile</h2>
                    </div>
                    <div>
                        <script>
                            function confirmFunc() {
                                if (confirm("Are you sure you want to edit your profile?")) {
                                    return true;
                                } else {
                                    return false;
                                }
                            }
                        </script>
                        <form name="profileForm" onsubmit="return confirmFunc()" action="<%= root %>/editProfileServlet" method="post">
                            <div class="form-group">
                                <input name="username" id="username" type="text" class="form-control" placeholder="Enter new username">
                                <br/>
                                <input name="password" id="password" type="password" class="form-control" placeholder="Enter new password">
                                <br/>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-success" >Submit</button>
                                <button type="reset" class="btn btn-warning" >Reset</button>
                            </div>
                        </form>
                        <br>
                        <button class="btn btn-primary" onclick="window.location.href='<%= views %>/profile/profile.jsp';">Go back</button>
                    </div>
                </main>
            </div>
        </div>
        <% 
            if (session.getAttribute("change") != null){
                String changes = (String) session.getAttribute("change");
                if (changes.equals("none")){ %>
                    <script>
                        alert("Nothing was changed.");
                    </script>
                <% } else if (changes.equals("uname")) { %>
                    <script>
                        alert("Username changed successfully.");
                    </script>
                <% } else if (changes.equals("pwd")) { %>
                    <script>
                        alert("Password changed successfully.");
                    </script>
                <% } else if (changes.equals("both")) { %>
                    <script>
                        alert("Username and password changed successfully.");
                    </script>
                <% }
                session.removeAttribute("change");
            }
        %>
        <%@include file="../../resources/footer.jsp"%>
    </body>
</html>
