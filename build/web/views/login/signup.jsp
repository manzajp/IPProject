
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../resources/prereq.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Disaster Information Relief System - Register</title>

        <!-- Bootstrap core CSS -->
        <link href="<%= bootstrapCSS%>" rel="stylesheet">
        
        <script src="<%= bootstrapJS %>"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
    </head>
    <body>
        
        <div class="container">
            <h3>Disaster Information Relief System - Register</h3>
            <form class="well form-horizontal" action="<%= root %>/registerServlet" method="post">
                <fieldset>
                    <div class="form-group">
                        <label class= "col-md-4 control-label" for="uname">Username:</label>
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <input  type="text" class="form-control" id="uname" name="uname" required>
                            </div>
                        </div>
                        <label class= "col-md-4 control-label" for="password">Password:</label>
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <input  type="password" class="form-control" id="password1" name="password1" required>
                            </div>
                        </div>
                        <label class= "col-md-4 control-label" for="password">Reenter password:</label>
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <input  type="password" class="form-control" id="password2" name="password2" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-success" >Register</button>
                            <button type="reset" class="btn btn-warning" >Reset</button>
                        </div>
                    </div>
                </fieldset>
            </form>
            <br>
            <button class="btn btn-primary" onclick="window.location.href='<%= views %>/login/login.jsp';">Back to login</button>
        </div>
        
        <% 
            if (session.getAttribute("errorRegister") != null){
                String errorType = (String) session.getAttribute("errorRegister"); 
                if (errorType.equals("pwdDiff")){ %>
                    <script>
                        alert("The passwords you entered did not match.");
                    </script>
                <% } else if (errorType.equals("unameUnique")) { %>
                    <script>
                        alert("That username has already been used.");
                    </script>
                <% } else if (errorType.equals("success")) { %>
                    <script>
                        alert("Registration success.");
                    </script>
                <% }
                session.removeAttribute("errorRegister");
            }
        %>
    </body>
</html>
