package controller;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import model.beans.Carrello;
import model.DAO.CarrelloDAO;

public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        // Implementazione opzionale per la gestione della creazione di una sessione
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // Implementazione per la gestione della distruzione di una sessione
        HttpSession session = se.getSession();
        // Ottieni il carrello dalla sessione
        Carrello cart= (Carrello) session.getAttribute("carrello");
        // Salva il carrello nel database
        CarrelloDAO cartdao=new CarrelloDAO();
        try{cartdao.doUpdate(cart);}
        catch(Exception e){}
    }
}
