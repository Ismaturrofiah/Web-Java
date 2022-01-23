<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hapus Data Mata Kuliah</title>
</head>
<body>
	<%@ page import="id.ac.uns.vokasi.d3ti.univ.*" %>

	<%
	String matakuliah_kode = request.getParameter("matakuliah_kode");
	
	MataKuliahModel matakuliah = new MataKuliahModel();
	MataKuliah MataKuliah= new MataKuliah();
	MataKuliah.setMataKuliah_Kode(matakuliah_kode);
	matakuliah.deleteMataKuliah(matakuliah_kode);
	response.sendRedirect("matakuliah.jsp");
	%>
</body>
</html>