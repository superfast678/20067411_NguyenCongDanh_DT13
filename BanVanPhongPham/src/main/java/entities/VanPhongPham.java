package entities;

import java.io.InputStream;

public class VanPhongPham {
	private String maVanPhongPham;
	private String tenVanPhongPham;
	private int gia;
	private String tinhTrang;
	private String loaiVanPhongPham;
	private InputStream anh;
	public VanPhongPham() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VanPhongPham(String maVanPhongPham, String tenVanPhongPham, int gia, String tinhTrang,
			String loaiVanPhongPham, InputStream anh) {
		super();
		this.maVanPhongPham = maVanPhongPham;
		this.tenVanPhongPham = tenVanPhongPham;
		this.gia = gia;
		this.tinhTrang = tinhTrang;
		this.loaiVanPhongPham = loaiVanPhongPham;
		this.anh = anh;
	}
	public String getMaVanPhongPham() {
		return maVanPhongPham;
	}
	public void setMaVanPhongPham(String maVanPhongPham) {
		this.maVanPhongPham = maVanPhongPham;
	}
	public String getTenVanPhongPham() {
		return tenVanPhongPham;
	}
	public void setTenVanPhongPham(String tenVanPhongPham) {
		this.tenVanPhongPham = tenVanPhongPham;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getLoaiVanPhongPham() {
		return loaiVanPhongPham;
	}
	public void setLoaiVanPhongPham(String loaiVanPhongPham) {
		this.loaiVanPhongPham = loaiVanPhongPham;
	}
	public InputStream getAnh() {
		return anh;
	}
	public void setAnh(InputStream anh) {
		this.anh = anh;
	}
	
}
