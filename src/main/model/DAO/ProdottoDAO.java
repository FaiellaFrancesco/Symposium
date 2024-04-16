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
	public Prodotto doRetrieveByKey(Integer  pk){
		
	}
	
}