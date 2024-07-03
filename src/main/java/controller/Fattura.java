package controller;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        int orderId = -1;

        if (request.getParameter("orderId") == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing orderId parameter");
            return;
        }
        orderId = Integer.parseInt(request.getParameter("orderId"));

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

            // Genera il PDF della fattura
            generateInvoicePDF(order, user, response, request);
        } catch (Exception e) {
            throw new ServletException("Error generating invoice", e);
        }
    }

    private void generateInvoicePDF(Ordine order, Utente user, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=fattura_" + order.getId() + ".pdf");

        PdfWriter writer = new PdfWriter(response.getOutputStream());
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc);

        // Ottieni il percorso assoluto dell'immagine del logo
        String logoPath = request.getServletContext().getRealPath("/immagini/logo.png");

        // Aggiungi intestazione
        Table headerTable = new Table(2);
        headerTable.setWidth(new UnitValue(UnitValue.PERCENT, 100));

        Cell logoCell = new Cell();
        // Aggiungi l'immagine del logo
        ImageData imageData = ImageDataFactory.create(logoPath);
        Image img = new Image(imageData);
        img.setWidth(150);  // Ridimensiona il logo
        logoCell.add(img);
        logoCell.setBorder(Border.NO_BORDER);
        headerTable.addCell(logoCell);

        Cell titleCell = new Cell().add(new Paragraph("Fattura").setFontSize(18).setTextAlignment(TextAlignment.RIGHT));
        titleCell.setBorder(Border.NO_BORDER);
        headerTable.addCell(titleCell);

        document.add(headerTable);

        document.add(new Paragraph(" "));

        // Aggiungi i dettagli dell'utente
        Table userDetailsTable = new Table(new float[]{1, 3});
        userDetailsTable.setWidth(new UnitValue(UnitValue.PERCENT, 100));

        addDetailTableCell(userDetailsTable, "Cod. Cliente:", String.valueOf(user.getId()));
        addDetailTableCell(userDetailsTable, "Destinatario:", user.getNome() + " " + user.getCognome());
        addDetailTableCell(userDetailsTable, "Indirizzo di spedizione:", order.getCAP()+" "+order.getCitta()+" "+order.getVia());
        addDetailTableCell(userDetailsTable, "Modalità di pagamento:", "Carta di credito");

        document.add(userDetailsTable);

        document.add(new Paragraph(" "));

        // Aggiungi i dettagli dell'ordine
        Table orderDetailsTable = new Table(new float[]{1, 3});
        orderDetailsTable.setWidth(new UnitValue(UnitValue.PERCENT, 100));

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy", Locale.ITALY);
        String formattedDate = sdf.format(order.getData().getTime());

        addDetailTableCell(orderDetailsTable, "ID Ordine:", String.valueOf(order.getId()));
        addDetailTableCell(orderDetailsTable, "Data Ordine:", formattedDate);

        document.add(orderDetailsTable);

        document.add(new Paragraph(" "));

        // Aggiungi la data della fattura
        String currentDate = sdf.format(new Date());
        Paragraph invoiceDate = new Paragraph("Data Fattura: " + currentDate)
                .setFontSize(10)
                .setTextAlignment(TextAlignment.RIGHT)
                .setMarginTop(10);
        document.add(invoiceDate);

        // Aggiungi gli articoli dell'ordine
        Table itemsTable = new Table(new float[]{2, 4, 1, 1, 1, 1});
        itemsTable.setWidth(new UnitValue(UnitValue.PERCENT, 100));

        addTableHeader(itemsTable, "Cod. articolo");
        addTableHeader(itemsTable, "Descrizione");
        addTableHeader(itemsTable, "Q.tà");
        addTableHeader(itemsTable, "Prezzo uni.");
        addTableHeader(itemsTable, "IVA");
        addTableHeader(itemsTable, "Importo");

        ArrayList<OrderLine> items = order.getProdotti();
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

            itemsTable.addCell(new Cell().add(new Paragraph(String.valueOf(item.getProdotto().getId()))).setTextAlignment(TextAlignment.CENTER));
            itemsTable.addCell(new Cell().add(new Paragraph(item.getProdotto().getNome())).setTextAlignment(TextAlignment.LEFT));
            itemsTable.addCell(new Cell().add(new Paragraph(String.valueOf(item.getQuant()))).setTextAlignment(TextAlignment.CENTER));
            itemsTable.addCell(new Cell().add(new Paragraph(String.format("%.2f", item.getPrezzo()))).setTextAlignment(TextAlignment.RIGHT));
            itemsTable.addCell(new Cell().add(new Paragraph(String.format("%.2f", iva))).setTextAlignment(TextAlignment.RIGHT));
            itemsTable.addCell(new Cell().add(new Paragraph(String.format("%.2f", item.getPrezzo()*item.getQuant()))).setTextAlignment(TextAlignment.RIGHT));
        }

        document.add(itemsTable);

        document.add(new Paragraph(" "));

        // Aggiungi il totale
        Table totalTable = new Table(2);
        totalTable.setWidth(new UnitValue(UnitValue.PERCENT, 100));

        addTotalTableCell(totalTable, "Imponibile:", String.format("%.2f", totaleImponibile));
        addTotalTableCell(totalTable, "Imposta IVA:", String.format("%.2f", totaleIva));
        addTotalTableCell(totalTable, "TOTALE FATTURA:", String.format("%.2f", totale));

        document.add(totalTable);

        document.close();
    }

    private void addDetailTableCell(Table table, String label, String value) {
        Cell cell = new Cell().add(new Paragraph(label));
        cell.setBorder(Border.NO_BORDER);
        table.addCell(cell);

        cell = new Cell().add(new Paragraph(value));
        cell.setBorder(Border.NO_BORDER);
        table.addCell(cell);
    }

    private void addTotalTableCell(Table table, String label, String value) {
        Cell cell = new Cell().add(new Paragraph(label).setBold());
        cell.setBorder(Border.NO_BORDER);
        table.addCell(cell);

        cell = new Cell().add(new Paragraph(value).setBold());
        cell.setBorder(Border.NO_BORDER);
        table.addCell(cell);
    }

    private void addTableHeader(Table table, String headerTitle) {
        Cell header = new Cell().add(new Paragraph(headerTitle).setBold());
        header.setTextAlignment(TextAlignment.CENTER);
        header.setBackgroundColor(new DeviceRgb(220, 220, 220));
        table.addCell(header);
    }
}
