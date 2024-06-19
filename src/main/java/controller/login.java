package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.beans.Utente;
import model.DAO.UtenteDAO;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	RequestDispatcher dispatcher;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		UtenteDAO model = new UtenteDAO();
		HttpSession sessione = request.getSession();
		dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
		try {
			Utente utente = model.doRetrieveByUsr(request.getParameter("username"));
			if(utente != null) {
				if(checkCredentials(request.getParameter("username"),request.getParameter("password"),utente)) {
					if(utente.isAmministratore()) {
						sessione.setAttribute("admin", true);
					}
					else {
						sessione.setAttribute("admin", false);
					}
					sessione.setAttribute("nome", utente.getNome());
					dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
				}
			}
			dispatcher.forward(request, response);
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private boolean checkCredentials(String mail, String pwd, Utente check) throws SQLException {
		
		return (mail.equals(check.getEmail()) && hashPassword(pwd).equals(check.getPw()));

	}
	
	private String hashPassword(String password) {
	    try {
	        MessageDigest md = MessageDigest.getInstance("SHA-512");
	        byte[] hashedPassword = md.digest(password.getBytes());
	        StringBuilder sb = new StringBuilder();
	        for (byte b : hashedPassword) {
	            sb.append(String.format("%02x", b));
	        }
	        return sb.toString();
	    } catch (NoSuchAlgorithmException e) {
	        throw new RuntimeException(e);
	    }
	}

}