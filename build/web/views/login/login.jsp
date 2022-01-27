
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../resources/prereq.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Disaster Information Relief System - Login</title>

        <!-- Bootstrap core CSS -->
        <link href="<%= bootstrapCSS%>" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h3>Disaster Information Relief System - Login</h3>
            <form class="well form-horizontal" action="<%= root %>/loginServlet" method="post">
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
                                <input  type="password" class="form-control" id="password" name="password" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-success" >Log In</button>
                            <button type="reset" class="btn btn-warning" >Reset</button>
                        </div>
                    </div>
                </fieldset>
            </form>
            <br>
            <button class="btn btn-primary" onclick="window.location.href='<%= views %>/login/signup.jsp';">Register Here</button>
        </div>
        <% 
            if (session.getAttribute("errorLogin") != null){
                String errorType = (String) session.getAttribute("errorLogin"); 
                if (errorType.equals("error")){ %>
                    <script>
                        alert("The username or password you entered is invalid.");
                    </script>
                <% }
                session.removeAttribute("errorLogin");
            }
        %>
    </body>
</html>
