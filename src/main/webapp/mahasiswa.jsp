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
		<h1 class="text-center">Data Mahasiswa</h1>
		<br>
		<br>
		<div class="justify-content-end">			
			<a class="btn btn-primary" href="tambah_mahasiswa.jsp">Tambah Mahasiswa</a>
		</div>
		<div class="card mt-3">
		<div class="card-body">
		<table class="table table-striped align-middle">
			<thead>
				<tr align="center">
					<th scope="col">NIM</th>
					<th scope="col">Nama</th>
					<th scope="col">Jenis Kelamin</th>
					<th scope="col">Tempat Lahir</th>
					<th scope="col">Tanggal Lahir</th>
					<th scope="col">Alamat</th>
					<th scope="col">Aksi</th>
				</tr>
			</thead>
			<%
			MahasiswaModel Mahasiswa = new MahasiswaModel();
			ArrayList<Mahasiswa> mahasiswa = new ArrayList<Mahasiswa>();
			mahasiswa = Mahasiswa.getData();
			for (int i = 0; i < mahasiswa.size(); i++) {
			%>
			<tr align="center">
				<th scope="row"><% out.print(mahasiswa.get(i).getNim()); %> </th>
				<td><% out.print(mahasiswa.get(i).getNama()); %> </td>
				<td><% out.print(mahasiswa.get(i).getJk()); %></td>
				<td><% out.print(mahasiswa.get(i).getTmpLahir()); %></td>
				<td><% out.print(mahasiswa.get(i).getTglLahir()); %></td>
				<td><% out.print(mahasiswa.get(i).getAlamat()); %></td>
				<td>
					<a class="btn btn-outline-success" href="ubah_mahasiswa.jsp?nim=<%out.print(mahasiswa.get(i).getNim());%>">Ubah</a>
					<a class="btn btn-outline-danger" href="hapus_mahasiswa.jsp?nim=<%out.print(mahasiswa.get(i).getNim());%>" onclick="return confirm('Apakah anda yakin akan menghapus data?')">Hapus</a>
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