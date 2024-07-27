package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.VanPhongPham;
import jdbc.DatabaseConnection;


public class VanPhongPhamDAO {

    public List<VanPhongPham> getAllVanPhongPham() throws SQLException {
        List<VanPhongPham> vanPhongPhamList = new ArrayList<>();
        String query = "SELECT * FROM VanPhongPham";
        try (Connection connection = DatabaseConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	VanPhongPham vanPhongPham = new VanPhongPham();
            	vanPhongPham.setMaVanPhongPham(resultSet.getString("maVanPhongPham"));
            	vanPhongPham.setTenVanPhongPham(resultSet.getString("tenVanPhongPham"));
            	vanPhongPham.setGia(resultSet.getInt("Gia"));
            	vanPhongPham.setTinhTrang(resultSet.getString("TinhTrang"));
            	vanPhongPham.setLoaiVanPhongPham(resultSet.getString("loaiVanPhongPham"));
            	vanPhongPham.setAnh(resultSet.getBinaryStream("Anh"));
                vanPhongPhamList.add(vanPhongPham);
            }
        }
        return vanPhongPhamList;
    }

    public VanPhongPham getVanPhongPhamByMa(String maVanPhongPham) throws SQLException {
    	VanPhongPham vanPhongPham = null;
        String query = "SELECT * FROM VanPhongPham WHERE MaVanPhongPham = ?";
        try (Connection connection = DatabaseConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, maVanPhongPham);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
            	vanPhongPham = new VanPhongPham();
            	vanPhongPham.setMaVanPhongPham(resultSet.getString("maVanPhongPham"));
            	vanPhongPham.setTenVanPhongPham(resultSet.getString("tenVanPhongPham"));
            	vanPhongPham.setGia(resultSet.getInt("Gia"));
            	vanPhongPham.setTinhTrang(resultSet.getString("TinhTrang"));
            	vanPhongPham.setLoaiVanPhongPham(resultSet.getString("loaiVanPhongPham"));
            	vanPhongPham.setAnh(resultSet.getBinaryStream("Anh"));
            }
        }
        return vanPhongPham;
    }
}
