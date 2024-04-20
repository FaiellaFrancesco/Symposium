package model.DAO;

import model.Beans.Prodotto;
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
            Context init = new InitialContext();
            Context env = (Context) init.lookup("java:comp/env");

            ds = (DataSource) env.lookup("jdbc/Symposium");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

	@Override
	public Prodotto doRetrieveByKey(Integer pk) throws SQLException {
		Prodotto p=new Prodotto();
        try{
            String query="SELECT * FROM "+TABLE_NAME+" WHERE id=?;";
            Connection connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            statement.setInt(1, pk.intValue());

            ResultSet rs=statement.executeQuery();

            while (rs.next()) {
                setProdotto(rs, p);
            }
        } catch(Exception e){
            throw e;
        }

        return p;
	}

    @Override
    public Collection<Prodotto> doRetriveAll(String order) throws SQLException{
        ArrayList<Prodotto> prodotti=new ArrayList<Prodotto>();
        try{
            String query="SELECT * FROM "+TABLE_NAME+" ORDER BY ?;";
            Connection connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            statement.setString(1, order);

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

        return prodotti;
    }
    
    @Override
    public void doSave(Prodotto p) throws SQLException{
        String query="INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione) VALUES (?, ?, ?, ?, null, ?, ?, ?, ?, ?, ?, ?);";
        try{
            Connection connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            setMagliettaStatement(statement, p);
            statement.executeUpdate();
        }
        catch (Exception e){ throw e;}
    }

    @Override
    public void doUpdate(Prodotto p) throws SQLException {
        String query="UPDATE prodotto SET nome=?, prezzo=?, iva=?, descrizione=?, immagine=null, stock=?, alcol=?, formato=?, provenienza=?, tipologia=?, annata=?, denominazione=? WHERE id=?;";
        try{
            Connection connessione=ds.getConnection();
            PreparedStatement statement=connessione.prepareStatement(query);
            setMagliettaStatement(statement, p);
            statement.setInt(12, p.getId());
            preparedStatement.executeUpdate();
        }
        catch(Exception e){throw e;}
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

    private void setProdotto(ResultSet rs, Prodotto p){
        p.setId(rs.getInt("id"));
        p.setNome(rs.getString("nome"));
        p.setPrezzo(rs.getDouble("prezzo"));
        p.setIva(rs.getInt("iva"));
        p.setDescrizione(rs.getString("descrizione"));
        p.setStock(rs.getInt("stock"));
        p.getAlcol(rs.getInt("alcol"));
        p.getFormato(rs.getDouble("formato"));
        p.getProvenienza(rs.getString("provenienza"));
        p.getTipologia(rs.getString("tipologia"));
        p.getAnnata(rs.getInt("annata"));
        p.getDenominazione(rs.getString("denominazione"));
    }

    private void setMagliettaStatement(PreparedStatement statement, Prodotto p){
        statement.setString(1, p.getNome());
        statement.setDouble(2, p.getPrezzo());
        statement.setInt(3, p.getIva());
        statement.setString(4, p.getDescrizione());
        statement.setInt(5, p.getStock());
        statement.setDouble(6, p.getAlcol());
        statement.setDouble(7, p.getFormato());
        statement.setString(8, p.getProvenienza());
        statement.setString(9, p.getTipologia());
        statement.setInt(10, p.getAnnata());
        statement.setString(11, p.getDenominazione());
    }
	
}