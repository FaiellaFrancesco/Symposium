package model.beans;

import java.util.ArrayList;
import java.util.GregorianCalendar;

public class Ordine {

    private int id;
    private GregorianCalendar data;
    private int stato;
    private String citta;
    private String via;
    private String CAP;
    private int id_utente;
    private ArrayList<OrderLine> prodotti;

    // Costruttori
    public Ordine() {
        prodotti = new ArrayList<>();
    }

    // Getter e Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public GregorianCalendar getData() {
        return data;
    }

    public void setData(GregorianCalendar data) {
        this.data = data;
    }

    public int getStato() {
        return stato;
    }

    public void setStato(int stato) {
        this.stato = stato;
    }

    public String getCitta() {
        return citta;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public String getVia() {
        return via;
    }

    public void setVia(String via) {
        this.via = via;
    }

    public String getCAP() {
        return CAP;
    }

    public void setCAP(String CAP) {
        this.CAP = CAP;
    }

    public int getUtente() {
        return id_utente;
    }

    public void setUtente(int id_utente) {
        this.id_utente = id_utente;
    }

    public ArrayList<OrderLine> getProdotti() {
        return prodotti;
    }

    public void setProdotti(ArrayList<OrderLine> prodotti) {
        this.prodotti = prodotti;
    }

    @Override
    public String toString() {
        return "Ordine{" +
                "id=" + id +
                ", data=" + (data != null ? data.getTime() : null) +
                ", stato=" + stato +
                ", citta='" + citta + '\'' +
                ", via='" + via + '\'' +
                ", CAP='" + CAP + '\'' +
                ", id_utente=" + id_utente +
                ", prodotti=" + prodotti +
                '}';
    }

    public void addToOrdine(CartLine p){
        prodotti.add(new OrderLine().setOrderLine(p));
    }
}