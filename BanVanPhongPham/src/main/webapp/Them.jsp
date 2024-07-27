<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm Văn Phòng Phẩm</title>
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
    h2 {
        color: #007bb5;
        font-size: 24px;
        font-weight: 600;
        text-align: center;
        margin-top: 20px;
    }
    table {
        width: 80%;
        margin: 0 auto;
        border-collapse: collapse;
        background-color: #ffffff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    input[type="text"], input[type="number"], input[type="file"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 16px;
    }
    input[type="submit"] {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        color: #fff;
        background-color: #007bb5;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        margin-top: 20px;
        text-decoration: none;
        font-weight: bold;
    }
    input[type="submit"]:hover {
        background-color: #005f8b;
    }
    .centered {
        text-align: center;
        margin-top: 20px;
    }
    .centered a {
        color: #007bb5;
        text-decoration: none;
        font-weight: bold;
        display: inline-block;
        margin-left: 20px;
    }
    .centered a:hover {
        text-decoration: underline;
    }
    .error-message {
        color: #ff0000;
        font-size: 14px;
        margin-top: 10px;
    }
</style>
</head>
<body>
    <header>
        <h1>Trang Chủ Quản Trị</h1>
        <nav>
            <ul>
                <li><a href="Them.jsp">Thêm</a></li>
                <li><a href="Xoa.jsp">Xóa</a></li>
                <li><a href="CapNhat.jsp">Cập Nhật</a></li>
                <li><a href="QuanLyTaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <h2>Thêm Văn Phòng Phẩm Mới</h2>
    <form action="them" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td><label for="maVanPhongPham">Mã Văn Phòng Phẩm</label></td>
                <td><input type="text" id="maVanPhongPham" name="maVanPhongPham" required></td>
            </tr>
            <tr>
                <td><label for="tenVanPhongPham">Tên Văn Phòng Phẩm</label></td>
                <td><input type="text" id="tenVanPhongPham" name="tenVanPhongPham" required></td>
            </tr>
            <tr>
                <td><label for="gia">Giá</label></td>
                <td><input type="number" id="gia" name="gia" required></td>
            </tr>
            <tr>
                <td><label for="tinhTrang">Tình Trạng</label></td>
                <td><input type="text" id="tinhTrang" name="tinhTrang" required></td>
            </tr>
            <tr>
                <td><label for="loaiVanPhongPham">Loại Văn Phòng Phẩm</label></td>
                <td><input type="text" id="loaiVanPhongPham" name="loaiVanPhongPham" required></td>
            </tr>
            <tr>
                <td><label for="anh">Ảnh</label></td>
                <td><input type="file" id="anh" name="anh" accept="image/*" required></td>
            </tr>
        </table>
        <div class="centered">
            <input type="submit" value="Thêm Văn Phòng Phẩm">
            <a href="TrangChuAdmin.jsp">Quay lại Trang Chủ Admin</a>
        </div>
        <%
        if (request.getAttribute("errorMessage") != null) {
        %>
        <p class="error-message"><%=request.getAttribute("errorMessage")%></p>
        <%
        }
        %>
    </form>
</body>
</html>
