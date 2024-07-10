package model.beans;

import java.util.Date;

public class Utente {
    
    // Attributes
    private int id;
    private String nome;
    private String cognome;
    private String email;
    private String pw;
    private String telefono;
    private Date dataNascita;
    private boolean amministratore;
    private String via;
    private String cap;
    private String citta;
    private String nomeCarta;
    private String scadenza;
    private String numeroCarta;
    private String cvv;
    
    public Utente() {
        this.id = 0;
        this.nome = null;
        this.cognome = null;
        this.email = null;
        this.pw = null;
        this.telefono = null;
        this.dataNascita = null;
        this.amministratore = false;
        this.via = null;
        this.cap = null;
        this.citta = null;
        this.nomeCarta = null;
        this.scadenza = null;
        this.numeroCarta = null;
        this.cvv = null;
    }
    
    // Methods
    // Constructor, getters, and setters
    

    // Getters and Setters
    public void setId(int id) { this.id = id; }
    public int getId() { return this.id; }

    public void setNome(String nome) { this.nome = nome; }
    public String getNome() { return this.nome; }

    public void setCognome(String cognome) { this.cognome = cognome; }
    public String getCognome() { return this.cognome; }

    public void setEmail(String email) { this.email = email; }
    public String getEmail() { return this.email; }

    public void setPw(String pw) { this.pw = pw; }
    public String getPw() { return this.pw; }

    public void setTelefono(String telefono) { this.telefono = telefono; }
    public String getTelefono() { return this.telefono; }

    public void setDataNascita(Date dataNascita) { this.dataNascita = dataNascita; }
    public Date getDataNascita() { return this.dataNascita; }

    public void setAmministratore(boolean amministratore) { this.amministratore = amministratore; }
    public boolean isAmministratore() { return this.amministratore; }

    public void setVia(String via) { this.via = via; }
    public String getVia() { return this.via; }

    public void setCap(String cap) { this.cap = cap; }
    public String getCap() { return this.cap; }

    public void setCitta(String citta) { this.citta = citta; }
    public String getCitta() { return this.citta; }

    public void setNomeCarta(String nomeCarta) { this.nomeCarta = nomeCarta; }
    public String getNomeCarta() { return this.nomeCarta; }

    public void setScadenza(String scadenza) { this.scadenza = scadenza; }
    public String getScadenza() { return this.scadenza; }

    public void setNumeroCarta(String numeroCarta) { this.numeroCarta = numeroCarta; }
    public String getNumeroCarta() { return this.numeroCarta; }

    public void setCvv(String cvv) { this.cvv = cvv; }
    public String getCvv() { return this.cvv; }

    @Override
    public String toString() {
        return "id" + id + "\n" +
                "nome" + nome;
    }
}
