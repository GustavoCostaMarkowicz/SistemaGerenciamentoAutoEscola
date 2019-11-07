package br.edu.ifpr.irati.jsp.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.criteria.Order;

/**
 * @param <T>
 */
public interface Dao<T> {

    public T buscarPorId(Serializable id);

    public void salvar(T t);

    public void alterar(T t);

    public void excluir(T t);

    public List<T> buscarTodos(Class<T> clazz);
    
    public T buscarResultadoExamesPorAlunoExame(int idPessoa, int idExame);
    
    public List<T> buscarResultadoExamesPorExame(int idExame);

    public List<T> buscarExamesPorAluno(int idPessoa);
    
    public List<T> buscarExamesPorData(String data1, String data2); 
    
}
