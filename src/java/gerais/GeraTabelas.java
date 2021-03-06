package gerais;

import br.edu.ifpr.irati.jsp.util.GerarDadosPadrao;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

/**
 *
 * @author valter
 */
public class GeraTabelas {

    public static void main(String arg[]) {
        //cria uma configuracao
        AnnotationConfiguration cfg = new AnnotationConfiguration();
        //hibernate.cfg.xml 
        cfg.configure();
        //Responsável pela criação do schema e execução
        SchemaExport export = new SchemaExport(cfg);
        export.create(true, true);
        
        GerarDadosPadrao gdp = new GerarDadosPadrao();
        gdp.gerarDados();
        
        System.exit(0);
        
    }
}
