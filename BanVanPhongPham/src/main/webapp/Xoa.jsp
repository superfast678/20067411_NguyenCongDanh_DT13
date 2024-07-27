<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.XoaDAO"%>
<%@ page import="entities.VanPhongPham"%>
<%
    XoaDAO xoaDAO = new XoaDAO();
    List<VanPhongPham> vanPhongPhamList = xoaDAO.getAllVanPhongPham();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa Văn Phòng Phẩm</title>
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
        section {
            margin: 20px auto;
            width: 80%;
        }
        h2 {
            color: #007bb5;
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            margin-top: 20px;
        }
        table {
            width: 100%;
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
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bb5;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
        .button:hover {
            background-color: #005f8b;
        }
        img {
            max-width: 100px;
            height: auto;
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
    <section>
        <h2>Xóa Văn Phòng Phẩm</h2>
        <table>
            <tr>
                <th>Mã Văn Phòng Phẩm</th>
                <th>Tên Văn Phòng Phẩm</th>
                <th>Giá</th>
                <th>Tình Trạng</th>
                <th>Loại Văn Phòng Phẩm</th>
                <th>Ảnh</th>
                <th>Hành Động</th>
            </tr>
            <%
                for (VanPhongPham vanPhongPham : vanPhongPhamList) {
            %>
            <tr>
                <td><%= vanPhongPham.getMaVanPhongPham() %></td>
                <td><%= vanPhongPham.getTenVanPhongPham() %></td>
                <td><%= vanPhongPham.getGia() %></td>
                <td><%= vanPhongPham.getTinhTrang() %></td>
                <td><%= vanPhongPham.getLoaiVanPhongPham() %></td>
                <td>
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
                </td>
                <td>
                    <form action="XoaServlet" method="post">
                        <input type="hidden" name="maVanPhongPham" value="<%= vanPhongPham.getMaVanPhongPham() %>" />
                        <input type="submit" value="Xóa" />
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </section>
    <div style="text-align: center; margin-top: 20px;">
        <a href="TrangChuAdmin.jsp" class="button">Quay lại Trang Chủ Admin</a>
    </div>
</body>
</html>
