package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.XoaDAO;
import entities.VanPhongPham;

@WebServlet("/XoaServlet")
public class XoaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private XoaDAO xoaDAO;

	@Override
	public void init() {
		xoaDAO = new XoaDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<VanPhongPham> vanPhongPhamList = xoaDAO.getAllVanPhongPham();
			request.setAttribute("vanPhongPhamList", vanPhongPhamList);
			request.getRequestDispatcher("Xoa.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String maVanPhongPham = request.getParameter("maVanPhongPham");
		try {
			if (maVanPhongPham != null && !maVanPhongPham.isEmpty()) {
				xoaDAO.deleteVanPhongPham(maVanPhongPham);
			}
			response.sendRedirect("XoaServlet");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
