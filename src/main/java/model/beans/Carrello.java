package model.beans;

import java.util.ArrayList;


public class Carrello{

    private ArrayList<CartLine> prodotti;
    private int utente;
    
    public Carrello(){
    	prodotti = new ArrayList<CartLine>();
    }
    
    public void removeProdotto(Prodotto prod) {
    	for (CartLine p : prodotti) {
    		if(p.getProdotto().getId()==prod.getId()) {
    			prodotti.remove(p);
    			break;
    		}
    	}
    }
    public ArrayList<CartLine> getProdotti(){return prodotti;}
    public int getUtente(){return utente;}

    public void setProdotti(ArrayList<CartLine> prodotti){this.prodotti=prodotti;}
    public void setUtente(int utente){this.utente=utente;}

    public void addProdotto(Prodotto prodotto, int quant){
        boolean out=true;
	    for (CartLine p : prodotti) {
	    	if(p.getProdotto().getId()==prodotto.getId()) {p.setQuant(p.getQuant()+quant); out=false; break;}
	    }
        if(out){
            CartLine c=new CartLine();
            c.setProdotto(prodotto);
            c.setQuant(quant);
            prodotti.add(c);
        }
    }

}