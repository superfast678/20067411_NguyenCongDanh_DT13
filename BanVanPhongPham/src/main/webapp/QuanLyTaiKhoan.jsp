<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.CustomerDAO"%>
<%@ page import="entities.Customer"%>
<%
    CustomerDAO customerDAO = new CustomerDAO();
    List<Customer> customerList = customerDAO.getAllCustomers();
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Tài Khoản</title>
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
        .edit-form {
            display: none;
        }
        .edit-form input {
            margin: 5px 0;
            padding: 5px;
            width: 100%;
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
        <h2>Quản Lý Tài Khoản</h2>
        <table>
            <tr>
                <th>Id</th>
                <th>Họ Tên</th>
                <th>Số Điện Thoại</th>
                <th>Mật Khẩu</th>
                <th>Địa Chỉ</th>
                <th>Xóa</th>
                <th>Sửa</th>
            </tr>
            <%
                for (Customer customer : customerList) {
            %>
            <tr>
                <td><%= customer.getCustomerId() %></td>
                <td><%= customer.getFullName() %></td>
                <td><%= customer.getPhoneNumber() %></td>
                <td><%= customer.getPassword() %></td>
                <td><%= customer.getAddress() %></td>
                <td>
                    <form action="XoaCustomerServlet" method="post">
                        <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>" />
                        <input type="submit" value="Xóa" />
                    </form>
                </td>
                <td>
                    <button onclick="editRow(<%= customer.getCustomerId() %>)">Sửa</button>
                </td>
            </tr>
            <tr id="edit-form-<%= customer.getCustomerId() %>" class="edit-form">
                <td colspan="7">
                    <form action="SuaCustomerServlet" method="post">
                        <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>" />
                        <label for="fullName">Họ Tên:</label>
                        <input type="text" name="fullName" value="<%= customer.getFullName() %>" />
                        <br/>
                        <label for="phoneNumber">Số Điện Thoại:</label>
                        <input type="text" name="phoneNumber" value="<%= customer.getPhoneNumber() %>" />
                        <br/>
                        <label for="password">Mật Khẩu:</label>
                        <input type="password" name="password" value="<%= customer.getPassword() %>" />
                        <br/>
                        <label for="address">Địa Chỉ:</label>
                        <input type="text" name="address" value="<%= customer.getAddress() %>" />
                        <br/>
                        <input type="submit" value="Cập Nhật" />
                        <button type="button" onclick="cancelEdit(<%= customer.getCustomerId() %>)">Hủy</button>
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
    <script>
        function editRow(customerId) {
            document.getElementById('edit-form-' + customerId).style.display = 'table-row';
        }

        function cancelEdit(customerId) {
            document.getElementById('edit-form-' + customerId).style.display = 'none';
        }
    </script>
</body>
</html>
