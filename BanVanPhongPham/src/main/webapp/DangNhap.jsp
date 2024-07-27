<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Nhập</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #d9f9f0, #b0e1e6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 360px;
            width: 100%;
            text-align: center;
            border: 1px solid #e0e0e0;
        }
        h2 {
            color: #007bb5;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
        }
        label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: calc(100% - 20px);
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007bb5;
            outline: none;
            box-shadow: 0 0 4px rgba(0, 123, 181, 0.5);
        }
        input[type="submit"] {
            background-color: #007bb5;
            color: #ffffff;
            border: none;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background-color: #005f8b;
        }
        .register-link {
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }
        .register-link a {
            color: #007bb5;
            text-decoration: none;
            font-weight: bold;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Đăng Nhập</h2>
        <form action="DangNhapServlet" method="post">
            <label for="phoneNumber">SĐT</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required>
            
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Đăng Nhập">
        </form>
        <div class="register-link">
            <p>Chưa có tài khoản? <a href="DangKy.jsp">Đăng ký</a></p>
        </div>
    </div>
</body>
</html>
