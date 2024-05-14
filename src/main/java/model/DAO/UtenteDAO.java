package model.DAO;

import model.beans.Utente;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class UtenteDAO implements DaoInterface<Utente, Integer> {

    private static final String TABLE_NAME = "utente";
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
    public Utente doRetrieveByKey(Integer pk) throws SQLException {
        Utente utente = null;
        String query = "SELECT * FROM " + TABLE_NAME + " WHERE id=?";
        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, pk);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    utente = new Utente();
                    setUtente(resultSet, utente);
                }
            }
        }
        return utente;
    }
    
    
    
    public Utente doRetrieveByUsr(String usr) throws SQLException {
        Utente utente = null;
        String query = "SELECT * FROM " + TABLE_NAME + " WHERE email=?";
        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, usr);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    utente = new Utente();
                    setUtente(resultSet, utente);
                }
            }
        }
        return utente;
    }

    @Override
    public Collection<Utente> doRetrieveAll(String order) throws SQLException {
        ArrayList<Utente> utenti = new ArrayList<>();
        String query = "SELECT * FROM " + TABLE_NAME;
        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Utente utente = new Utente();
                    setUtente(resultSet, utente);
                    utenti.add(utente);
                }
            }
        }
        return utenti;
    }

    @Override
    public void doSave(Utente utente) throws SQLException {
        String query = "INSERT INTO " + TABLE_NAME + " (nome, cognome, email, pw, telefono, data_nascita, amministratore, via, cap, citta, nome_carta, scadenza, numero_carta, cvv) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, utente.getNome());
            preparedStatement.setString(2, utente.getCognome());
            preparedStatement.setString(3, utente.getEmail());
            preparedStatement.setString(4, utente.getPw());
            preparedStatement.setString(5, utente.getTelefono());
            preparedStatement.setDate(6, new java.sql.Date(utente.getDataNascita().getTime()));
            preparedStatement.setBoolean(7, utente.isAmministratore());
            preparedStatement.setString(8, utente.getVia());
            preparedStatement.setString(9, utente.getCap());
            preparedStatement.setString(10, utente.getCitta());
            preparedStatement.setString(11, utente.getNomeCarta());
            preparedStatement.setDate(12, new java.sql.Date(utente.getScadenza().getTime()));
            preparedStatement.setString(13, utente.getNumeroCarta());
            preparedStatement.setString(14, utente.getCvv());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void doUpdate(Utente utente) throws SQLException {
        String query = "UPDATE " + TABLE_NAME + " SET nome=?, cognome=?, email=?, pw=?, telefono=?, data_nascita=?, amministratore=?, via=?, cap=?, citta=?, nome_carta=?, scadenza=?, numero_carta=?, cvv=? WHERE id=?";
        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, utente.getNome());
            preparedStatement.setString(2, utente.getCognome());
            preparedStatement.setString(3, utente.getEmail());
            preparedStatement.setString(4, utente.getPw());
            preparedStatement.setString(5, utente.getTelefono());
            preparedStatement.setDate(6, new java.sql.Date(utente.getDataNascita().getTime()));
            preparedStatement.setBoolean(7, utente.isAmministratore());
            preparedStatement.setString(8, utente.getVia());
            preparedStatement.setString(9, utente.getCap());
            preparedStatement.setString(10, utente.getCitta());
            preparedStatement.setString(11, utente.getNomeCarta());
            preparedStatement.setDate(12, new java.sql.Date(utente.getScadenza().getTime()));
            preparedStatement.setString(13, utente.getNumeroCarta());
            preparedStatement.setString(14, utente.getCvv());
            preparedStatement.setInt(15, utente.getId());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public boolean doDelete(Integer pk) throws SQLException {
        int result;
        String query = "DELETE FROM " + TABLE_NAME + " WHERE id=?";
        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, pk);
            result = preparedStatement.executeUpdate();
        }
        return result != 0;
    }


    private void setUtente(ResultSet resultSet, Utente utente) throws SQLException {
        utente.setId(resultSet.getInt("id"));
        utente.setNome(resultSet.getString("nome"));
        utente.setCognome(resultSet.getString("cognome"));
        utente.setEmail(resultSet.getString("email"));
        utente.setPw(resultSet.getString("pw"));
        utente.setTelefono(resultSet.getString("telefono"));
        utente.setDataNascita(resultSet.getDate("data_nascita"));
        utente.setAmministratore(resultSet.getBoolean("amministratore"));
        utente.setVia(resultSet.getString("via"));
        utente.setCap(resultSet.getString("cap"));
        utente.setCitta(resultSet.getString("citta"));
        utente.setNomeCarta(resultSet.getString("nome_carta"));
        utente.setScadenza(resultSet.getDate("scadenza"));
        utente.setNumeroCarta(resultSet.getString("numero_carta"));
        utente.setCvv(resultSet.getString("cvv"));
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> 7e2867c94c830f72c7c3657ac03f19e246a79da0
