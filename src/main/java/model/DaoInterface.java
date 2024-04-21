package model;

import java.sql.SQLException;
import java.util.Collection;

public interface DaoInterface<T, K> {
    T doRetrieveByKey(K pk) throws SQLException;
    Collection<T> doRetrieveAll(String order) throws SQLException;
    void doSave(T product) throws SQLException;
    void doUpdate(T product) throws SQLException;
    boolean doDelete(K pk) throws SQLException;
}