package model.DAO;

import model.beans.Carrello;
import model.beans.CartLine;
import model.beans.Prodotto;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


public class CarrelloDAO implements DaoInterface<Carrello, Integer>{
	
	private static final String TABLE_NAME = "cart_line";
    private static final DataSource ds;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/Symposium");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }


	@Override
	public Carrello doRetrieveByKey(Integer pk) throws SQLException {
		Carrello cart=new Carrello();
        cart.setUtente(pk.intValue());
        //cart.setProdotti(new ArrayList<CartLine>());
        try{
            String query="SELECT * FROM "+TABLE_NAME+" WHERE utente=?;";
            Connection connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            statement.setInt(1, pk.intValue());

            ResultSet rs=statement.executeQuery();

            while (rs.next()) {
                CartLine cl=new CartLine();
                //cl.setProdotto(rs.getInt("prodotto"));
                cl.setProdotto((Prodotto)rs.getObject("prodotto"));
                cl.setQuant(rs.getInt("quantita"));
                cl.setDataAggiunta(new GregorianCalendar());
                cl.getDataAggiunta().setTime(rs.getDate("data_aggiunta"));
                cart.getProdotti().add(cl);
            }
        } catch(Exception e){
            throw e;
        }

        return cart;
	}

    @Override
    public Collection<Carrello> doRetrieveAll(String order) throws SQLException{
        //inutile
        return null;
    }
    
    @Override
    public void doSave(Carrello cart) throws SQLException{

        for (CartLine c : cart.getProdotti()) {
            String query="INSERT INTO cart_line (prodotto, utente, quantita, data_aggiunta) VALUES (?, ?, ?, ?);";
            try{
                Connection connessione=ds.getConnection();
                PreparedStatement statement=connessione.prepareStatement(query);
                statement.setInt(2, cart.getUtente());
                //statement.setInt(1, c.getProdotto());
                statement.setInt(1, c.getProdotto().getId());
                statement.setInt(3, c.getQuant());
                statement.setDate(4, new java.sql.Date(c.getDataAggiunta().getTime().getTime()));
                statement.executeUpdate();
            }
            catch (Exception e){ throw e;}
        }
    }

    @Override
    public void doUpdate(Carrello cart) throws SQLException {

        //Controllo se devo fare save o update.
        boolean cartLinesExist = false;
        String query = "SELECT * FROM cart_line WHERE utente=?";
        try{
            Connection connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            statement.setInt(1, cart.getUtente());
            
            try (ResultSet resultSet = statement.executeQuery()) {
                // Se il risultato contiene almeno una riga, allora ci sono cartLine associate all'utente
                if (resultSet.next()) cartLinesExist = true;
           }
        }catch(Exception e){return;}
        if(cartLinesExist){ //se esiste lo cancello
            if(!doDelete(Integer.valueOf(cart.getUtente()))) return;
        }
        doSave(cart); //lo aggiorno (o lo creo)
    }

    @Override
    public boolean doDelete(Integer pk) throws SQLException {
        int result;
        String query = "DELETE FROM " + TABLE_NAME + " WHERE utente=?";
        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, pk.intValue());
            result = preparedStatement.executeUpdate();
        }
        return result != 0;
    }
	
}