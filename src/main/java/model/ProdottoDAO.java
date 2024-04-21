package model;

import model.beans.Prodotto;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;
import java.util.*;


public class ProdottoDAO implements DaoInterface<Prodotto, Integer>{
	
	private static final String TABLE_NAME = "Prodotto";
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
		Connection conn = null;
		PreparedStatement st = null;
		Prodotto bean = new Prodotto();
		String query = "SELECT nome,prezzo,descrizione FROM " + ProdottoDAO.TABLE_NAME + " WHERE CODE = ?";
		
		try{
			conn = ds.getConnection();
			st = conn.prepareStatement(query);
			st.setInt(1, pk.intValue());
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
			}
		} finally {
			try {
				if (st != null)
				st.close();
			} finally {
				if (conn != null)
				conn.close();
			}
		}
	return bean;
		
		
	}

	@Override
	public Collection<Prodotto> doRetrieveAll(String order) throws SQLException {
		Connection conn = null;
		PreparedStatement st = null;
		String query = "SELECT nome,prezzo,descrizione,immagine FROM " + ProdottoDAO.TABLE_NAME;
		ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
		
		if (order != null && !order.equals("")) {
			query += " ORDER BY " + order;
		}
		
		try{
			conn = ds.getConnection();
			st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();		
			while(rs.next()) {
				Prodotto bean = new Prodotto();
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setImmagine(rs.getString("immagine"));
				prodotti.add(bean);
			}
		} finally {
			try {
				if (st != null)
				st.close();
			} finally {
				if (conn != null)
				conn.close();
			}
		}
	return prodotti;
	}

	@Override
	public void doSave(Prodotto product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Prodotto product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Integer pk) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
}