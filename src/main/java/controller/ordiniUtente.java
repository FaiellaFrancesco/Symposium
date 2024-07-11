package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.ProdottoDAO;
import model.DAO.OrdineDAO;
import model.DAO.UtenteDAO;
import model.beans.Prodotto;
import model.beans.Utente;
import model.beans.Ordine;

/**
 * Servlet implementation class campiProdotto
 */
@WebServlet("/ordiniUtente")
public class ordiniUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher dispatcher;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String returnPage = "/orderUser.jsp";
		UtenteDAO model = new UtenteDAO();
		OrdineDAO ordinedao=new OrdineDAO();
		ArrayList <Ordine> ordine=null;
		Utente utente = null;
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			utente = model.doRetrieveByKey(id);
			ordine = ordinedao.doRetrieveByUsr(utente.getId());
		} catch (SQLException e) {
			returnPage = "/errore.jsp";
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  request.setAttribute("utente", utente);
	  request.setAttribute("ordini", ordine);
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