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
		<h2 class="text-center">Tambah Data Dosen</h2>
		<br>

		<form action="" method="post">
			<table class="table table-borderless">
				<tr>
					<td>NIP</td>
					<td><input type="text" class="form-control" name="nip" onkeypress="return hanyaAngka(event)" maxlength="15" minlength="11" required="required"></td>
				</tr>
				<tr>
					<td>Nama</td>
					<td><input type="text" class="form-control" name="nama" required="required"></td>
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
		Dosen dosen = new Dosen();
		dosen.setNip(request.getParameter("nip"));
		dosen.setNama(request.getParameter("nama"));
		DosenModel dosenModel = new DosenModel();
		dosenModel.insertDosen(dosen);
	%>
	<script>
		alert('Data berhasil ditambahkan');
		document.location.href = 'dosen.jsp'
	</script>
	<%
	}
	%>
  	
    <%@ include file="footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>