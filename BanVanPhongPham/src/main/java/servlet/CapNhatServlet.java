package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CapNhatDAO;
import entities.VanPhongPham;

@WebServlet("/CapNhatServlet")
public class CapNhatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CapNhatDAO capNhatDAO;

    public void init() {
        capNhatDAO = new CapNhatDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<VanPhongPham> vanPhongPhamList = capNhatDAO.getAllVanPhongPham();
            request.setAttribute("vanPhongPhamList", vanPhongPhamList);
            request.getRequestDispatcher("CapNhat.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maVanPhongPham = request.getParameter("maVanPhongPham");
        String tenVanPhongPham = request.getParameter("tenVanPhongPham");
        int gia = Integer.parseInt(request.getParameter("gia"));
        String tinhTrang = request.getParameter("tinhTrang");
        String loaiVanPhongPham = request.getParameter("loaiVanPhongPham");

        VanPhongPham vanPhongPham = new VanPhongPham();
        vanPhongPham.setMaVanPhongPham(maVanPhongPham);
        vanPhongPham.setTenVanPhongPham(tenVanPhongPham);
        vanPhongPham.setGia(gia);
        vanPhongPham.setTinhTrang(tinhTrang);
        vanPhongPham.setLoaiVanPhongPham(loaiVanPhongPham);

        try {
            capNhatDAO.updateVanPhongPham(vanPhongPham);
            response.sendRedirect("CapNhat.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
