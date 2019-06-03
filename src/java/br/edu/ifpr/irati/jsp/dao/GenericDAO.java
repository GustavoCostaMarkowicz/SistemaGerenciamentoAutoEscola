package br.edu.ifpr.irati.jsp.dao;


import gerais.HibernateUtil;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * @param <T>
 */
public class GenericDAO<T> implements Dao<T> {

    private final Class classePersistente;

    public GenericDAO(Class classePersistente) {
        this.classePersistente = classePersistente;
    }

    @Override
    public T buscarPorId(Serializable id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        T t = (T) session.load(classePersistente, id);
        t.toString();
        session.clear();
        session.close();
        
        return t;
       
    }

    @Override
    public void salvar(T t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.save(t);

        session.getTransaction().commit();
        session.clear();
        session.close();
   
    }

    @Override
    public void alterar(T t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.update(t);

        session.getTransaction().commit();
        session.clear();
        session.close();
      
    }

    @Override
    public void excluir(T t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.delete(t);

        session.getTransaction().commit();
        session.clear();
        session.close();

    }

    @Override
    public List<T> buscarTodos(Class<T> clazz) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from " + clazz.getCanonicalName();
        Query query = session.createQuery(hql);
        List results = query.list();
        session.getTransaction().commit();
        session.clear();
        session.close();

        return results;
    }
    
    @Override
    public T buscarResultadoExamesPorAlunoExame(int idPessoa, int idExame){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from " + classePersistente.getCanonicalName()+" where aluno_idPessoa = "+idPessoa+" and exame_idExame = "+idExame;
        Query query = session.createQuery(hql);
        T t = (T) query.uniqueResult();
        session.getTransaction().commit();
        session.clear();
        session.close();
 
        return t;
    }
    
    @Override
    public List<T> buscarExamesPorAluno(int idPessoa){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from exame_aluno where alunos_idPessoa = "+idPessoa;
        Query query = session.createQuery(hql);
        List results = query.list();
        session.getTransaction().commit();
        session.clear();
        session.close();
   
        return results;
    }
    
    
    
}
