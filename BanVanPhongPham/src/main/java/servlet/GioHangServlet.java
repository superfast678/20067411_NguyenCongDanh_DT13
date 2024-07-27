package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.VanPhongPhamDAO;
import entities.VanPhongPham;

@WebServlet("/GioHangServlet")
public class GioHangServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VanPhongPhamDAO vanPhongPhamDAO;

    @Override
    public void init() {
    	vanPhongPhamDAO = new VanPhongPhamDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<VanPhongPham> gioHang = (List<VanPhongPham>) session.getAttribute("gioHang");

        if (gioHang == null) {
            gioHang = new ArrayList<>();
            session.setAttribute("gioHang", gioHang);
        }

        List<VanPhongPham> vanPhongPhamList = new ArrayList<>();
        int totalPrice = 0;

        try {
            for (VanPhongPham vanPhongPham : gioHang) {
            	VanPhongPham vanPhongPhamDetail = vanPhongPhamDAO.getVanPhongPhamByMa(vanPhongPham.getMaVanPhongPham());
                if (vanPhongPhamDetail != null) {
                	vanPhongPhamList.add(vanPhongPhamDetail);
                    totalPrice += vanPhongPhamDetail.getGia();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("vanPhongPhamList", vanPhongPhamList);
        request.setAttribute("totalPrice", totalPrice);
        request.getRequestDispatcher("GioHang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<VanPhongPham> gioHang = (List<VanPhongPham>) session.getAttribute("gioHang");

        if (gioHang == null) {
            gioHang = new ArrayList<>();
            session.setAttribute("gioHang", gioHang);
        }

        if ("checkout".equals(action)) {
            try {    
                Date now = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                String orderDate = dateFormat.format(now);
                session.setAttribute("orderDate", orderDate);
                response.sendRedirect("ThanhToanThanhCong.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            String maVanPhongPham = request.getParameter("maVanPhongPham");
            try {
            	VanPhongPham vanPhongPham = vanPhongPhamDAO.getVanPhongPhamByMa(maVanPhongPham);
                if (vanPhongPham != null) {
                    gioHang.add(vanPhongPham);
                    session.setAttribute("gioHang", gioHang);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
            response.sendRedirect("ChiTietVanPhongPham.jsp?maVanPhongPham=" + maVanPhongPham);
        }
    }

}