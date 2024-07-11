package model.DAO;

import model.beans.OrderLine;
import model.beans.Ordine;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class OrdineDAO implements DaoInterface<Ordine, Integer>{

    private static final String TABLE_NAME = "ordine";
    private static final DataSource ds;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/Symposium");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    public Ordine doRetrieveByKey(Integer pk) throws SQLException{
        Ordine ordine=new Ordine();
        ordine.setId(pk.intValue());
        Connection connessione=null;
        try{
            String query="SELECT * FROM "+TABLE_NAME+" WHERE id=?;";
            connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            statement.setInt(1, pk.intValue());

            ResultSet rs=statement.executeQuery();

            if(rs.next()){
                ordine.setId(rs.getInt("id"));
                ordine.setData(new GregorianCalendar());
                ordine.getData().setTime(rs.getDate("data_ordine"));
                ordine.setStato(rs.getInt("stato"));
                ordine.setCitta(rs.getString("citta"));
                ordine.setVia(rs.getString("via"));
                ordine.setCAP(rs.getString("cap"));
                ordine.setUtente(rs.getInt("utente"));
                ArrayList<OrderLine> prodotti=new ArrayList<>();


                String query1="SELECT * FROM element WHERE ordine=?";
                PreparedStatement statement1=connessione.prepareStatement(query1);
                statement1.setInt(1, pk.intValue());

                ResultSet rs1=statement1.executeQuery();
                while(rs1.next()){
                    OrderLine ol=new OrderLine();
                    ProdottoDAO pdao=new ProdottoDAO();
                    ol.setProdotto(pdao.doRetrieveByKey(rs1.getInt("prodotto")));
                    ol.setIva(rs1.getInt("iva"));
                    ol.setQuant(rs1.getInt("quantita"));
                    ol.setPrezzo(rs1.getDouble("prezzo"));
                    ol.setNome(rs1.getString("nome"));
                    prodotti.add(ol);
                }
                ordine.setProdotti(prodotti);
            }
        } catch(Exception e){
            throw e;
        }
        finally{
        	connessione.close();
        }

        return ordine;
    }
    
    public ArrayList<Ordine> doRetrieveByUsr(Integer pk) throws SQLException{
        ArrayList<Ordine> ordini = new ArrayList<Ordine>();
        Connection connessione=null;
        try{
            String query="SELECT * FROM "+TABLE_NAME+" WHERE utente=?;";
            connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            statement.setInt(1, pk.intValue());

            ResultSet rs=statement.executeQuery();

            
            while(rs.next()){
            	Ordine ordine = new Ordine();
                ordine.setId(rs.getInt("id"));
                ordine.setData(new GregorianCalendar());
                ordine.getData().setTime(rs.getDate("data_ordine"));
                ordine.setStato(rs.getInt("stato"));
                ordine.setCitta(rs.getString("citta"));
                ordine.setVia(rs.getString("via"));
                ordine.setCAP(rs.getString("cap"));
                ordine.setUtente(rs.getInt("utente"));
                ArrayList<OrderLine> prodotti = new ArrayList<OrderLine>();
                
                String query1="SELECT * FROM element WHERE ordine=?";
                PreparedStatement statement1=connessione.prepareStatement(query1);
                statement1.setInt(1, ordine.getId());
                
                ResultSet rs1=statement1.executeQuery();
                while(rs1.next()){
                    OrderLine ol=new OrderLine();
                    ProdottoDAO pdao=new ProdottoDAO();
                    ol.setProdotto(pdao.doRetrieveByKey(rs1.getInt("prodotto")));
                    ol.setIva(rs1.getInt("iva"));
                    ol.setQuant(rs1.getInt("quantita"));
                    ol.setPrezzo(rs1.getDouble("prezzo"));
                    ol.setNome(rs1.getString("nome"));
                    prodotti.add(ol);
                }
                ordine.setProdotti(prodotti);
                ordini.add(ordine); 
            }
        } catch(Exception e){
            throw e;
        }
        finally{
        	connessione.close();
        }
        return ordini;
    }
    

    public Collection<Ordine> doRetrieveAll(String order) throws SQLException {
        Collection<Ordine> ordini = new ArrayList<>();
        Connection connessione = null;
        try {
            String query = "SELECT * FROM " + TABLE_NAME + " ORDER BY " + order;
            connessione = ds.getConnection();
            PreparedStatement statement = connessione.prepareStatement(query);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Ordine ordine = new Ordine();
                ordine.setId(rs.getInt("id"));
                ordine.setData(new GregorianCalendar());
                ordine.getData().setTime(rs.getDate("data_ordine"));
                ordine.setStato(rs.getInt("stato"));
                ordine.setCitta(rs.getString("citta"));
                ordine.setVia(rs.getString("via"));
                ordine.setCAP(rs.getString("cap"));
                ordine.setUtente(rs.getInt("utente"));
                ordine.setProdotti(new ArrayList<OrderLine>());

                String query1 = "SELECT * FROM element WHERE ordine = ?";
                PreparedStatement statement1 = connessione.prepareStatement(query1);
                statement1.setInt(1, ordine.getId());

                ResultSet rs1 = statement1.executeQuery();
                while (rs1.next()) {
                    OrderLine ol = new OrderLine();
                    ProdottoDAO pdao=new ProdottoDAO();
                    ol.setProdotto(pdao.doRetrieveByKey(rs1.getInt("prodotto")));
                    ol.setIva(rs1.getInt("iva"));
                    ol.setQuant(rs1.getInt("quantita"));
                    ol.setPrezzo(rs1.getDouble("prezzo"));
                    ol.setNome(rs1.getString("nome"));
                    ordine.getProdotti().add(ol);
                }
                ordini.add(ordine);
            }
        } finally {
            if (connessione != null) {
                connessione.close();
            }
        }

        return ordini;
    }

    @Override
    public void doSave(Ordine ordine) throws SQLException {
        Connection connessione = null;
        try {
            connessione = ds.getConnection();
            connessione.setAutoCommit(false); // Start transaction

            // Insert order into the "ordine" table
            String ordineQuery = "INSERT INTO " + TABLE_NAME + " (data_ordine, stato, citta, via, cap, utente) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ordineStatement = connessione.prepareStatement(ordineQuery, Statement.RETURN_GENERATED_KEYS);

            ordineStatement.setDate(1, new java.sql.Date(ordine.getData().getTimeInMillis()));
            ordineStatement.setInt(2, ordine.getStato());
            ordineStatement.setString(3, ordine.getCitta());
            ordineStatement.setString(4, ordine.getVia());
            ordineStatement.setString(5, ordine.getCAP());
            ordineStatement.setInt(6, ordine.getUtente());

            ordineStatement.executeUpdate();

            ResultSet generatedKeys = ordineStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                ordine.setId(generatedKeys.getInt(1));
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }

            // Insert products into the "element" table
            String elementQuery = "INSERT INTO element (ordine, prodotto, prezzo, iva, quantita, nome) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement elementStatement = connessione.prepareStatement(elementQuery);

            for (OrderLine ol : ordine.getProdotti()) {
                elementStatement.setInt(1, ordine.getId());
                elementStatement.setInt(2, ol.getProdotto().getId());
                elementStatement.setDouble(3, ol.getPrezzo());
                elementStatement.setInt(4, ol.getIva());
                elementStatement.setInt(5, ol.getQuant());
                elementStatement.setString(6, ol.getNome());
                elementStatement.executeUpdate();
            }

            connessione.commit(); // Commit transaction
        } catch (SQLException e) {
            if (connessione != null) {
                try {
                    connessione.rollback(); // Rollback transaction in case of error
                } catch (SQLException rollbackException) {
                    throw new SQLException("Failed to rollback transaction", rollbackException);
                }
            }
            throw e; // Re-throw the original exception
        } finally {
            if (connessione != null) {
                connessione.setAutoCommit(true); // Reset auto-commit to true
                connessione.close();
            }
        }
    }

    @Override
    public void doUpdate(Ordine ordine) throws SQLException {
        Connection connessione = null;
        try {
            String query = "UPDATE " + TABLE_NAME + " SET data_ordine = ?, stato = ?, citta = ?, via = ?, cap = ?, utente = ? WHERE id = ?";
            connessione = ds.getConnection();
            PreparedStatement statement = connessione.prepareStatement(query);

            statement.setDate(1, new java.sql.Date(ordine.getData().getTimeInMillis()));
            statement.setInt(2, ordine.getStato());
            statement.setString(3, ordine.getCitta());
            statement.setString(4, ordine.getVia());
            statement.setString(5, ordine.getCAP());
            statement.setInt(6, ordine.getUtente());
            statement.setInt(7, ordine.getId());

            statement.executeUpdate();
        } finally {
            if (connessione != null) {
                connessione.close();
            }
        }
    }

    @Override
    public boolean doDelete(Integer pk) throws SQLException {
        Connection connessione = null;
        try {
            connessione = ds.getConnection();
            connessione.setAutoCommit(false); // Inizia la transazione

            // Cancellazione degli elementi dell'ordine
            String deleteElementsQuery = "DELETE FROM element WHERE ordine = ?";
            PreparedStatement deleteElementsStatement = connessione.prepareStatement(deleteElementsQuery);
            deleteElementsStatement.setInt(1, pk);
            deleteElementsStatement.executeUpdate();

            // Cancellazione dell'ordine stesso
            String deleteOrderQuery = "DELETE FROM " + TABLE_NAME + " WHERE id = ?";
            PreparedStatement deleteOrderStatement = connessione.prepareStatement(deleteOrderQuery);
            deleteOrderStatement.setInt(1, pk);

            int affectedRows = deleteOrderStatement.executeUpdate();
            connessione.commit(); // Conferma la transazione

            return affectedRows > 0;
        } catch (SQLException e) {
            if (connessione != null) {
                try {
                    connessione.rollback(); // Rollback della transazione in caso di errore
                } catch (SQLException rollbackException) {
                    throw new SQLException("Failed to rollback transaction", rollbackException);
                }
            }
            throw e; // Rilancia l'eccezione originale
        } finally {
            if (connessione != null) {
                connessione.setAutoCommit(true); // Ripristina l'autocommit a true
                connessione.close();
            }
        }
    }


}
