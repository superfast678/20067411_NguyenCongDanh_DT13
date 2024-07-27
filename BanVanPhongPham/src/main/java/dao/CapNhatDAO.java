package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DatabaseConnection;
import entities.VanPhongPham;

public class CapNhatDAO {

  
    public void updateVanPhongPham(VanPhongPham vanPhongPham) throws SQLException {
        String sql = "UPDATE VanPhongPham SET tenVanPhongPham = ?, gia = ?, tinhTrang = ?, loaiVanPhongPham = ? WHERE maVanPhongPham = ?";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, vanPhongPham.getTenVanPhongPham());
            pstmt.setInt(2, vanPhongPham.getGia());
            pstmt.setString(3, vanPhongPham.getTinhTrang());
            pstmt.setString(4, vanPhongPham.getLoaiVanPhongPham());
            pstmt.setString(5, vanPhongPham.getMaVanPhongPham());
            pstmt.executeUpdate();
        }
    }

    
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
                vanPhongPhamList.add(vanPhongPham);
            }
        }
        return vanPhongPhamList;
    }
}
