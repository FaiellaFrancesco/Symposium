package model.DAO;

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


public class ProdottoDAO implements DaoInterface<Prodotto, Integer>{
	
	private static final String TABLE_NAME = "prodotto";
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
	public Prodotto doRetrieveByKey(Integer pk) throws SQLException {
		Prodotto p=new Prodotto();
		Connection connessione = null;
        try{
            String query="SELECT * FROM "+TABLE_NAME+" WHERE id=?;";
            connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            statement.setInt(1, pk.intValue());

            ResultSet rs=statement.executeQuery();

            while (rs.next()) {
                setProdotto(rs, p);
            }
        } catch(Exception e){
            throw e;
        }
        finally{
        	connessione.close();
        }
        
        return p;
	}

    @Override
    public Collection<Prodotto> doRetrieveAll(String order) throws SQLException{
        ArrayList<Prodotto> prodotti=new ArrayList<Prodotto>();
        Connection connessione = null;
        try{
            String query="SELECT * FROM "+TABLE_NAME;
            connessione=ds.getConnection();
            
            if (order != null && !order.equals("")) {
    			query += " ORDER BY " + order;
    		}
            
            
            PreparedStatement statement=connessione.prepareStatement(query);

            ResultSet rs=statement.executeQuery();
            
             while (rs.next()) {
                Prodotto p=new Prodotto();
                setProdotto(rs, p);
                prodotti.add(p);
            }
        }
        catch(Exception e){
            throw e;
        }
        finally{
        	connessione.close();
        }

        return prodotti;
    }
    
    public Collection<Prodotto> doRetrieveByType(String type) throws SQLException{
        ArrayList<Prodotto> prodotti=new ArrayList<Prodotto>();
        Connection connessione = null;
        try{
            String query="SELECT * FROM "+TABLE_NAME+" WHERE tipologia = ?";
            connessione=ds.getConnection();         
            
            PreparedStatement statement=connessione.prepareStatement(query);
            statement.setString(1, type);

            ResultSet rs=statement.executeQuery();
            
             while (rs.next()) {
                Prodotto p=new Prodotto();
                setProdotto(rs, p);
                prodotti.add(p);
            }
        }
        catch(Exception e){
            throw e;
        }
        finally{
        	connessione.close();
        }

        return prodotti;
    }
    
    public Collection<Prodotto> doRetrieveByPattern(String pattern) throws SQLException{
        ArrayList<Prodotto> prodotti=new ArrayList<Prodotto>();
        Connection connessione = null;
        try{
            String query="SELECT * FROM "+TABLE_NAME+" WHERE nome LIKE ?";
            connessione=ds.getConnection();         
            
            PreparedStatement statement=connessione.prepareStatement(query);
            statement.setString(1, pattern+"%");

            ResultSet rs=statement.executeQuery();
            
             while (rs.next()) {
                Prodotto p=new Prodotto();
                setProdotto(rs, p);
                prodotti.add(p);
            }
        }
        catch(Exception e){
            throw e;
        }
        finally{
        	connessione.close();
        }

        return prodotti;
    }
    
    @Override
    public void doSave(Prodotto p) throws SQLException{
        String query="INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection connessione=null;
        try{
            connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            setProdottoStatement(statement, p);
            statement.executeUpdate();
        }
        catch (Exception e){ throw e;}
        finally{
        	connessione.close();
        }
    }

    @Override
    public void doUpdate(Prodotto p) throws SQLException {
        String query="UPDATE prodotto SET nome=?, prezzo=?, iva=?, descrizione=?, immagine=?, stock=?, alcol=?, formato=?, provenienza=?, tipologia=?, annata=?, denominazione=? WHERE id=?;";
        Connection connessione=null;
        try{
            connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            setProdottoStatement(statement, p);
            statement.setInt(13, p.getId());
            statement.executeUpdate();
        }
        catch(Exception e){throw e;}
        finally{
        	connessione.close();
        }
    }

    @Override
    public boolean doDelete(Integer pk) throws SQLException {
        int result;
        String query = "DELETE FROM " + TABLE_NAME + " WHERE ID = ?";
        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, pk.intValue());
            result = preparedStatement.executeUpdate();
        }
        return result != 0;
    }

    private void setProdotto(ResultSet rs, Prodotto p) throws SQLException{
        p.setId(rs.getInt("id"));
        p.setNome(rs.getString("nome"));
        p.setPrezzo(rs.getDouble("prezzo"));
        p.setIva(rs.getInt("iva"));
        p.setDescrizione(rs.getString("descrizione"));
        p.setImmagine(rs.getString("immagine"));
        p.setStock(rs.getInt("stock"));
        p.setAlcol(rs.getInt("alcol"));
        p.setFormato(rs.getDouble("formato"));
        p.setProvenienza(rs.getString("provenienza"));
        p.setTipologia(rs.getString("tipologia"));
        p.setAnnata(rs.getInt("annata"));
        p.setDenominazione(rs.getString("denominazione"));
    }

    private void setProdottoStatement(PreparedStatement statement, Prodotto p) throws SQLException{
        statement.setString(1, p.getNome());
        statement.setDouble(2, p.getPrezzo());
        statement.setInt(3, p.getIva());
        statement.setString(4, p.getDescrizione());
        statement.setString(5, p.getImmagine());
        statement.setInt(6, p.getStock());
        statement.setDouble(7, p.getAlcol());
        statement.setDouble(8, p.getFormato());
        statement.setString(9, p.getProvenienza());
        statement.setString(10, p.getTipologia());
        statement.setInt(11, p.getAnnata());
        statement.setString(12, p.getDenominazione());
    }
	
}