package controller;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.regex.Pattern;
import java.util.regex.Matcher;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.UtenteDAO;
import model.beans.Utente;
/**
 * Servlet implementation class product
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
    private static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);
    private static final String NAME_REGEX = "^[a-zA-Zà-žÀ-Ž\\s]+$";
    private static final Pattern NAME_PATTERN = Pattern.compile(NAME_REGEX);
    private static final String PASSWORD_REGEX = "^[a-zA-Z0-9!@#$%^&*()_+\\-=\\[\\]{};:|,.<>/?]{8,}$";
    private static final Pattern PASSWORD_PATTERN = Pattern.compile(PASSWORD_REGEX);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			doPost(request, response);
            
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    UtenteDAO utente_dao = new UtenteDAO();
	    Utente user = new Utente();
	    Utente utente_2=null;
	    ArrayList<String> errori = new ArrayList<>(0);
	    
	    // Recupera i parametri dalla richiesta
	    String email = request.getParameter("email").toLowerCase();
	    String password = request.getParameter("password").trim();
	    String nome = request.getParameter("nome").trim();
	    String cognome = request.getParameter("cognome").trim();
	    
	    
	    if(email==null || !isValidEmail(email)) errori.add("email");
	    else {
	    	try{
	    		utente_2=utente_dao.doRetrieveByUsr(email);
	    	}
	    	catch(SQLException sqle) {
	    		sqle.printStackTrace();
	    	}
	    	if(utente_2!=null) errori.add("email");
	    }
	    
	    if (password == null || !isValidPassword(password)) errori.add("password");
	    if (nome == null || !isValidName(nome)) errori.add("nome");
        if (cognome == null || !isValidName(cognome)) errori.add("cognome");
	    
	    if(errori.size()==0) {
	    	String hashedPassword = hashPassword(password);
	    	user.setEmail(email);
	    	user.setPw(hashedPassword);
	    	user.setNome(nome);
	    	user.setCognome(cognome);
	    	try {
	    	    utente_dao.doSave(user);
	    	    request.setAttribute("email", email);
	    	    request.setAttribute("password", password);
	    	    
	    	    // Reindirizza automaticamente alla servlet "login" dopo la registrazione
	    	    RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
	    	    dispatcher.forward(request, response);
	    	} catch(Exception e) {
	    	    e.printStackTrace();
	    	}
	    }
	    else {
	    	request.setAttribute("errori", errori);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
	        dispatcher.forward(request, response);
	    }
	    
	}
	
	private boolean isValidEmail(String email) {
        if (email == null) {
            return false;
        }
        Matcher matcher = EMAIL_PATTERN.matcher(email);
        return matcher.matches();
    }
	
	private boolean isValidName(String name) {
        if (name == null) {
            return false;
        }
        Matcher matcher = NAME_PATTERN.matcher(name);
        return matcher.matches();
    }
	
	private boolean isValidPassword(String password) {
        if (password == null) {
            return false;
        }
        Matcher matcher = PASSWORD_PATTERN.matcher(password);
        return matcher.matches();
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
