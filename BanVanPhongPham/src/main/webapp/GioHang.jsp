<%@ page import="entities.VanPhongPham" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
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
            padding: 10px 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid #e0e0e0;
        }
        h1 {
            color: #007bb5;
            margin: 0;
            font-size: 22px;
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
            margin: 0 10px;
        }
        nav ul li a {
            color: #007bb5;
            text-decoration: none;
            font-size: 14px;
        }
        nav ul li a:hover {
            text-decoration: underline;
        }
        .cart-container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .cart-container h2 {
            font-size: 20px;
            margin-bottom: 15px;
            text-align: center;
            color: #007bb5;
        }
        .cart-container table {
            width: 100%;
            border-collapse: collapse;
        }
        .cart-container table, .cart-container th, .cart-container td {
            border: 1px solid #ddd;
        }
        .cart-container th, .cart-container td {
            padding: 8px;
            text-align: left;
            font-size: 14px;
        }
        .cart-container th {
            background-color: #f4f4f4;
        }
        .total-price {
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
            text-align: right;
            color: #007bb5;
        }
        .button-group {
            margin-top: 15px;
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 8px 16px;
            font-size: 14px;
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
        <h1>Giỏ Hàng</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="GioHangServlet">Giỏ Hàng</a></li>
                <li><a href="TaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section>
        <div class="cart-container">
            <h2>Giỏ Hàng của bạn</h2>
            <table>
                <thead>
                    <tr>
                        <th>Mã Văn Phòng Phẩm</th>
                        <th>Tên Văn Phòng Phẩm</th>
                        <th>Giá</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<VanPhongPham> gioHang = (List<VanPhongPham>) session.getAttribute("gioHang");
                        int totalPrice = 0;
                        if (gioHang != null) {
                            for (VanPhongPham vanPhongPham : gioHang) {
                                totalPrice += vanPhongPham.getGia();
                                %>
                                <tr>
                                    <td><%= vanPhongPham.getMaVanPhongPham() %></td>
                                    <td><%= vanPhongPham.getTenVanPhongPham() %></td>
                                    <td><%= vanPhongPham.getGia() %> VND</td>
                                </tr>
                                <% 
                            }
                        }
                    %>
                </tbody>
            </table>
            <div class="total-price">
                Tổng tiền: <%= totalPrice %> VND
            </div>
            <div class="button-group">
                <form action="GioHangServlet" method="post">
                    <input type="hidden" name="action" value="checkout">
                    <button type="submit" class="button">Thanh Toán Ngay</button>
                </form>
                <a href="TrangChuKhach.jsp" class="button">Mua Tiếp</a>
            </div>
        </div>
    </section>
</body>
</html>
