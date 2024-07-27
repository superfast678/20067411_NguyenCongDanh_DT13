package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.VanPhongPham;
import dao.VanPhongPhamDAO;
import java.sql.SQLException;

@WebServlet("/ChiTietVanPhongPhamServlet")
public class ChiTietVanPhongPhamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VanPhongPhamDAO vanPhongPhamDAO;

    @Override
    public void init() {
    	vanPhongPhamDAO = new VanPhongPhamDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maVanPhongPham = request.getParameter("maVanPhongPham");
        VanPhongPham vanPhongPham = null;
        try {
        	vanPhongPham = vanPhongPhamDAO.getVanPhongPhamByMa(maVanPhongPham);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("vanPhongPham", vanPhongPham);
        request.getRequestDispatcher("ChiTietVanPhongPham.jsp").forward(request, response);
    }
}
