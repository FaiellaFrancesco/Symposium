package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.ProdottoDAO;
import model.DAO.UtenteDAO;
import model.beans.Prodotto;
import model.beans.Utente;

/**
 * Servlet implementation class campiProdotto
 */
@WebServlet("/campiUtente")
public class campiUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher dispatcher;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campiUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String returnPage = "/utente.jsp";
		UtenteDAO model = new UtenteDAO();
		Utente utente = null;
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			utente = model.doRetrieveByKey(id);
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
