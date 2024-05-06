package model.beans;

import java.util.GregorianCalendar;

public class CartLine{

    //int prodotto;
	Prodotto prodotto;
    int quant;
    GregorianCalendar data_aggiunta;

    //public int getProdotto(){return prodotto;}
    public Prodotto getProdotto(){return prodotto;}
    public int getQuant(){return quant;}
    public GregorianCalendar getDataAggiunta(){return data_aggiunta;}

    //public void setProdotto(int prodotto){this.prodotto=prodotto;}
    public void setProdotto(Prodotto prodotto){this.prodotto=prodotto;}
    public void setQuant(int quant){this.quant=quant;}
    public void setDataAggiunta(GregorianCalendar c){this.data_aggiunta=c;}

}