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
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtenteDAO model = new UtenteDAO();
		HttpSession sessione = request.getSession();
		dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
		try {
			String email=null;
			if(request.getParameter("email")!= null) email=request.getParameter("email");
			else email=request.getParameter("username");
			email=email.toLowerCase();
			Utente utente = model.doRetrieveByUsr(email);
			if(utente != null) {
				if(checkCredentials(email,request.getParameter("password").trim(),utente)) {
					if(utente.isAmministratore()) {
						sessione.setAttribute("admin", true);
					}
					else {
						sessione.setAttribute("admin", false);
					}
					sessione.setAttribute("id", utente.getId());
					dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
				}
			}
			dispatcher.forward(request, response);
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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