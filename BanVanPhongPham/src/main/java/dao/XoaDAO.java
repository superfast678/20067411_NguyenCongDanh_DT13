package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.VanPhongPham;
import jdbc.DatabaseConnection;


public class XoaDAO {

   
    public List<VanPhongPham> getAllVanPhongPham() throws SQLException {
        List<VanPhongPham> vanPhongPhamList = new ArrayList<>();
        String sql = "SELECT * FROM VanPhongPham";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
            	VanPhongPham vanPhongPham = new VanPhongPham();
            	vanPhongPham.setMaVanPhongPham(rs.getString("maVanPhongPham"));
            	vanPhongPham.setTenVanPhongPham(rs.getString("tenVanPhongPham"));
            	vanPhongPham.setGia(rs.getInt("gia"));
            	vanPhongPham.setTinhTrang(rs.getString("tinhTrang"));
            	vanPhongPham.setLoaiVanPhongPham(rs.getString("loaiVanPhongPham"));
            	vanPhongPham.setAnh(rs.getBinaryStream("anh"));
            	vanPhongPhamList.add(vanPhongPham);
            }
        }
        return vanPhongPhamList;
    }

    
    public void deleteVanPhongPham(String maVanPhongPham) throws SQLException {
        String sql = "DELETE FROM VanPhongPham WHERE maVanPhongPham = ?";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, maVanPhongPham);
            pstmt.executeUpdate();
        }
    }
}
