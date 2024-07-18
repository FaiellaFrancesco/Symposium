package controller;

import model.DAO.ProdottoDAO;
import model.beans.Prodotto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "HomepageServlet", urlPatterns = "/Homepage")
public class HomepageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Crea un'istanza del DAO dei prodotti
        ProdottoDAO prodottoDAO = new ProdottoDAO();

        try {
            // Ottieni tutti i prodotti (puoi anche specificare un ordine se necessario)
            Collection<Prodotto> products = prodottoDAO.doRetrieveAll(null); // Passa null per non specificare un ordine

            // Passa i dati alla JSP per visualizzazione
            request.setAttribute("products", products);
            request.getRequestDispatcher("/Homepage.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Errore durante il recupero dei prodotti: " + e.getMessage());
        }
    }
}
