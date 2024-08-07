package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class redirectAdmin
 */
@WebServlet("/redirectAdmin")
public class redirectAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public redirectAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dispatch = "/errore.jsp";
		HttpSession sessione = request.getSession();
		String [] pagine = {"adminFunctions","insProdotto","modProdotto","prodottiAdmin","Utenti"};
		ArrayList<String> pagineConsentite = new ArrayList<String>(Arrays.asList(pagine));
		if(sessione.getAttribute("admin")!=null && (boolean)sessione.getAttribute("admin") && pagineConsentite.contains(request.getParameter("page"))){
			dispatch = "/admin/"+request.getParameter("page")+".jsp";
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(dispatch);
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
