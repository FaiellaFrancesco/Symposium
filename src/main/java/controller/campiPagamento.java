package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.ProdottoDAO;
import model.DAO.UtenteDAO;
import model.beans.Prodotto;
import model.beans.Utente;

/**
 * Servlet implementation class campiProdotto
 */
@WebServlet("/campiPagamento")
public class campiPagamento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher dispatcher;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campiPagamento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String returnPage = "/pagamento.jsp";
		UtenteDAO utenteModel = new UtenteDAO();
		Utente utente = null;
		HttpSession sessione = request.getSession();
			try {
				utente = utenteModel.doRetrieveByKey((int)sessione.getAttribute("id"));
			} catch (SQLException e) {
				returnPage = "/errore.jsp";
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  request.setAttribute("utente", utente);
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
