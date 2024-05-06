package model.beans;

import java.util.ArrayList;
import java.util.Collection;


public class Carrello{

    private ArrayList<CartLine> prodotti = new ArrayList<CartLine>();
    private int utente;

    public Collection<CartLine> getProdotti(){return prodotti;}
    public int getUtente(){return utente;}

    public void setProdotti(Collection<CartLine> prodotti){this.prodotti=(ArrayList<CartLine>) prodotti;}
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