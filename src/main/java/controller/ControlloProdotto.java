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

/**
 * Servlet implementation class ControlloProdotto
 */
@WebServlet("/ControlloProdotto")
public class ControlloProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlloProdotto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ProdottoDAO model = new ProdottoDAO();

		Carrello cart = (Carrello)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addToC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.addProdotto(model.doRetrieveByKey(id));
				}
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
			
		cart.getProdotti().stream().forEach((e)->System.out.print(e.getProdotto().getNome()+" "+e.getQuant()+" "));
		System.out.print("\n");
		
		request.getSession().setAttribute("cart", cart);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
