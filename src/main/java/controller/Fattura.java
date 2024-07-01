package controller;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import model.beans.Ordine;
import model.beans.Utente;
import model.beans.OrderLine;
import model.beans.Prodotto;
import model.DAO.OrdineDAO;
import model.DAO.ProdottoDAO;
import model.DAO.UtenteDAO;

@WebServlet("/Fattura")
public class Fattura extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId=-1;

        if ( request.getParameter("orderId") == null) {
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

            // Genera il PDF della fattura
            String pdfPath = generateInvoicePDF(order, getServletContext().getRealPath("/invoices/"));

            // Passa il percorso del PDF alla pagina JSP
            request.setAttribute("pdfPath", pdfPath);
            request.getRequestDispatcher("/fattura.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error generating invoice", e);
        }
    }

    private String generateInvoicePDF(Order order, String outputDir) throws DocumentException, IOException {
        String pdfFileName = "fattura_" + order.getId() + ".pdf";
        String pdfFilePath = outputDir + pdfFileName;

        Document document = new Document();
        PdfWriter.getInstance(document, new FileOutputStream(pdfFilePath));

        document.open();

        // Aggiungi intestazione
        PdfPTable headerTable = new PdfPTable(2);
        headerTable.setWidthPercentage(100);
        headerTable.setWidths(new int[]{1, 3});

        PdfPCell logoCell = new PdfPCell();
        // Aggiungi l'immagine del logo (sostituisci il percorso con il percorso del tuo logo)
        // Image img = Image.getInstance(getServletContext().getRealPath("/path/to/logo.png"));
        // logoCell.addElement(img);
        logoCell.setBorder(PdfPCell.NO_BORDER);
        headerTable.addCell(logoCell);

        PdfPCell titleCell = new PdfPCell(new Phrase("Fattura", new Font(Font.FontFamily.HELVETICA, 18)));
        titleCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        titleCell.setBorder(PdfPCell.NO_BORDER);
        headerTable.addCell(titleCell);

        document.add(headerTable);

        document.add(new Paragraph(" "));

        // Aggiungi i dettagli dell'ordine
        PdfPTable detailsTable = new PdfPTable(2);
        detailsTable.setWidthPercentage(100);
        detailsTable.setWidths(new int[]{1, 2});

        addTableCell(detailsTable, "Numero:", order.getId());
        addTableCell(detailsTable, "Data:", order.getDate());
        addTableCell(detailsTable, "Cliente:", order.getCustomerName());
        addTableCell(detailsTable, "Modalità di pagamento:", order.getPaymentMethod());

        document.add(detailsTable);

        document.add(new Paragraph(" "));

        // Aggiungi gli articoli dell'ordine
        PdfPTable itemsTable = new PdfPTable(6);
        itemsTable.setWidthPercentage(100);
        itemsTable.setWidths(new float[]{1, 3, 1, 1, 1, 1});

        addTableHeader(itemsTable, "Cod. articolo");
        addTableHeader(itemsTable, "Descrizione");
        addTableHeader(itemsTable, "Q.tà");
        addTableHeader(itemsTable, "Prezzo uni.");
        addTableHeader(itemsTable, "Sc.");
        addTableHeader(itemsTable, "Importo");

        List<OrderItem> items = order.getItems();
        for (OrderItem item : items) {
            itemsTable.addCell(item.getCode());
            itemsTable.addCell(item.getDescription());
            itemsTable.addCell(String.valueOf(item.getQuantity()));
            itemsTable.addCell(String.valueOf(item.getUnitPrice()));
            itemsTable.addCell(String.valueOf(item.getDiscount()));
            itemsTable.addCell(String.valueOf(item.getTotalPrice()));
        }

        document.add(itemsTable);

        document.add(new Paragraph(" "));

        // Aggiungi il totale
        PdfPTable totalTable = new PdfPTable(2);
        totalTable.setWidthPercentage(100);
        totalTable.setWidths(new int[]{1, 2});

        addTableCell(totalTable, "Imponibile:", String.valueOf(order.getTaxable()));
        addTableCell(totalTable, "Imposta IVA:", String.valueOf(order.getVat()));
        addTableCell(totalTable, "TOTALE FATTURA:", String.valueOf(order.getTotal()));

        document.add(totalTable);

        document.close();

        return pdfFileName;
    }

    private void addTableCell(PdfPTable table, String label, String value) {
        PdfPCell cell = new PdfPCell(new Phrase(label));
        cell.setBorder(PdfPCell.NO_BORDER);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(value));
        cell.setBorder(PdfPCell.NO_BORDER);
        table.addCell(cell);
    }

    private void addTableHeader(PdfPTable table, String headerTitle) {
        PdfPCell header = new PdfPCell();
        header.setPhrase(new Phrase(headerTitle, new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD)));
        header.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(header);
    }
}


