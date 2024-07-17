package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.UtenteDAO;
import model.beans.Utente;

@WebServlet("/modUtente")
public class modUtente extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Non gestiamo GET, potrebbe essere utilizzato per un'altra funzionalità
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Ottieni i parametri dal form
        String utenteIdStr = request.getParameter("id");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("pw");
        String telefono = request.getParameter("telefono");
        String dataNascitaStr = request.getParameter("dataNascita");
        String via = request.getParameter("via");
        String cap = request.getParameter("cap");
        String citta = request.getParameter("citta");
        String nomeCarta = request.getParameter("nomeCarta");
        String numeroCarta = request.getParameter("numeroCarta");
        String scadenza = request.getParameter("scadenza");
        String cvv = request.getParameter("cvv");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            // Converte utenteId in un intero
            int utenteId = Integer.parseInt(utenteIdStr);

            // Recupera l'utente dal database
            UtenteDAO utenteDAO = new UtenteDAO();
            Utente utente = utenteDAO.doRetrieveByKey(utenteId);

            // Set dei valori dell'utente con i parametri ricevuti
            utente.setNome(nome);
            utente.setCognome(cognome);
            utente.setEmail(email.toLowerCase());
            
            // Se la password non è vuota, aggiorna la password
            if (!password.isEmpty() && !password.trim().isEmpty()) {
                utente.setPw(hashPassword(password));
            }

            // Se il telefono non è "---", aggiorna il telefono
            if (!telefono.equals("---")) {
                utente.setTelefono(telefono);
            }

            
            // Gestione della data di nascita
            if (dataNascitaStr != null && !dataNascitaStr.isEmpty()) {
                Date dataNascita = sdf.parse(dataNascitaStr);
                utente.setDataNascita(new java.sql.Date(dataNascita.getTime()));
            }
            
            // Aggiorna gli altri campi dell'utente se non sono "---"
            if (!via.equals("---")) utente.setVia(via);
            if (!cap.equals("---")) utente.setCap(cap);
            if (!citta.equals("---")) utente.setCitta(citta);
            if (!nomeCarta.equals("---")) utente.setNomeCarta(nomeCarta);
            if (!numeroCarta.equals("---")) utente.setNumeroCarta(numeroCarta);
            if (!scadenza.equals("---")) utente.setScadenza(scadenza);
            if (!cvv.equals("---")) utente.setCvv(cvv);
            if (via.equals("")) utente.setVia(null);
            if (cap.equals("")) utente.setCap(null);
            if (citta.equals("")) utente.setCitta(null);
            if (nomeCarta.equals("")) utente.setNomeCarta(null);
            if (numeroCarta.equals("")) utente.setNumeroCarta(null);
            if (scadenza.equals("")) utente.setScadenza(null);
            if (cvv.equals("")) utente.setCvv(null);

            // Esegue l'aggiornamento dell'utente nel database
            utenteDAO.doUpdate(utente);

            // Imposta l'utente aggiornato come attributo della richiesta
            request.setAttribute("utente", utente);
            request.setAttribute("id", utenteId);
            // Esegue il forward alla pagina utente.jsp per visualizzare l'utente aggiornato
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/utente.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException | SQLException | ParseException e) {
            e.printStackTrace();
            // Reindirizzamento a error.jsp in caso di eccezione
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
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
