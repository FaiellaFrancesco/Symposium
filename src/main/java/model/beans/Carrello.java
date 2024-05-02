package model.beans;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

public class Carrello{

    private ArrayList<CartLine> prodotti;
    private int utente;

    public Collection<CartLine> getProdotti(){return prodotti;}
    public int getUtente(){return utente;}

    public void setProdotti(Collection prodotti){this.prodotti=(ArrayList) prodotti;}
    public void setUtente(int utente){this.utente=utente;}

    public void addProdotto(int prodotto){
        boolean out=true;
        for (CartLine p : prodotti) {
            if(p.getProdotto()==prodotto) {p.setQuant(p.getQuant()+1); out=false;}
        }
        if(out){
            CartLine c=new CartLine();
            c.setProdotto(prodotto);
            c.setQuant(1);
            prodotti.add(c);
        }
    }

}