package model.DAO;

import model.beans.Categoria;
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

public class CategoriaDAO implements DaoInterface<Categoria, String> {

    private static final String TABLE_NAME = "categoria";
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
    public Categoria doRetrieveByKey(String pk) throws SQLException {
        Categoria c = new Categoria();
        Connection connection = null;
        try {
            String query = "SELECT * FROM " + TABLE_NAME + " WHERE nome=?";
            connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, pk);

            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                setCategoria(rs, c);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (connection != null) {
                connection.close();
            }
        }

        return c;
    }

    @Override
    public Collection<Categoria> doRetrieveAll(String order) throws SQLException {
        ArrayList<Categoria> categorie = new ArrayList<>();
        Connection connection = null;
        try {
            String query = "SELECT * FROM " + TABLE_NAME;
            connection = ds.getConnection();

            if (order != null && !order.equals("")) {
                query += " ORDER BY " + order;
            }

            PreparedStatement statement = connection.prepareStatement(query);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Categoria c = new Categoria();
                setCategoria(rs, c);
                categorie.add(c);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (connection != null) {
                connection.close();
            }
        }

        return categorie;
    }

    @Override
    public void doSave(Categoria c) throws SQLException {
        String query = "INSERT INTO categoria (nome, descrizione) VALUES (?, ?)";
        Connection connection = null;
        try {
            connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            setCategoriaStatement(statement, c);
            statement.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    @Override
    public void doUpdate(Categoria c) throws SQLException {
        String query = "UPDATE categoria SET descrizione=? WHERE nome=?";
        Connection connection = null;
        try {
            connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, c.getDescrizione());
            statement.setString(2, c.getNome());
            statement.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    @Override
    public boolean doDelete(String pk) throws SQLException {
        int result;
        String query = "DELETE FROM " + TABLE_NAME + " WHERE nome = ?";
        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, pk);
            result = preparedStatement.executeUpdate();
        }
        return result != 0;
    }

    private void setCategoria(ResultSet rs, Categoria c) throws SQLException {
        c.setNome(rs.getString("nome"));
        c.setDescrizione(rs.getString("descrizione"));
    }

    private void setCategoriaStatement(PreparedStatement statement, Categoria c) throws SQLException {
        statement.setString(1, c.getNome());
        statement.setString(2, c.getDescrizione());
    }
}