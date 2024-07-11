package model.beans;

public class OrderLine{

    private Prodotto prodotto;
    private double prezzo; //all'acquisto
    private int iva; //all'acquisto
    private int quant;
    private String nome;

    public OrderLine(){}

    public Prodotto getProdotto(){
        return this.prodotto;
    }

    public double getPrezzo(){
        return this.prezzo;
    }

    public int getIva(){
        return this.iva;
    }

    public String getNome() {return this.nome;}
    public void setNome(String nome) { this.nome=nome;}
    
    public int getQuant(){
        return this.quant;
    }

    public void setProdotto(Prodotto p){
        this.prodotto=p;
    }

    public void setPrezzo(double prezzo){
        this.prezzo=prezzo;
    }

    public void setIva(int iva){
        this.iva=iva;
    }

    public void setQuant(int quant){
        this.quant=quant;
    }

    //Converte le righe del carrello in righe dell'ordine.
    public void setOrderLine(CartLine p){
        this.prodotto=p.getProdotto();
        this.prezzo=p.getProdotto().getPrezzo();
        this.iva=p.getProdotto().getIva();
        this.quant=p.getQuant();
        this.nome=p.getProdotto().getNome();
    }

}