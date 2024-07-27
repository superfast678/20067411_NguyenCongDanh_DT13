package servlet;

import dao.ThemDAO;
import entities.VanPhongPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/them")
@MultipartConfig
public class ThemServlet extends HttpServlet {
    private ThemDAO themDAO;

    @Override
    public void init() throws ServletException {
        themDAO = new ThemDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Them.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maVanPhongPham = request.getParameter("maVanPhongPham");
        String tenVanPhongPham = request.getParameter("tenVanPhongPham");
        String giaStr = request.getParameter("gia");
        String tinhTrang = request.getParameter("tinhTrang");
        String loaiVanPhongPham = request.getParameter("loaiVanPhongPham");

        if (maVanPhongPham == null || maVanPhongPham.isEmpty() ||
        	tenVanPhongPham == null || tenVanPhongPham.isEmpty() ||
            giaStr == null || giaStr.isEmpty() ||
            tinhTrang == null || tinhTrang.isEmpty() ||
            loaiVanPhongPham == null || loaiVanPhongPham.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("Them.jsp").forward(request, response);
            return;
        }

        int gia = Integer.parseInt(giaStr);

        Part filePart = request.getPart("anh");
        InputStream anhStream = filePart != null ? filePart.getInputStream() : null;

        VanPhongPham VanPhongPham = new VanPhongPham(maVanPhongPham, tenVanPhongPham, gia, tinhTrang, loaiVanPhongPham, anhStream);
        themDAO.addVanPhongPham(VanPhongPham);

        response.sendRedirect("TrangChuAdmin.jsp");
    }
}
