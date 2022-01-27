<%-- 
    Document   : index
    Created on : Jan 5, 2022, 8:37:59 PM
    Author     : User
--%>

<%
    if (session.getAttribute("loggedIn") == null){
        String login = "0; url='" + request.getContextPath() + "/views/login/login.jsp'"; %>
        <meta http-equiv="Refresh" content="<%= login %>" /> <%
    } else {
        String dashboard = "0; url='" + request.getContextPath() + "/views/dashboard/dashboard.jsp'"; %>
        <meta http-equiv="Refresh" content="<%= dashboard %>" /> <%
    }
%>
