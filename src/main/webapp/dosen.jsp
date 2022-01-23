<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Universitas Pahlawan</title>
  </head>
  <body>
  	<%@ page import="java.util.ArrayList"%>
	<%@ page import="id.ac.uns.vokasi.d3ti.univ.*"%>
	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.Statement"%>
  	<%@ include file="header.jsp"%>
  	
  	<div class="container">
		<br>
		<h1 class="text-center">Data Dosen</h1>
		<br>
		<br>
		<div class="justify-content-end">			
			<a class="btn btn-primary" href="tambah_dosen.jsp">Tambah Dosen</a>
		</div>
		<div class="card mt-3">
		<div class="card-body">
		<table class="table table-striped align-middle">
			<thead>
				<tr align="center">
					<th scope="col">No</th>
					<th scope="col">NIP</th>
					<th scope="col">Nama</th>
					<th scope="col">Aksi</th>
				</tr>
			</thead>
			<%
			DosenModel Dosen = new DosenModel();
			ArrayList<Dosen> dosen = new ArrayList<Dosen>();
			dosen = Dosen.getData();
			for (int i = 0; i < dosen.size(); i++) {
			%>
			<tr align="center">
				<th scope="row"><% out.print(dosen.get(i).getNo()); %> </th>
				<td><% out.print(dosen.get(i).getNip()); %> </td>
				<td><% out.print(dosen.get(i).getNama()); %> </td>
				<td>
					<a class="btn btn-outline-success" href="ubah_dosen.jsp?no=<%out.print(dosen.get(i).getNo());%>">Ubah</a>
					<a class="btn btn-outline-danger" href="hapus_dosen.jsp?no=<%out.print(dosen.get(i).getNo());%>" onclick="return confirm('Apakah anda yakin akan menghapus data?')">Hapus</a>
				</td>
			</tr>
			<% } %>
		</table>
		</div>
		</div>
		<br> <br>
	</div>
  	
    <%@ include file="footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>