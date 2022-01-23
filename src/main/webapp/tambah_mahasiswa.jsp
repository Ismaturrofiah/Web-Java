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
  <style>
  	h2 {
  		left: 0;
  		right: 0;
  	}
  </style>
  <body>
  	<%@ page import="id.ac.uns.vokasi.d3ti.univ.*"%>
	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.Statement"%>
	<%@ page import="java.util.ArrayList"%>
  	<%@ include file="header.jsp"%>
  	
  	<div class="container">
		<br>
		<h2 class="text-center">Tambah Data Mahasiwa</h2>
		<br>

		<form action="" method="post">
			<table class="table table-borderless">
				<tr>
					<td>NIM</td>
					<td><input type="text" class="form-control" name="nim" onkeypress="return hanyaAngka(event)" maxlength="15" minlength="11" required="required"></td>
				</tr>
				<tr>
					<td>Nama</td>
					<td><input type="text" class="form-control" name="nama" required="required"></td>
				</tr>
				<tr>
					<td>Jenis Kelamin</td>
					<td><input type="text" class="form-control" name="jk" required="required"></td>
				</tr>
				<tr>
					<td>Tempat Lahir</td>
					<td><input type="text" class="form-control" name="tempat_lahir"  required="required"></td>
				</tr>
				<tr>
					<td>Tanggal Lahir</td>
					<td><input type="date" class="form-control" name="tanggal_lahir" required="required"></td>
				</tr>
				<tr>
					<td>Alamat</td>
					<td><input type="textarea" class="form-control" name="alamat" required="required"></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-outline-success" name="submit" value="Tambah"> <input type="reset" class="btn btn-outline-danger" name="reset" value="Reset"></td>
				</tr>
			</table>
		</form>
	</div>

	<%
	String submit = request.getParameter("submit");
	if (submit != null) {
		Mahasiswa mahasiswa = new Mahasiswa();
		mahasiswa.setNim(request.getParameter("nim"));
		mahasiswa.setNama(request.getParameter("nama"));
		mahasiswa.setJk(request.getParameter("jk"));
		mahasiswa.setTmpLahir(request.getParameter("tempat_lahir"));
		mahasiswa.setTglLahir(request.getParameter("tanggal_lahir"));
		mahasiswa.setAlamat(request.getParameter("alamat"));
		MahasiswaModel mahasiswaModel = new MahasiswaModel();
		mahasiswaModel.insertMahasiswa(mahasiswa);
	%>
	<script>
		alert('Data berhasil ditambahkan');
		document.location.href = 'mahasiswa.jsp'
	</script>
	<%
	}
	%>
  	
    <%@ include file="footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>