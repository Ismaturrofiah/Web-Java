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
		<h1 class="text-center">Ubah Data Dosen</h1>
		<br>
		<%
		String no = request.getParameter("no");

		DosenModel dosenModel = new DosenModel();
		ArrayList<Dosen> dosen = new ArrayList<Dosen>();
		dosen = dosenModel.getDataByNo(no);
		for (int i = 0; i < dosen.size(); i++) {
		%>

		<form action="" method="post">
		<input type="hidden" name="no" value="<%out.print(no);%>" maxlength="9" minlength="9" required="required">
			<table class="table table-borderless">
				<tr>
					<td>NIP</td>
					<td><input type="text" class="form-control" name="nip" value="<%out.print(dosen.get(i).getNip());%>" required="required"></td>
				</tr>
				<tr>
					<td>Nama</td>
					<td><input type="text" class="form-control" name="nama" value="<%out.print(dosen.get(i).getNama());%>" required="required"></td>
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
		Dosen Dosen = new Dosen();
		Dosen.setNo(request.getParameter("no"));
		Dosen.setNip(request.getParameter("nip"));
		Dosen.setNama(request.getParameter("nama"));
		DosenModel.updateDosen(Dosen);
	%>
	<script>
		alert('Data berhasil diubah');
		document.location.href = 'dosen.jsp'
	</script>
	<%
	}
	%>
	
	<%@ include file="footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>