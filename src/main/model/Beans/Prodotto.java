package model.Beans;

public class Prodotto{
	
	//Attributes
	private int id;
	private String nome;
	private double prezzo;
	private int iva;
	private String descrizione;
	private String immagine;
	private String denominazione;
	private int stock;
	private double alcol;
	private double formato;
	private String provenienza;
	private String tipologia;
	private int annata;
	
	
	//method
	public Prodotto() {}
	
	
	public void setId(int id) {	this.id=id;}
	public int getId() { return this.id;}
	
	public void setNome(String nome) { this.nome=nome;}
	public String getNome() { return this.nome;}
	
	public void setPrezzo(double prezzo) { this.prezzo=prezzo;}
	public double getPrezzo() { return this.prezzo;}
	
	public void setIva(int iva) { this.iva=iva;}
	public int getIva() { return this.iva;}

	public void setDescrizione(String descrizione) { this.descrizione=descrizione;}
	public String getDescrizione() { return this.descrizione;}

	public void setImmagine(String immagine) { this.immagine=immagine;}
	public String getImmagine() { return this.immagine;}
	
	public void setDenominazione(String denominazione) { this.denominazione=denominazione;}
	public String getDenominazione() { return this.denominazione;}
	
	public void setStock(int stock) {	this.stock=stock;}
	public int getStock() { return this.stock;}
	
	public void setFormato(double formato) { this.formato=formato;}
	public double getFormato() { return this.formato;}
	
	public void setAlcol(double alcol) { this.alcol=alcol;}
	public double getAlcol() { return this.alcol;}
	
	public void setProvenienza(String provenienza) { this.provenienza=provenienza;}
	public String getProvenienza() { return this.provenienza;}
	
	public void setTipologia(String tipologia) { this.tipologia=tipologia;}
	public String getTipologia() { return this.tipologia;}
	
	public void setAnnata(int annata) {	this.annata=annata;}
	public int getAnnata() { return this.annata;}
	
	@Override
	public String toString() {
		return "id"+id+"\n"+
				"nome"+nome;
	}
	
}