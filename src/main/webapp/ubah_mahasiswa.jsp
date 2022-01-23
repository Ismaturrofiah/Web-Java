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
		<h1 class="text-center">Ubah Data Mahasiswa</h1>
		<br>
		<%
		String nim = request.getParameter("nim");

		MahasiswaModel mahasiswaModel = new MahasiswaModel();
		ArrayList<Mahasiswa> mahasiswa = new ArrayList<Mahasiswa>();
		mahasiswa = mahasiswaModel.getDataByNim(nim);
		for (int i = 0; i < mahasiswa.size(); i++) {
		%>

		<form action="" method="post">
			<input type="hidden" name="nim" value="<%out.print(nim);%>" onkeypress="return hanyaAngka(event)" maxlength="15" minlength="11" required="required">
			<table class="table table-borderless">
				<tr>
					<td>Nama</td>
					<td><input type="text" class="form-control" name="nama" value="<%out.print(mahasiswa.get(i).getNama());%>" required="required"></td>
				</tr>
				<tr>
					<td>Jenis Kelamin</td>
					<td><input type="text" class="form-control" name="jk" value="<%out.print(mahasiswa.get(i).getJk());%>" required="required"></td>
				</tr>
				<tr>
					<td>Tempat Lahir</td>
					<td><input type="text" class="form-control" name="tempat_lahir" value="<%out.print(mahasiswa.get(i).getTmpLahir());%>" required="required"></td>
				</tr>
				<tr>
					<td>Tanggal Lahir</td>
					<td><input type="text" class="form-control" name="tanggal_lahir" value="<%out.print(mahasiswa.get(i).getTglLahir());%>" required="required"></td>
				</tr>
				<tr>
					<td>Alamat</td>
					<td><input type="text" class="form-control" name="alamat" value="<%out.print(mahasiswa.get(i).getAlamat());%>" required="required"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-outline-success" name="submit" value="Ubah"></td>
				</tr>
			</table>
		</form>
	</div>

	<%
	}
	String submit = request.getParameter("submit");
	if (submit != null) {
		Mahasiswa Mahasiswa = new Mahasiswa();
		Mahasiswa.setNim(request.getParameter("nim"));
		Mahasiswa.setNama(request.getParameter("nama"));
		Mahasiswa.setJk(request.getParameter("jk"));
		Mahasiswa.setTmpLahir(request.getParameter("tempat_lahir"));
		Mahasiswa.setTglLahir(request.getParameter("tanggal_lahir"));
		Mahasiswa.setAlamat(request.getParameter("alamat"));
		MahasiswaModel.updateMahasiswa(Mahasiswa);
	%>
	<script>
		alert('Data berhasil diubah');
		document.location.href = 'mahasiswa.jsp'
	</script>
	<%
	}
	%>
	
	<%@ include file="footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>