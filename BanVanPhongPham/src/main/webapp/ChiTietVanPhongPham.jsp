<%@ page import="java.util.List"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="dao.VanPhongPhamDAO"%>
<%@ page import="entities.VanPhongPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String maVanPhongPham = request.getParameter("maVanPhongPham");
    VanPhongPhamDAO vanPhongPhamDAO = new VanPhongPhamDAO();
    VanPhongPham vanPhongPham = null;
    try {
        vanPhongPham = vanPhongPhamDAO.getVanPhongPhamByMa(maVanPhongPham);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Văn Phòng Phẩm</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #d9f9f0, #b0e1e6);
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid #e0e0e0;
        }
        h1 {
            color: #007bb5;
            margin: 0;
            font-size: 28px;
            text-align: center;
        }
        nav {
            text-align: center;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin: 0 15px;
        }
        nav ul li a {
            color: #007bb5;
            text-decoration: none;
            font-size: 16px;
        }
        nav ul li a:hover {
            text-decoration: underline;
        }
        .detail-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .detail-container img {
            max-width: 30%; /* Điều chỉnh kích thước hình ảnh nhỏ hơn */
            height: auto;
            border-radius: 8px;
            display: block;
            margin: 0 auto;
        }
        .detail-container h2 {
            font-size: 24px;
            margin: 10px 0;
            text-align: center;
            color: #007bb5;
        }
        .detail-container p {
            font-size: 18px;
            margin: 10px 0;
        }
        .button-group {
            margin-top: 20px;
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bb5;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #005f8b;
        }
    </style>
</head>
<body>
    <header>
        <h1>Chi Tiết Văn Phòng Phẩm</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="GioHangServlet">Giỏ Hàng</a></li>
                <li><a href="TaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section class="detail-container">
        <h2><%= vanPhongPham.getTenVanPhongPham() %></h2>
        <img src="img/<%= vanPhongPham.getMaVanPhongPham() %>.jpg" alt="<%= vanPhongPham.getTenVanPhongPham() %>">
        <p><strong>Giá:</strong> <%= vanPhongPham.getGia() %> VND</p>
        <p><strong>Tình Trạng:</strong> <%= vanPhongPham.getTinhTrang() %></p>
        <p><strong>Loại Văn Phòng Phẩm:</strong> <%= vanPhongPham.getLoaiVanPhongPham() %></p>
        <div class="button-group">
            <form action="GioHangServlet" method="post">
                <input type="hidden" name="maVanPhongPham" value="<%= vanPhongPham.getMaVanPhongPham() %>">
                <button type="submit" class="button">Mua Hàng</button>
            </form>
            <a href="TrangChuKhach.jsp" class="button">Quay Lại</a>
        </div>
    </section>
</body>
</html>
