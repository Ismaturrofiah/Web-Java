<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hapus Data Dosen</title>
</head>
<body>
	<%@ page import="id.ac.uns.vokasi.d3ti.univ.*" %>

	<%
	String no = request.getParameter("no");
	
	DosenModel dosen = new DosenModel();
	Dosen Dosen= new Dosen();
	Dosen.setNo(no);
	dosen.deleteDosen(no);
	response.sendRedirect("dosen.jsp");
	%>
</body>
</html>