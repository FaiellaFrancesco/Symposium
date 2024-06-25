package controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.DAO.ProdottoDAO;
import model.beans.Prodotto;

@WebServlet("/insProdotto")
@MultipartConfig
public class insProdotto extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "immagini";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String applicationPath = request.getServletContext().getRealPath("/");
    	String uploadFilePath = applicationPath + UPLOAD_DIR;
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part filePart = request.getPart("file");
        String fileName = getFileName(filePart);

        ProdottoDAO model = new ProdottoDAO();
        Prodotto p = new Prodotto();
        p.setNome(request.getParameter("nome"));
        p.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
        p.setIva(Integer.parseInt(request.getParameter("iva")));
        p.setDescrizione(request.getParameter("descrizione"));
        p.setStock(Integer.parseInt(request.getParameter("stock")));
        p.setAlcol(Double.parseDouble(request.getParameter("alcol")));
        p.setFormato(Double.parseDouble(request.getParameter("formato")));
        p.setProvenienza(request.getParameter("provenienza"));
        p.setTipologia(request.getParameter("tipologia"));
        p.setAnnata(Integer.parseInt(request.getParameter("annata")));
        p.setDenominazione(request.getParameter("denominazione"));

        try {
            // Salva il prodotto nel database
            model.doSave(p);

            // Ottieni l'ID dell'ultimo prodotto inserito
            int lastInsertedId = model.doRetrieveLastId();

            // Genera un nuovo nome per l'immagine basato sull'ID del prodotto
            String newFileName = lastInsertedId + fileName.substring(fileName.lastIndexOf("."));
            String filePath = uploadFilePath + File.separator + newFileName;
            
            // Salva l'immagine con il nuovo nome
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
            }

            // Aggiorna il prodotto nel database con il nome dell'immagine
            p.setId(lastInsertedId);
            p.setImmagine(UPLOAD_DIR + "/" + newFileName);
            model.doUpdate(p);

            // Reindirizza alla pagina di conferma o ad altre operazioni
            response.sendRedirect("successo.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Gestisci l'errore
            response.sendRedirect("errore.jsp");
        }
    }

    // Metodo per ottenere il nome del file da una parte del file
    private String getFileName(Part filePart) {
        String header = filePart.getHeader("content-disposition");
        for (String headerPart : header.split(";")) {
            if (headerPart.trim().startsWith("filename")) {
                return headerPart.substring(headerPart.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
