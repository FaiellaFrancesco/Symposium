package controller;

import java.io.IOException;
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ottieni i parametri dal form
        String utenteId = request.getParameter("id");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("pw");
        String telefono = request.getParameter("telefono");
        String dataNascitaStr = request.getParameter("dataNascita");
        String via = request.getParameter("via");
        String cap = request.getParameter("cap");
        String citta = request.getParameter("citta");
        String stato = request.getParameter("stato");
        
        System.out.println(utenteId);
        System.out.println(nome);
        System.out.println(cognome);
        System.out.println(email);
        System.out.println(password);
        System.out.println(telefono);
        System.out.println(dataNascitaStr);
        System.out.println(via);
        System.out.println(cap);
        System.out.println(citta);
        System.out.println(stato);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            Date dataNascita = sdf.parse(dataNascitaStr);
         // Crea un oggetto Utente con i dati aggiornati
            Utente utente = new Utente();
            utente.setId(Integer.parseInt(utenteId));
            utente.setNome(nome);
            utente.setCognome(cognome);
            utente.setEmail(email);
            utente.setPw(password);
            utente.setTelefono(telefono);
            utente.setDataNascita(dataNascita);
            utente.setVia(via);
            utente.setCap(cap);
            utente.setCitta(citta);

            // Istanzia il model DAO per accedere al database
            UtenteDAO utenteDAO = new UtenteDAO();

            try {
                // Esegue l'aggiornamento dell'utente nel database
                utenteDAO.doUpdate(utente);


                request.setAttribute("utente", utente);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                // Gestisci l'errore
                response.sendRedirect(request.getContextPath() + "/errore.jsp");
            }


        } catch (ParseException e) {
            e.printStackTrace();
            // Gestire il caso in cui la stringa non sia nel formato atteso
        }
    }
}
