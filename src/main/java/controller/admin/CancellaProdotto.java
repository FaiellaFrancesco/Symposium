package controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.InputSanitizer;
import model.DAO.ProdottoDAO;
import model.beans.Prodotto;

@WebServlet("/admin/cancellaProdotto")
@MultipartConfig
public class cancellaProdotto extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "immagini";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if(request.getParameter("id")==null ) {
    		response.sendRedirect("errore.jsp");
            return;
    	}
    	ProdottoDAO pdao=new ProdottoDAO();
    	try {
			if(pdao.doDelete(Integer.valueOf(request.getParameter("id")))) {
				response.sendRedirect("Utente.jsp");
			}
			else {
				response.sendRedirect("errore.jsp");
			}
		} catch (NumberFormatException | SQLException | IOException e) {
			e.printStackTrace();
			response.sendRedirect("errore.jsp");
		}
    	
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}