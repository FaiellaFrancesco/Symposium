package model.beans;

import java.util.ArrayList;


public class Carrello{

    private ArrayList<CartLine> prodotti;
    private int utente;
    
    public Carrello(){
    	prodotti = new ArrayList<CartLine>();
    }

    public ArrayList<CartLine> getProdotti(){return prodotti;}
    public int getUtente(){return utente;}

    public void setProdotti(ArrayList<CartLine> prodotti){this.prodotti=prodotti;}
    public void setUtente(int utente){this.utente=utente;}

    public void addProdotto(Prodotto prodotto){
        boolean out=true;
	    for (CartLine p : prodotti) {
	    	if(p.getProdotto().getId()==prodotto.getId()) {p.setQuant(p.getQuant()+1); out=false; break;}
	    }
        if(out){
            CartLine c=new CartLine();
            c.setProdotto(prodotto);
            c.setQuant(1);
            prodotti.add(c);
        }
    }

}