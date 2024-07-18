package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.OrdineDAO;
import model.DAO.UtenteDAO;
import model.beans.Carrello;
import model.beans.OrderLine;
import model.beans.Ordine;
import model.beans.Utente;

/**
 * Servlet implementation class pagamento
 */
@WebServlet("/pagamento")
public class pagamento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pagamento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("/Symposium/home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sessione = request.getSession();
		OrdineDAO ordineModel = new OrdineDAO();
		Carrello cart = (Carrello) sessione.getAttribute("cart");
		Ordine ordine = new Ordine();
		String cap = request.getParameter("cap");
		String citta = request.getParameter("citta");
		String indirizzo = request.getParameter("indirizzo");
		int id = (int) sessione.getAttribute("id");
		ArrayList<OrderLine> prodotti = new ArrayList<OrderLine>();
		if(cart!=null && cart.getProdotti().size()>0) {
			cart.getProdotti().stream().forEach((product) -> {
			    OrderLine orderLine = new OrderLine();
			    orderLine.setOrderLine(product);  // Presumendo che `setOrderLine` accetti un prodotto
			    prodotti.add(orderLine);
			});
		  ordine.setProdotti(prodotti);
		  ordine.setCAP(cap);
		  ordine.setCitta(citta);
		  ordine.setData(new GregorianCalendar());
		  ordine.setUtente(id);
		  ordine.setStato(0);
		  ordine.setVia(indirizzo);
		  try {
			ordineModel.doSave(ordine);
		  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServletException("Database access error: ", e); // Lancia una ServletException per segnalare l'errore al container
		  }
		  sessione.setAttribute("cart", null);
		  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
  		  dispatcher.forward(request, response);
		}
		else {
			response.sendRedirect("/Symposium/carrello.jsp");
		}
	}

}
