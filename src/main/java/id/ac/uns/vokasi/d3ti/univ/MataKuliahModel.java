package id.ac.uns.vokasi.d3ti.univ;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MataKuliahModel {
	static Connection con;
	static Statement st;
	static ResultSet rs;
	static ArrayList<MataKuliah> dataMataKuliah;
	
	public MataKuliahModel() {
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
		
		dataMataKuliah = new ArrayList<MataKuliah>();
	}
	
	public static ArrayList<MataKuliah> getData() {
		String query= "SELECT * FROM matakuliah";
		try {
			st=con.createStatement();
			rs=st.executeQuery(query);
			while(rs.next()) {
				MataKuliah matakuliah = new MataKuliah();
				matakuliah.setMataKuliah_Kode(rs.getString(1));
				matakuliah.setMataKuliah_Nama(rs.getString(2));
				matakuliah.setMataKuliah_Semester(rs.getString(3));
				matakuliah.setNip(rs.getString(4));
				dataMataKuliah.add(matakuliah);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataMataKuliah;
	}
	
	public static ArrayList<MataKuliah> getDataByMataKuliah_Kode(String matakuliah_kode){
		String query="SELECT * FROM matakuliah WHERE matakuliah_kode='"+matakuliah_kode+"'";
		try {
			st=con.createStatement();
			rs=st.executeQuery(query);
			while(rs.next()) {
				MataKuliah matakuliah = new MataKuliah();
				matakuliah.setMataKuliah_Kode(rs.getString(1));
				matakuliah.setMataKuliah_Nama(rs.getString(2));
				matakuliah.setMataKuliah_Semester(rs.getString(3));
				matakuliah.setNip(rs.getString(4));
				dataMataKuliah.add(matakuliah);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataMataKuliah;
	}
	
	public static void insertMataKuliah(MataKuliah matakuliah) {
		String query = "INSERT INTO matakuliah(matakuliah_kode,matakuliah_nama,matakuliah_semester,nip) VALUES("
				+ "'"+matakuliah.getMataKuliah_Kode()+"','"+matakuliah.getMataKuliah_Nama()+"','"+matakuliah.getMataKuliah_Semester()+"',"
						+ "'"+matakuliah.getNip()+"')";
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void updateMataKuliah(MataKuliah matakuliah) {
		String query = "UPDATE matakuliah SET matakuliah_nama = '"+matakuliah.getMataKuliah_Nama()+"', matakuliah_semester = '"
				+matakuliah.getMataKuliah_Semester()+"'"+ ", nip = '"+matakuliah.getNip()+"' WHERE matakuliah_kode = '"
				+matakuliah.getMataKuliah_Kode()+"'";
		
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void deleteMataKuliah(String matakuliah_kode) {
		String query = "DELETE FROM matakuliah WHERE matakuliah_kode = '"+matakuliah_kode+"'";
		
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
