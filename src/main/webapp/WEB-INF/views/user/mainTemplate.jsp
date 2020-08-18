<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/> </title>
</head>
<body>
<tiles:insertAttribute name="sidenav"></tiles:insertAttribute>
<div class="main-content" id="panel">
	<tiles:insertAttribute name="topnav"></tiles:insertAttribute>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
<%-- 	<tiles:insertAttribute name="footer"></tiles:insertAttribute> --%>
</div>
</body>
</html>