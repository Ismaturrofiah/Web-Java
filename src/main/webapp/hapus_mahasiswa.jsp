<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hapus Data Mahasiswa</title>
</head>
<body>
	<%@ page import="id.ac.uns.vokasi.d3ti.univ.*" %>

	<%
	String nim = request.getParameter("nim");
	
	MahasiswaModel mahasiswa = new MahasiswaModel();
	Mahasiswa Mahasiswa= new Mahasiswa();
	Mahasiswa.setNim(nim);
	mahasiswa.deleteMahasiswa(nim);
	response.sendRedirect("mahasiswa.jsp");
	%>
</body>
</html>