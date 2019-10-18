package br.edu.ifpr.irati.jsp.itext;

import br.edu.ifpr.irati.jsp.controle.ControleAluno;
import br.edu.ifpr.irati.jsp.controle.ControleExameMedico;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.ExameMedico;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            if(a.getTelefone() != null){
                tel = a.getTelefone();
            }
            if(a.getTelefoneCelular() != null){
                telc = a.getTelefoneCelular();
            }
            if(a.getEmail() != null){
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
            throws ServletException, IOException, ParseException{

       response.setContentType("application/pdf");
      try {
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
            Date data = sdf.parse(sdata);
            
            ControleExameMedico cem = new ControleExameMedico();
            List<ExameMedico> ems = cem.buscarExamePorData(data);
            
            
                System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + ems.size());
          
           
           int flag = 0;
           int i = 0;
           int j = 0;
           int idExa[] = new int[ems.size()];
           while(i <= ems.size() - 1){
               Date dataMenor = sdf2.parse("23:59");
           for(ExameMedico em : ems){
               
               if(dataMenor.after(em.getHorarioExame())){
                   while(j <= idExa.length-1){
                       if(idExa[j] == em.getIdExame()){
                           flag++;
                       }
                       j++;
                   }
                   
                   if(flag == 0){
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

            PdfPTable tabela = new PdfPTable(new float[] { 2.5f, 5f, 5f, 6f });
		PdfPCell celulaHorario = new PdfPCell(new Phrase("Horário"));
		celulaHorario.setHorizontalAlignment(Element.ALIGN_CENTER);
		PdfPCell celulaMed = new PdfPCell(new Phrase("Médico"));
		celulaMed.setHorizontalAlignment(Element.ALIGN_CENTER);
		PdfPCell celulaClin = new PdfPCell(new Phrase("Clínica"));
		celulaClin.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell celulaAluno = new PdfPCell(new Phrase("Aluno"));
		celulaAluno.setHorizontalAlignment(Element.ALIGN_CENTER);

		tabela.addCell(celulaHorario);
		tabela.addCell(celulaMed);
		tabela.addCell(celulaClin);
                tabela.addCell(celulaAluno);
		
                for(int a = 0; a < idExa.length; a++){
                
                ExameMedico em = cem.buscarExameMedicosPorId(idExa[a]);
                    
                PdfPCell ca = new PdfPCell(new Phrase(sdf2.format(em.getHorarioExame())));
		ca.setHorizontalAlignment(Element.ALIGN_CENTER);
		PdfPCell cb = new PdfPCell(new Phrase(em.getMedico()));
		cb.setHorizontalAlignment(Element.ALIGN_CENTER);
		PdfPCell cc = new PdfPCell(new Phrase(em.getClinica()));
		cc.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cd = new PdfPCell(new Phrase(em.getAlunos().get(0).getNomeCompleto()));
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

    public void gerarHorarioExamePorInstrutor(HttpServletRequest request, HttpServletResponse response, int idAluno)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        try {

            Document document = new Document();

            OutputStream outs = response.getOutputStream();
            PdfWriter.getInstance(document, outs);

            ControleAluno ca = new ControleAluno();
            Aluno a = ca.buscarAlunosPorId(idAluno);
            
            


 
        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
        }

    }
    
}
