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

import model.DAO.ProdottoDAO;
import model.beans.Prodotto;

/**
 * Servlet implementation class prodottiAdmin
 */
@WebServlet("/prodottiAdmin")
public class prodottiAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public prodottiAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProdottoDAO model = new ProdottoDAO();
		ArrayList<Prodotto> prodotti = null;
		Prodotto prodotto = null;
		if(request.getParameter("id") == null || request.getParameter("id").equals("")) {
			try {
				prodotti = (ArrayList<Prodotto>) model.doRetrieveAll("");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
			try {
				int prodottoId = Integer.parseInt(request.getParameter("id"));
				prodotto = model.doRetrieveByKey(prodottoId);
				prodotti=new ArrayList<Prodotto>();
				prodotti.add(prodotto);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
        request.setAttribute("prodotti", prodotti);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/prodottiAdmin.jsp");
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
