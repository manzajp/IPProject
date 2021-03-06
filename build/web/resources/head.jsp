<%-- 
    Document   : head
    Created on : Jan 6, 2022, 9:38:36 AM
    Author     : User
--%>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%= title %></title>

    <!-- Bootstrap core CSS -->
    <link href="<%= bootstrapCSS%>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%= pageCSS%>" rel="stylesheet">
    
    <% 
        if (session.getAttribute("currUser") == null){
            String login = "0; url='" + request.getContextPath() + "/views/login/login.jsp'"; %>
            <meta http-equiv="Refresh" content="<%= login %>" /> <%
        }
    %>
</head>
