package br.edu.ifpr.irati.jsp.itext;

import br.edu.ifpr.irati.jsp.controle.ControleAluno;
import br.edu.ifpr.irati.jsp.controle.ControleExameMedico;
import br.edu.ifpr.irati.jsp.controle.ControleExamePratico;
import br.edu.ifpr.irati.jsp.controle.ControleExamePsicotecnico;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.ExameMedico;
import br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico;
import br.edu.ifpr.irati.jsp.modelo.Registro;
import br.edu.ifpr.irati.jsp.util.GerarNumeroExtenso;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfDocument;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.control.Cell;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class gerarPdf extends HttpServlet {

    public void gerarPdfAluno(HttpServletRequest request, HttpServletResponse response, int idAluno)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        try {

            Document document = new Document();

            OutputStream outs = response.getOutputStream();
            PdfWriter.getInstance(document, outs);

            ControleAluno ca = new ControleAluno();
            Aluno a = ca.buscarAlunosPorId(idAluno);

            document.open();

            Font fonteTimes = FontFactory.getFont(FontFactory.TIMES_ROMAN);
            fonteTimes.setColor(BaseColor.BLACK);
            fonteTimes.setStyle("bold");
            fonteTimes.setSize(30);

            Paragraph p = new Paragraph(new Phrase("Ficha de Matrícula", fonteTimes));
            p.setAlignment(1);
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);
            p = new Paragraph("   ");
            document.add(p);

            Font fonteTodos = FontFactory.getFont(FontFactory.TIMES_ROMAN);
            fonteTodos.setSize(13);

            Font fonteTit = FontFactory.getFont(FontFactory.TIMES_ROMAN);
            fonteTit.setSize(15);
            fonteTit.setStyle("bold");

            p = new Paragraph(new Phrase("DADOS PESSOAIS", fonteTit));
            p.setAlignment(1);
            document.add(p);

            p = new Paragraph(new Phrase("Nome Completo: " + a.getNomeCompleto() + "                         Número do Processo: " + a.getProcesso(), fonteTodos));
            document.add(p);

            p = new Paragraph(new Phrase("CPF: " + a.getCpf() + "                               RG: " + a.getRg() + "                               UF: " + a.getUf(), fonteTodos));

            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            p = new Paragraph(new Phrase("Órgão Emissor do RG: " + a.getOrgaoRg() + "            Data de Nascimento: " + sdf.format(a.getDataNascimento()) + "               Sexo: " + a.getSexo(), fonteTodos));
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            p = new Paragraph(new Phrase("Nome do Pai: " + a.getNomePai() + "                   Nome da Mãe: " + a.getNomeMae(), fonteTodos));
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            p = new Paragraph(new Phrase("DADOS DE MORADIA", fonteTit));
            p.setAlignment(1);
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            p = new Paragraph(new Phrase("Cidade: " + a.getCidade() + "             Estado: " + a.getEstado() + "               Endereço: " + a.getEndereco(), fonteTodos));
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            p = new Paragraph(new Phrase("Número: " + a.getNumero() + "          Complemento: " + a.getComplemento() + "             CEP: " + a.getCep() + "           Bairro: " + a.getBairro(), fonteTodos));
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            p = new Paragraph(new Phrase("DADOS ADICIONAIS", fonteTit));
            p.setAlignment(1);
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            p = new Paragraph(new Phrase("Estado Civil: " + a.getEstadoCivil() + "                          Grau de Instrução: " + a.getGrauInstrucao(), fonteTodos));
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            p = new Paragraph(new Phrase("Naturalidade: " + a.getNaturalidade() + "                         Nacionalidade: " + a.getNacionalidade(), fonteTodos));
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            String doador = "";
            if (a.isDoadorOrgaos()) {
                doador = "Sim";
            } else {
                doador = "Não";
            }
            p = new Paragraph(new Phrase("Doador de Órgãos: " + doador + "                      Tipo Sanguíneo: " + a.getTipoSanguineo(), fonteTodos));
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            p = new Paragraph(new Phrase("DADOS PARA CONTATO", fonteTit));
            p.setAlignment(1);
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            String tel = "";
            String telc = "";
            String email = "";
            if (a.getTelefone() != null) {
                tel = a.getTelefone();
            }
            if (a.getTelefoneCelular() != null) {
                telc = a.getTelefoneCelular();
            }
            if (a.getEmail() != null) {
                email = a.getEmail();
            }

            p = new Paragraph(new Phrase("Telefone: " + tel + "             Telefone Celular: " + telc + "                Email: " + email));
            document.add(p);

            p = new Paragraph("   ");
            document.add(p);

            p = new Paragraph(new Phrase("ANOTAÇÕES", fonteTit));
            p.setAlignment(1);
            document.add(p);

            p = new Paragraph(new Phrase("______________________________________________________________________________"));
            document.add(p);

            p = new Paragraph(new Phrase("______________________________________________________________________________"));
            document.add(p);

            p = new Paragraph(new Phrase("______________________________________________________________________________"));
            document.add(p);

            p = new Paragraph(new Phrase("______________________________________________________________________________"));
            document.add(p);

            p = new Paragraph(new Phrase("______________________________________________________________________________"));
            document.add(p);

            p = new Paragraph(new Phrase("______________________________________________________________________________"));
            document.add(p);

            document.close();
        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
        }

    }

    public void gerarPdfExameMedico(HttpServletRequest request, HttpServletResponse response, String sdata)
            throws ServletException, IOException, ParseException {

        response.setContentType("application/pdf");
        try {

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
            Date data = sdf.parse(sdata);

            ControleExameMedico cem = new ControleExameMedico();
            List<ExameMedico> ems = cem.buscarExamePorData(data);

            int flag = 0;
            int i = 0;
            int j = 0;
            int idExa[] = new int[ems.size()];
            while (i <= ems.size() - 1) {
                Date dataMenor = sdf2.parse("23:59");
                for (ExameMedico em : ems) {

                    if (dataMenor.after(em.getHorarioExame())) {
                        while (j <= idExa.length - 1) {
                            if (idExa[j] == em.getIdExame()) {
                                flag++;
                            }
                            j++;
                        }

                        if (flag == 0) {
                            dataMenor = em.getHorarioExame();
                            idExa[i] = em.getIdExame();
                        }

                    }
                    j = 0;
                    flag = 0;

                }
                i++;

            }

            Document document = new Document();

            OutputStream outs = response.getOutputStream();
            PdfWriter.getInstance(document, outs);

            document.open();

            PdfPTable tabela = new PdfPTable(new float[]{2.5f, 5f, 5f, 5f, 6f});

            PdfPCell cabecalho = new PdfPCell(new Paragraph("EXAMES MÉDICOS MARCADOS PARA O DIA: " + sdf.format(data)));

            cabecalho.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho.setBorder(PdfPCell.BOX);
            cabecalho.setBackgroundColor(new BaseColor(255, 191, 0));
            cabecalho.setColspan(7);
            tabela.setWidthPercentage(96);
            tabela.addCell(cabecalho);

            PdfPCell celulaHorario = new PdfPCell(new Phrase("Horário"));
            celulaHorario.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaHorario.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaMed = new PdfPCell(new Phrase("Médico"));
            celulaMed.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaMed.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaClin = new PdfPCell(new Phrase("Clínica"));
            celulaClin.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaClin.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaTipoExMed = new PdfPCell(new Phrase("Tipo do Exame Médico"));
            celulaTipoExMed.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaTipoExMed.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaAluno = new PdfPCell(new Phrase("Aluno"));
            celulaAluno.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaAluno.setBackgroundColor(new BaseColor(245, 222, 179));

            tabela.addCell(celulaHorario);
            tabela.addCell(celulaMed);
            tabela.addCell(celulaClin);
            tabela.addCell(celulaTipoExMed);
            tabela.addCell(celulaAluno);

            for (int a = 0; a < idExa.length; a++) {

                ExameMedico em = cem.buscarExameMedicosPorId(idExa[a]);

                PdfPCell ca = new PdfPCell(new Phrase(sdf2.format(em.getHorarioExame())));
                ca.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cb = new PdfPCell(new Phrase(em.getMedico()));
                cb.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cc = new PdfPCell(new Phrase(em.getClinica()));
                cc.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell ct = new PdfPCell(new Phrase(em.getTipoExameMedico()));
                cc.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cd = new PdfPCell(new Phrase(em.getAlunos().get(0).getNomeCompleto()));
                cd.setHorizontalAlignment(Element.ALIGN_CENTER);

                tabela.addCell(ca);
                tabela.addCell(cb);
                tabela.addCell(cc);
                tabela.addCell(ct);
                tabela.addCell(cd);

            }

            document.add(tabela);
            document.close();

        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
        }

    }

    public void gerarPdfExamePsicoTecnico(HttpServletRequest request, HttpServletResponse response, String sData)
            throws ServletException, IOException, ParseException {

        response.setContentType("application/pdf");
        try {

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
            Date data = sdf.parse(sData);

            ControleExamePsicotecnico cep = new ControleExamePsicotecnico();
            List<ExamePsicotecnico> eps = cep.buscarExamePorData(data);

            int flag = 0;
            int i = 0;
            int j = 0;
            int idExa[] = new int[eps.size()];
            while (i <= eps.size() - 1) {
                Date dataMenor = sdf2.parse("23:59");
                for (ExamePsicotecnico ep : eps) {

                    if (dataMenor.after(ep.getHorarioExame())) {
                        while (j <= idExa.length - 1) {
                            if (idExa[j] == ep.getIdExame()) {
                                flag++;
                            }
                            j++;
                        }

                        if (flag == 0) {
                            dataMenor = ep.getHorarioExame();
                            idExa[i] = ep.getIdExame();
                        }

                    }
                    j = 0;
                    flag = 0;

                }
                i++;

            }

            Document document = new Document();

            OutputStream outs = response.getOutputStream();
            PdfWriter.getInstance(document, outs);

            document.open();

            PdfPTable tabela = new PdfPTable(new float[]{2.5f, 5f, 5f, 6f, 5f});

            PdfPCell cabecalho = new PdfPCell(new Paragraph("EXAMES PSICOLÓGICOS MARCADOS PARA O DIA: " + sdf.format(data)));

            cabecalho.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho.setBorder(PdfPCell.BOX);
            cabecalho.setBackgroundColor(new BaseColor(255, 191, 0));
            cabecalho.setColspan(7);
            tabela.setWidthPercentage(96);
            tabela.addCell(cabecalho);

            PdfPCell celulaHorario = new PdfPCell(new Phrase("Horário"));
            celulaHorario.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaHorario.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaMed = new PdfPCell(new Phrase("Psicólogo"));
            celulaMed.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaMed.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaClin = new PdfPCell(new Phrase("Clínica"));
            celulaClin.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaClin.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaAluno = new PdfPCell(new Phrase("Aluno"));
            celulaAluno.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaAluno.setBackgroundColor(new BaseColor(245, 222, 179));

            tabela.addCell(celulaHorario);
            tabela.addCell(celulaMed);
            tabela.addCell(celulaClin);
            tabela.addCell(celulaAluno);

            for (int a = 0; a < idExa.length; a++) {

                ExamePsicotecnico ep = cep.buscarExamePsicotecnicosPorId(idExa[a]);

                PdfPCell ca = new PdfPCell(new Phrase(sdf2.format(ep.getHorarioExame())));
                ca.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cb = new PdfPCell(new Phrase(ep.getPsicologo()));
                cb.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cc = new PdfPCell(new Phrase(ep.getClinica()));
                cc.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cd = new PdfPCell(new Phrase(ep.getAlunos().get(0).getNomeCompleto()));
                cd.setHorizontalAlignment(Element.ALIGN_CENTER);

                tabela.addCell(ca);
                tabela.addCell(cb);
                tabela.addCell(cc);
                tabela.addCell(cd);

            }

            document.add(tabela);
            document.close();

        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
        }

    }

    public void gerarPdfRecibo(HttpServletRequest request, HttpServletResponse response, Registro r)
            throws ServletException, IOException, ParseException {

        response.setContentType("application/pdf");
        try {
            
            
            Document document = new Document();

            OutputStream outs = response.getOutputStream();
            PdfWriter.getInstance(document, outs);

            document.open();
            Font fonte = FontFactory.getFont(FontFactory.HELVETICA, Font.DEFAULTSIZE, Font.BOLD, new BaseColor(255, 165, 0));

            PdfPTable tabela = new PdfPTable(new float[]{2.5f, 5f});
            
            
            PdfPCell cabecalho = new PdfPCell(new Paragraph("AUTOESCOLA BELL'S", fonte));
            PdfPCell cabecalho1 = new PdfPCell(new Paragraph("Rua 19 de Dezembro, 246 - Fone: 3423-1515"));
            PdfPCell cabecalho2 = new PdfPCell(new Paragraph("Recebido de: " + r.getConta().getAluno().getNomeCompleto()));
            

            cabecalho.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho.setBorder(PdfPCell.BOX);
            cabecalho.setColspan(7);
            cabecalho1.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho1.setBorder(PdfPCell.BOX);
            cabecalho1.setBackgroundColor(new BaseColor(255, 191, 0));
            cabecalho1.setColspan(7);
            tabela.setWidthPercentage(96);
            cabecalho2.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho2.setBorder(PdfPCell.BOX);
            cabecalho2.setColspan(7);
            tabela.addCell(cabecalho);
            tabela.addCell(cabecalho1);
            tabela.addCell(cabecalho2);
            
            DecimalFormat formato = new DecimalFormat("#.##");
            
            double teste = r.getConta().getValorPago();
            double dDecimal = Double.parseDouble(formato.format(teste%1).replace(",", "."));
            int decimal = (int) (100*dDecimal);
            int inteiro = (int) (teste - dDecimal);
            
            GerarNumeroExtenso gne = new GerarNumeroExtenso(inteiro);
            GerarNumeroExtenso gne2 = new GerarNumeroExtenso(decimal);
            
            PdfPCell celulaDouble = new PdfPCell(new Phrase("Valor: "));
            celulaDouble.setHorizontalAlignment(Element.ALIGN_CENTER);
         
            PdfPCell celulaVal = new PdfPCell(new Phrase("Quantia de: " + gne + " reais e " + gne2 + " centavos"));
            celulaVal.setHorizontalAlignment(Element.ALIGN_CENTER);

            
            tabela.addCell(celulaDouble);
            tabela.addCell(celulaVal);
            

            PdfPCell ca = new PdfPCell(new Phrase("Referente ao Pagamento: 1ª referente à Primeira Habilitação"));
            ca.setHorizontalAlignment(Element.ALIGN_CENTER);
       
            ca.setHorizontalAlignment(Element.ALIGN_CENTER);
            ca.setBorder(PdfPCell.BOX);
            ca.setColspan(7);
            tabela.addCell(ca);
            
            PdfPCell celulaData = new PdfPCell(new Phrase("Data: 01/11/2019"));
            
         
            PdfPCell celulaAss = new PdfPCell(new Phrase("Assinatura:                       "));
          

            
            tabela.addCell(celulaData);
            tabela.addCell(celulaAss);
            
            

            document.add(tabela);
            document.close();
                

        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
        }
        
        
    }
    
   
    
    public void gerarPdfRegistroConta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        response.setContentType("application/pdf");
        try {

            Document document = new Document();

            OutputStream outs = response.getOutputStream();
            PdfWriter.getInstance(document, outs);

            document.open();
            Font fonte = FontFactory.getFont(FontFactory.HELVETICA, Font.DEFAULTSIZE, Font.BOLD, new BaseColor(255, 165, 0));

            PdfPTable tabela = new PdfPTable(new float[]{2.5f, 5f, 5f, 5f});

            PdfPCell cabecalho = new PdfPCell(new Paragraph("AUTOESCOLA BELL'S", fonte));
            PdfPCell cabecalho1 = new PdfPCell(new Paragraph("Relatório de Registros do Dia: 01/11/2019", fonte));
         
            

            cabecalho.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho.setBorder(PdfPCell.BOX);
            cabecalho.setColspan(7);
            cabecalho1.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho1.setBorder(PdfPCell.BOX);
            cabecalho1.setColspan(7);
            tabela.setWidthPercentage(96);
           
            tabela.addCell(cabecalho);
            tabela.addCell(cabecalho1);
          
            PdfPCell celulaDia = new PdfPCell(new Phrase("DATA"));
            celulaDia.setHorizontalAlignment(Element.ALIGN_CENTER);
         
            PdfPCell celulaReg = new PdfPCell(new Phrase("REGISTRO"));
            celulaReg.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            PdfPCell celulaUsu0 = new PdfPCell(new Phrase("USUÁRIO"));
            celulaUsu0.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            PdfPCell celulaAluno0 = new PdfPCell(new Phrase("CLIENTE"));
            celulaAluno0.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            PdfPCell celulaData = new PdfPCell(new Phrase("01/11/2019"));
           
         
            PdfPCell celulaValor = new PdfPCell(new Phrase("Valor: R$700,00"));
         
            
            PdfPCell celulaUsu = new PdfPCell(new Phrase("diretor1"));
        
            
            PdfPCell celulaAluno = new PdfPCell(new Phrase("Nome Aluno 2"));
           
            
            PdfPCell celulaData1 = new PdfPCell(new Phrase("01/11/2019"));
           
         
            PdfPCell celulaValor1 = new PdfPCell(new Phrase("Valor: R$700,00"));
          
            
            PdfPCell celulaUsu1 = new PdfPCell(new Phrase("diretor1"));
          
            
            PdfPCell celulaAluno1 = new PdfPCell(new Phrase("Nome Aluno 2"));
           
            
             PdfPCell celulaData2 = new PdfPCell(new Phrase("01/11/2019"));
          
         
            PdfPCell celulaValor2 = new PdfPCell(new Phrase("Valor: R$400,00"));
          
            
            PdfPCell celulaUsu2 = new PdfPCell(new Phrase("diretor1"));
            
            
            PdfPCell celulaAluno2 = new PdfPCell(new Phrase("Nome Aluno"));
            


            
            tabela.addCell(celulaDia);
            tabela.addCell(celulaReg);
            tabela.addCell(celulaUsu0);
            tabela.addCell(celulaAluno0);
            tabela.addCell(celulaData);
            tabela.addCell(celulaValor);
            tabela.addCell(celulaUsu);
            tabela.addCell(celulaAluno);
            tabela.addCell(celulaData1);
            tabela.addCell(celulaValor1);
            tabela.addCell(celulaUsu1);
            tabela.addCell(celulaAluno1);
            tabela.addCell(celulaData2);
            tabela.addCell(celulaValor2);
            tabela.addCell(celulaUsu2);
            tabela.addCell(celulaAluno2);
            

            PdfPCell ca = new PdfPCell(new Phrase("Total de Receita Recebido no Dia: R$1800,00"));
            ca.setHorizontalAlignment(Element.ALIGN_CENTER);
       
            ca.setHorizontalAlignment(Element.ALIGN_CENTER);
            ca.setBorder(PdfPCell.BOX);
            ca.setColspan(7);
            ca.setBackgroundColor(new BaseColor(50,205,50));
            tabela.addCell(ca);   
            

            document.add(tabela);
            document.close();

        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
        }
    }
}
