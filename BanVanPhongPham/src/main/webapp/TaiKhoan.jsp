<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entities.Customer"%>
<%
    Customer customer = (Customer) request.getAttribute("customer");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Tài Khoản</title>
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
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            margin-top: 20px;
        }
        .button:hover {
            background-color: #005f8b;
        }
    </style>
</head>
<body>
    <header>
        <h1>Thông Tin Tài Khoản</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section>
        <h2>Thông Tin Cá Nhân</h2>
        <table>
            <tr>
                <th>Id</th>
                <th>Họ Tên</th>
                <th>Số Điện Thoại</th>
                <th>Địa Chỉ</th>
            </tr>
            <tr>
                <td><%= customer != null ? customer.getCustomerId() : "N/A" %></td>
                <td><%= customer != null ? customer.getFullName() : "N/A" %></td>
                <td><%= customer != null ? customer.getPhoneNumber() : "N/A" %></td>
                <td><%= customer != null ? customer.getAddress() : "N/A" %></td>
            </tr>
        </table>
    </section>
    <div style="text-align: center; margin-top: 20px;">
        <a href="TrangChuKhach.jsp" class="button">Quay lại Trang Chủ</a>
    </div>
</body>
</html>
