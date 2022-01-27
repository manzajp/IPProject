<%-- 
    Document   : ec-form
    Created on : Jan 19, 2022, 2:12:31 AM
    Author     : User
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Evacuation Centre Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> EC Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/views/ec/ec-list.jsp"
					class="nav-link">Evacuation Centres</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${ec != null}">
					<form action="/update" method="post">
				</c:if>
				<c:if test="${ec == null}">
					<form action="/insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${ec != null}">
            			Edit Centre
            		</c:if>
						<c:if test="${ec == null}">
            			Add New Centre
            		</c:if>
					</h2>
				</caption>

				<c:if test="${ec != null}">
					<input type="hidden" name="id" value="<c:out value='${ec.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Centre Name</label> <input type="text"
						value="<c:out value='${ec.centreName}' />" class="form-control"
						name="centreName" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Centre Location</label> <input type="text"
						value="<c:out value='${ec.centreLoc}' />" class="form-control"
						name="centreLoc">
				</fieldset>

				<fieldset class="form-group">
					<label>Centre Capacity</label> <input type="text"
						value="<c:out value='${ec.capacity}' />" class="form-control"
						name="capacity">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>