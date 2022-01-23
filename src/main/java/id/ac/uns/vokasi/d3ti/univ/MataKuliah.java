package id.ac.uns.vokasi.d3ti.univ;

public class MataKuliah {

		private String matakuliah_kode;
		private String matakuliah_nama;
		private String matakuliah_semester;
		private String nip;
		
		public void setMataKuliah_Kode(String matakuliah_kode) {
			this.matakuliah_kode=matakuliah_kode;
		}
		
		public String getMataKuliah_Kode() {
			return matakuliah_kode;
		}
		
		public void setMataKuliah_Nama(String matakuliah_nama) {
			this.matakuliah_nama=matakuliah_nama;
		}
		
		public String getMataKuliah_Nama() {
			return matakuliah_nama;
		}
		
		public void setMataKuliah_Semester(String matakuliah_semester) {
			this.matakuliah_semester=matakuliah_semester;
		}
		
		public String getMataKuliah_Semester() {
			return matakuliah_semester;
		}
		
		public void setNip(String nip) {
			this.nip=nip;
		}
		
		public String getNip() {
			return nip;
		}
}
