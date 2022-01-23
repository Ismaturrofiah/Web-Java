package id.ac.uns.vokasi.d3ti.univ;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MahasiswaModel {
	static Connection con;
	static Statement st;
	static ResultSet rs;
	static ArrayList<Mahasiswa> dataMahasiswa;
	
	public MahasiswaModel() {
		String server="jdbc:mysql://localhost/website_univ?user=root&password=";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(server);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dataMahasiswa = new ArrayList<Mahasiswa>();
	}
	
	public static ArrayList<Mahasiswa> getData() {
		String query= "SELECT * FROM mahasiswa";
		try {
			st=con.createStatement();
			rs=st.executeQuery(query);
			while(rs.next()) {
				Mahasiswa mahasiswa = new Mahasiswa();
				mahasiswa.setNim(rs.getString(1));
				mahasiswa.setNama(rs.getString(2));
				mahasiswa.setJk(rs.getString(3));
				mahasiswa.setTmpLahir(rs.getString(4));
				mahasiswa.setTglLahir(rs.getString(5));
				mahasiswa.setAlamat(rs.getString(6));
				dataMahasiswa.add(mahasiswa);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataMahasiswa;
	}
	
	public static ArrayList<Mahasiswa> getDataByNim(String nim){
		String query="SELECT * FROM mahasiswa WHERE nim='"+nim+"'";
		try {
			st=con.createStatement();
			rs=st.executeQuery(query);
			while(rs.next()) {
				Mahasiswa mahasiswa = new Mahasiswa();
				mahasiswa.setNim(rs.getString(1));
				mahasiswa.setNama(rs.getString(2));
				mahasiswa.setJk(rs.getString(3));
				mahasiswa.setTmpLahir(rs.getString(4));
				mahasiswa.setTglLahir(rs.getString(5));
				mahasiswa.setAlamat(rs.getString(6));
				dataMahasiswa.add(mahasiswa);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataMahasiswa;
	}
	
	public static void insertMahasiswa(Mahasiswa mahasiswa) {
		String query = "INSERT INTO mahasiswa(nim,nama,jk,tempat_lahir,tanggal_lahir,alamat) VALUES("
				+ "'"+mahasiswa.getNim()+"','"+mahasiswa.getNama()+"','"+mahasiswa.getJk()+"',"
						+ "'"+mahasiswa.getTmpLahir()+"','"+mahasiswa.getTglLahir()+"',"
								+ "'"+mahasiswa.getAlamat()+"')";
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void insertSeveralMahasiswa(ArrayList<Mahasiswa> mahasiswa) {
		String query = "INSERT INTO mahasiswa(nim,nama,jk,tempat_lahir,tanggal_lahir,alamat) VALUES(?,?,?,?,?,?)";
		try {
			st=con.createStatement();
			PreparedStatement prepare = con.prepareStatement(query);
			int countMahasiswa = mahasiswa.size();
			for(int i=0; i<countMahasiswa;i++) {
				prepare.setString(1, mahasiswa.get(i).getNim());
				prepare.setString(2, mahasiswa.get(i).getNama());
				prepare.setString(3, mahasiswa.get(i).getJk());
				prepare.setString(4, mahasiswa.get(i).getTmpLahir());
				prepare.setString(5, mahasiswa.get(i).getTglLahir());
				prepare.setString(6, mahasiswa.get(i).getAlamat());
				prepare.addBatch();
			}
			prepare.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void updateMahasiswa(Mahasiswa mahasiswa) {
		String query = "UPDATE mahasiswa SET nama = '"+mahasiswa.getNama()+"', jk = '"+mahasiswa.getJk()+"'"
				+ ", tempat_lahir = '"+mahasiswa.getTmpLahir()+"', tanggal_lahir = '"+mahasiswa.getTglLahir()+"'"
						+ ", alamat = '"+mahasiswa.getAlamat()+"' WHERE nim = '"+mahasiswa.getNim()+"'";
		
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void deleteMahasiswa(String nim) {
		String query = "DELETE FROM mahasiswa WHERE nim = '"+nim+"'";
		
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
