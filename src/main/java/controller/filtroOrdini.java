package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

import model.beans.Ordine;
import model.DAO.OrdineDAO;

@WebServlet("/filtroOrdini")
public class filtroOrdini extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessione = request.getSession();
        ArrayList<Ordine> ordiniFiltrati = null;
        Integer id=(Integer) null;
        if((int)sessione.getAttribute("id") == Integer.parseInt(request.getParameter("id")) || (boolean)sessione.getAttribute("admin")) {
        // Recupera i parametri dalla richiesta
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        	OrdineDAO order = new OrdineDAO();
        	id=Integer.parseInt(request.getParameter("id"));
        	String startDateString = request.getParameter("startDate");
        	String endDateString = request.getParameter("endDate");
        	Date startDateParam = null;
        	Date endDateParam = null;
			try {
				startDateParam = (startDateString != null && !startDateString.isEmpty()) ? sdf.parse(startDateString) : null;
				endDateParam = (endDateString != null && !endDateString.isEmpty()) ? sdf.parse(endDateString) : null;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
			try {
				if(startDateParam == null && endDateParam == null) {  //entrambe null prende tutti gli ordini
					ordiniFiltrati = order.doRetrieveByUsr(id);
				}
				else if(startDateParam == null && endDateParam != null) {
					ordiniFiltrati = order.doRetrieveByDate(new Date(0), endDateParam, id); //start null, prende tutti gli ordini fino alla data endDateParam
				}
				else if(startDateParam != null && endDateParam == null) {
					ordiniFiltrati = order.doRetrieveByDate(startDateParam, new Date(), id); //end null, prende tutti gli ordini dalla data startEndParam in poi
				}
				else {
					ordiniFiltrati = order.doRetrieveByDate(startDateParam, endDateParam, id); // filtra ordini in base a inizio e fine 
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	    }
      request.setAttribute("id", id);
      request.setAttribute("ordini", ordiniFiltrati);
      request.getRequestDispatcher("/orderUser.jsp").forward(request, response);
    }
}
