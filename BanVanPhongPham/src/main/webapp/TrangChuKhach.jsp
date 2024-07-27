<%@ page import="java.util.List"%>
<%@ page import="dao.VanPhongPhamDAO"%>
<%@ page import="entities.VanPhongPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    VanPhongPhamDAO vanPhongPhamDAO = new VanPhongPhamDAO();
    List<VanPhongPham> vanPhongPhamList = vanPhongPhamDAO.getAllVanPhongPham();
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ Khách Hàng</title>
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
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            justify-content: center;
        }
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            width: calc(33.333% - 20px);
            box-sizing: border-box;
            text-align: center;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s;
        }
        .card:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }
        .card img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .card h2 {
            margin: 15px 0;
            font-size: 1.2em;
            color: #007bb5;
        }
        .card p {
            margin: 10px 0;
            font-size: 1em;
        }
        .card a {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #007bb5;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .card a:hover {
            background-color: #005f8b;
        }
    </style>
</head>
<body>
    <header>
        <h1>Trang Chủ Khách Hàng</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="GioHang.jsp">Giỏ Hàng</a></li>
                <li><a href="TaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section class="card-container">
        <%
            for (VanPhongPham vanPhongPham : vanPhongPhamList) {
        %>
        <div class="card">
            <%
                String maVanPhongPham = vanPhongPham.getMaVanPhongPham();
                if (maVanPhongPham != null && !maVanPhongPham.isEmpty()) {
                    String imagePath = request.getContextPath() + "/img/" + maVanPhongPham + ".jpg";
            %>
            <img src="<%= imagePath %>" alt="Hình Ảnh" />
            <%
                } else {
            %>
            Không có hình ảnh
            <%
                }
            %>
            <h2><%= vanPhongPham.getTenVanPhongPham() %></h2>
            <p>Giá: <%= vanPhongPham.getGia() %> VND</p>
            <p>Tình Trạng: <%= vanPhongPham.getTinhTrang() %></p>
            <a href="ChiTietVanPhongPhamServlet?maVanPhongPham=<%= vanPhongPham.getMaVanPhongPham() %>">Xem Chi Tiết</a>
        </div>
        <%
            }
        %>
    </section>
</body>
</html>
