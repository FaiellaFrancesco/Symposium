package controller.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.ProdottoDAO;
import model.beans.Prodotto;

/**
 * Servlet implementation class campiProdotto
 */
@WebServlet("/campiProdotto")
public class campiProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher dispatcher;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campiProdotto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String returnPage = "/admin/modProdotto.jsp";
		ProdottoDAO model = new ProdottoDAO();
		Prodotto prodotto = null;
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			prodotto = model.doRetrieveByKey(id);
		} catch (SQLException e) {
			returnPage = "/errore.jsp";
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  request.setAttribute("prodotto", prodotto);
	  dispatcher = getServletContext().getRequestDispatcher(returnPage);
	  dispatcher.forward(request, response);
	  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
