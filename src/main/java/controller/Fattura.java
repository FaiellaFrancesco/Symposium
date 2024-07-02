package controller;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import model.beans.Ordine;
import model.beans.Utente;
import model.beans.OrderLine;
import model.DAO.OrdineDAO;
import model.DAO.UtenteDAO;

@WebServlet("/Fattura")
public class Fattura extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera l'ID dell'ordine dal parametro della richiesta
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        System.out.println(1);
        try {
            // Recupera i dettagli dell'ordine utilizzando il DAO
            OrdineDAO orderDAO = new OrdineDAO();
            Ordine order = orderDAO.doRetrieveByKey(orderId);

            if (order == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
                return;
            }

            UtenteDAO utenteDAO = new UtenteDAO();
            Utente user = utenteDAO.doRetrieveByKey(order.getUtente());
            System.out.println(2);
            // Genera il PDF della fattura
            byte[] pdfBytes = generateInvoicePDF(order, user);
            System.out.println(3);
            // Imposta gli header della risposta per consentire il download del file
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"fattura_" + orderId + ".pdf\"");
            response.setContentLength(pdfBytes.length);
            System.out.println(4);
            // Scrivi i byte del PDF nella risposta
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(pdfBytes);
            outputStream.flush();
            outputStream.close();
            System.out.println(5);

        } catch (Exception e) {
            throw new ServletException("Error generating or downloading invoice", e);
        }
    }

    
    
    private byte[] generateInvoicePDF(Ordine order, Utente user) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        PdfWriter writer = new PdfWriter(baos);
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc);

        // Aggiungi intestazione
        Table headerTable = new Table(2);
        headerTable.setWidth(100f);

        Cell logoCell = new Cell();
        // Aggiungi l'immagine del logo (sostituisci il percorso con il percorso del tuo logo)
        // ImageData imageData = ImageDataFactory.create(getServletContext().getRealPath("/path/to/logo.png"));
        // Image img = new Image(imageData);
        // logoCell.add(img);
        logoCell.setBorder(Border.NO_BORDER);
        headerTable.addCell(logoCell);

        Cell titleCell = new Cell().add(new Paragraph("Fattura").setFontSize(18));
        titleCell.setTextAlignment(TextAlignment.RIGHT);
        titleCell.setBorder(Border.NO_BORDER);
        headerTable.addCell(titleCell);

        document.add(headerTable);

        document.add(new Paragraph(" "));

        // Aggiungi i dettagli dell'ordine
        Table detailsTable = new Table(2);
        detailsTable.setWidth(100f);

        Date dateToFormat = order.getData().getTime();
	    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy", Locale.ITALY);
	    String formattedDate = sdf.format(dateToFormat);

        addTableCell(detailsTable, "Numero:", String.valueOf(order.getId()));
        addTableCell(detailsTable, "Data:", formattedDate);
        addTableCell(detailsTable, "Cliente:", user.getNome() + " " + user.getCognome());
        addTableCell(detailsTable, "Modalità di pagamento:", "Pagamento Online");

        document.add(detailsTable);

        document.add(new Paragraph(" "));

        // Aggiungi gli articoli dell'ordine
        Table itemsTable = new Table(new float[]{1, 3, 1, 1, 1, 1});
        itemsTable.setWidth(100f);

        addTableHeader(itemsTable, "Cod. articolo");
        addTableHeader(itemsTable, "Descrizione");
        addTableHeader(itemsTable, "Q.tà");
        addTableHeader(itemsTable, "Prezzo uni.");
        addTableHeader(itemsTable, "IVA");
        addTableHeader(itemsTable, "Importo");

        List<OrderLine> items = order.getProdotti();
        double totaleImponibile = 0;
        double totaleIva = 0;
        double totale = 0;

        for (OrderLine item : items) {
            double prezzoTotale = item.getQuant() * item.getPrezzo();
            double iva = item.getIva();  // IVA per articolo
            double importoConIva = prezzoTotale + (prezzoTotale * iva / 100);

            totaleImponibile += prezzoTotale;
            totaleIva += prezzoTotale * iva / 100;
            totale += importoConIva;

            // Aggiungi il dettaglio del prodotto alla tabella degli articoli
            itemsTable.addCell(String.valueOf(item.getProdotto().getId()));
            itemsTable.addCell(item.getProdotto().getNome());
            itemsTable.addCell(String.valueOf(item.getQuant()));
            itemsTable.addCell(String.valueOf(item.getPrezzo()));
            itemsTable.addCell(String.valueOf(iva));
            itemsTable.addCell(String.valueOf(importoConIva));
        }

        document.add(itemsTable);

        document.add(new Paragraph(" "));

        // Aggiungi il totale
        Table totalTable = new Table(2);
        totalTable.setWidth(100f);

        addTableCell(totalTable, "Imponibile:", String.format("%.2f", totaleImponibile));
        addTableCell(totalTable, "Imposta IVA:", String.format("%.2f", totaleIva));
        addTableCell(totalTable, "TOTALE FATTURA:", String.format("%.2f", totale));

        document.add(totalTable);

        document.close();
        System.out.println(2.10);

        // Ottieni i byte del PDF dal ByteArrayOutputStream
        return baos.toByteArray();
    }

    private void addTableCell(Table table, String label, String value) {
        Cell cell = new Cell().add(new Paragraph(label));
        cell.setBorder(Border.NO_BORDER);
        table.addCell(cell);

        cell = new Cell().add(new Paragraph(value));
        cell.setBorder(Border.NO_BORDER);
        table.addCell(cell);
    }

    private void addTableHeader(Table table, String headerTitle) {
        Cell header = new Cell().add(new Paragraph(headerTitle).setBold());
        header.setTextAlignment(TextAlignment.CENTER);
        table.addCell(header);
    }
}
