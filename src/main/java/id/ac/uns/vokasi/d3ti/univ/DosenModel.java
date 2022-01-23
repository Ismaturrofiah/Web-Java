package id.ac.uns.vokasi.d3ti.univ;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DosenModel {
	static Connection con;
	static Statement st;
	static ResultSet rs;
	static ArrayList<Dosen> dataDosen;
	
	public DosenModel() {
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
		
		dataDosen = new ArrayList<Dosen>();
	}
	
	public static ArrayList<Dosen> getData() {
		String query= "SELECT * FROM dosen";
		try {
			st=con.createStatement();
			rs=st.executeQuery(query);
			while(rs.next()) {
				Dosen dosen = new Dosen();
				dosen.setNo(rs.getString(1));
				dosen.setNip(rs.getString(2));
				dosen.setNama(rs.getString(3));
				dataDosen.add(dosen);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataDosen;
	}
	
	public static ArrayList<Dosen> getDataByNo(String no){
		String query="SELECT * FROM dosen WHERE no='"+no+"'";
		try {
			st=con.createStatement();
			rs=st.executeQuery(query);
			while(rs.next()) {
				Dosen dosen = new Dosen();
				dosen.setNo(rs.getString(1));
				dosen.setNip(rs.getString(2));
				dosen.setNama(rs.getString(3));
				dataDosen.add(dosen);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataDosen;
	}
	
	public static void insertDosen(Dosen dosen) {
		String query = "INSERT INTO dosen(nip,nama) VALUES("+ "'"+dosen.getNip()+"','"+dosen.getNama()+"')";
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void updateDosen(Dosen dosen) {
		String query = "UPDATE dosen SET nip = '"+dosen.getNip()+"', nama = '"+dosen.getNama()+"' WHERE no = '"
				+dosen.getNo()+"'";
		
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void deleteDosen(String no) {
		String query = "DELETE FROM dosen WHERE no = '"+no+"'";
		
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
