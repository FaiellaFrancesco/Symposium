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
import javax.servlet.http.HttpSession;

import model.DAO.UtenteDAO;
import model.beans.Utente;
/**
 * Servlet implementation class product
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
	    ArrayList<String> errori = new ArrayList<>();
	    HttpSession sessione = request.getSession();
	    
	    // Recupera i parametri dalla richiesta
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String nome = request.getParameter("nome");
	    String cognome = request.getParameter("cognome");

	    // Controllo se l'email è corretta e univoca
	    if (email == null || !email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
	        errori.add("Email non valida");
	    } else {
	        try {
	            user = utente_dao.doRetrieveByUsr(email);
	            if (user != null) {
	                errori.add("Esiste già un utente con questa email");
	            }
	        } catch (SQLException e) {
	            // Gestione dell'eccezione
	        }
	    }

	    // Controllo lunghezza password
	    if (password == null || password.length() < 8) {
	        errori.add("La password deve essere lunga almeno 8 caratteri");
	    }

	    // Controllo se nome e cognome sono valorizzati
	    if (nome == null || nome.isEmpty()) {
	        errori.add("Il nome non può essere vuoto");
	    }

	    if (cognome == null || cognome.isEmpty()) {
	        errori.add("Il cognome non può essere vuoto");
	    }

	    // Se non ci sono errori, procedi con la registrazione
	    if (errori.isEmpty()) {
	        // Cifra la password
	        //String passwordCifrata = BCrypt.hashpw(password, BCrypt.gensalt());
	        
	        // Imposta i parametri dell'utente
	        user.setEmail(email);
	        user.setPw(password);
	        user.setNome(nome);
	        user.setCognome(cognome);

	        try {
	            // Salva l'utente nel database
	            utente_dao.doSave(user);
	            
	            //effettuo il login
	            request.setAttribute("from", 1); // indica che vengo dalla registrazione
	            request.setAttribute("username", email);
	            request.setAttribute("password", password);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
	            dispatcher.forward(request, response);
	        } catch (SQLException e) {
	            // Gestione dell'eccezione
	        }
	    } else {
	        // Ci sono errori, gestiscili
	    	request.setAttribute("errori", errori);

	        // Reindirizza la richiesta alla pagina register.jsp
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
	        dispatcher.forward(request, response);
	    }
	}

		
		
}