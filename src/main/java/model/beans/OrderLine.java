package model.beans;

public class OrderLine{

    private int id_prodotto;
    private double prezzo; //all'acquisto
    private int iva; //all'acquisto
    private int quant;

    public OrderLine(){}

    public int getIdProdotto(){
        return this.id_prodotto;
    }

    public double getPrezzo(){
        return this.prezzo;
    }

    public int getIva(){
        return this.iva;
    }

    public int getQuant(){
        return this.quant;
    }

    public void setIdProdotto(int id){
        this.id_prodotto=id;
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
        this.id_prodotto=p.getProdotto().getId();
        this.prezzo=p.getProdotto().getPrezzo();
        this.iva=p.getProdotto().getIva();
        this.quant=p.getQuant();
    }

}