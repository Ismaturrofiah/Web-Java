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
		<h1 class="text-center">Ubah Data Mata Kuliah</h1>
		<br>
		<%
		String matakuliah_kode = request.getParameter("matakuliah_kode");

		MataKuliahModel matakuliahModel = new MataKuliahModel();
		ArrayList<MataKuliah> matakuliah = new ArrayList<MataKuliah>();
		matakuliah = matakuliahModel.getDataByMataKuliah_Kode(matakuliah_kode);
		for (int i = 0; i < matakuliah.size(); i++) {
		%>

		<form action="" method="post">
			<input type="hidden" name="matakuliah_kode" value="<%out.print(matakuliah_kode);%>" maxlength="9" minlength="9" required="required">
			<table class="table table-borderless">
				<tr>
					<td>Nama</td>
					<td><input type="text" class="form-control" name="matakuliah_nama" value="<%out.print(matakuliah.get(i).getMataKuliah_Nama());%>" required="required"></td>
				</tr>
				<tr>
					<td>Semester</td>
					<td><input type="text" class="form-control" name="matakuliah_semester" value="<%out.print(matakuliah.get(i).getMataKuliah_Semester());%>" required="required"></td>
				</tr>
				<tr>
					<td>NIP</td>
					<td><input type="text" class="form-control" name="nip" value="<%out.print(matakuliah.get(i).getNip());%>" required="required"></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-primary" name="submit" value="Ubah"></td>
				</tr>
			</table>
		</form>
	</div>

	<%
	}
	String submit = request.getParameter("submit");
	if (submit != null) {
		MataKuliah MataKuliah = new MataKuliah();
		MataKuliah.setMataKuliah_Kode(request.getParameter("matakuliah_kode"));
		MataKuliah.setMataKuliah_Nama(request.getParameter("matakuliah_nama"));
		MataKuliah.setMataKuliah_Semester(request.getParameter("matakuliah_semester"));
		MataKuliah.setNip(request.getParameter("nip"));
		MataKuliahModel.updateMataKuliah(MataKuliah);
	%>
	<script>
		alert('Data berhasil diubah');
		document.location.href = 'matakuliah.jsp'
	</script>
	<%
	}
	%>
	
	<%@ include file="footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>