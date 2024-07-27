package dao;

import entities.VanPhongPham;
import jdbc.DatabaseConnection;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ThemDAO {
    private Connection connection;

    public ThemDAO() {
        this.connection = DatabaseConnection.initializeDatabase();
    }

    public void addVanPhongPham(VanPhongPham vanPhongPham) {
        String sql = "INSERT INTO VanPhongPham (maVanPhongPham, tenVanPhongPham, gia, tinhTrang, loaiVanPhongPham, anh) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, vanPhongPham.getMaVanPhongPham());
            statement.setString(2, vanPhongPham.getTenVanPhongPham());
            statement.setInt(3, vanPhongPham.getGia());
            statement.setString(4, vanPhongPham.getTinhTrang());
            statement.setString(5, vanPhongPham.getLoaiVanPhongPham());
            statement.setBlob(6, vanPhongPham.getAnh());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
