package controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.OrdineDAO;
import model.DAO.UtenteDAO;
import model.beans.Ordine;
import model.beans.Utente;

/**
 * Servlet implementation class ordiniAdmin
 */
@WebServlet("/admin/ordiniAdmin")
public class ordiniAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ordiniAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("id");
		OrdineDAO order = new OrdineDAO();
		Utente utente = new Utente();
		UtenteDAO user = new UtenteDAO();
		ArrayList<Ordine> ordini = new ArrayList<Ordine>();
		try {
			ordini = order.doRetrieveByUsr(Integer.parseInt(userId));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("ordini", ordini);
		request.setAttribute("id", Integer.parseInt(userId));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/orderUser.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
