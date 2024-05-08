package controller;
import model.DAO.ProdottoDAO;
import model.beans.*;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ControlloProdotto
 */
@WebServlet("/ControlloProdotto")
public class ControlloProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher dispatcher;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlloProdotto() {
		super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws ServletException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		ProdottoDAO model = new ProdottoDAO();
		
		HttpSession sessione = request.getSession();

		Carrello cart = (Carrello)sessione.getAttribute("cart");
		if(cart == null) {
			cart = new Carrello();
			sessione.setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addToC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.addProdotto((Prodotto)model.doRetrieveByKey(id));
				}
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
			
		
		sessione.setAttribute("cart", cart);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
