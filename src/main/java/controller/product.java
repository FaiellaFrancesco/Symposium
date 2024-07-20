package controller;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.ProdottoDAO;
import model.beans.Prodotto;
/**
 * Servlet implementation class product
 */
@WebServlet("/product")
public class product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			ProdottoDAO pd = new ProdottoDAO();
			Prodotto p=new Prodotto();
			Integer productId = Integer.parseInt(request.getParameter("id"));
			try {
				p = pd.doRetrieveByKey(productId);
				if (p.getId()==productId.intValue()) {
			        // Procedi con l'instradamento alla pagina prodotto.jsp
					if(!p.getShow()) request.getRequestDispatcher("/error.jsp").forward(request, response);
			        request.setAttribute("prodotto", p);
			        request.getRequestDispatcher("/prodotto.jsp").forward(request, response);
			    } else {
			        // Prodotto non trovato, instradamento alla pagina error.jsp
			        request.getRequestDispatcher("/error.jsp").forward(request, response);
			    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
            
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}