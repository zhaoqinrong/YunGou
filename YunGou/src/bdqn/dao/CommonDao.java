package bdqn.dao;

import java.io.Serializable;
import java.util.List;

public interface CommonDao<T> {
    List<T> getAll() ;
    int add(T t);
    int update(T t);
    int delete(Serializable id);
}
