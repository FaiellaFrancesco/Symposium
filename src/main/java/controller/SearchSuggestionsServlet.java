package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.DAO.ProdottoDAO;
import model.beans.Prodotto;

@WebServlet("/SearchSuggestionsServlet")
public class SearchSuggestionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pattern = request.getParameter("pattern");
        List<Prodotto> suggestions = null;
		try {
			suggestions = getSuggestionsFromDatabase(pattern);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Metodo per ottenere i suggerimenti dal database

        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String json = gson.toJson(suggestions);
        out.print(json);
        out.flush();
    }

    private List<Prodotto> getSuggestionsFromDatabase(String pattern) throws SQLException {
        // Esempio: metodo per ottenere i suggerimenti dal database in base al query
        ArrayList<Prodotto> suggestions = null;
        // Esempio di logica per ottenere i suggerimenti dal database
        if (pattern != null && !pattern.trim().isEmpty()) {
            // Esempio di logica per ottenere i suggerimenti dal database
            ProdottoDAO model = new ProdottoDAO();
            
            suggestions = (ArrayList<Prodotto>) model.doRetrieveByPattern(pattern);
        }
        return suggestions;
    }

  }