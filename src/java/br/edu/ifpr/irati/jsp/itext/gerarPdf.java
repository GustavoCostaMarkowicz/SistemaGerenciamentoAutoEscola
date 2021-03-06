package br.edu.ifpr.irati.jsp.itext;

import br.edu.ifpr.irati.jsp.controle.ControleAluno;
import br.edu.ifpr.irati.jsp.controle.ControleExame;
import br.edu.ifpr.irati.jsp.controle.ControleExameMedico;
import br.edu.ifpr.irati.jsp.controle.ControleExamePratico;
import br.edu.ifpr.irati.jsp.controle.ControleExamePsicotecnico;
import br.edu.ifpr.irati.jsp.controle.ControleExameTeorico;
import br.edu.ifpr.irati.jsp.controle.ControleInstrutor;
import br.edu.ifpr.irati.jsp.controle.ControleRegistro;
import br.edu.ifpr.irati.jsp.controle.ControleResultadoExame;
import br.edu.ifpr.irati.jsp.exception.dataIncorretaException;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.Conta;
import br.edu.ifpr.irati.jsp.modelo.Exame;
import br.edu.ifpr.irati.jsp.modelo.ExameMedico;
import br.edu.ifpr.irati.jsp.modelo.ExamePratico;
import br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico;
import br.edu.ifpr.irati.jsp.modelo.ExameTeorico;
import br.edu.ifpr.irati.jsp.modelo.Instrutor;
import br.edu.ifpr.irati.jsp.modelo.Registro;
import br.edu.ifpr.irati.jsp.modelo.ResultadoExame;
import br.edu.ifpr.irati.jsp.modelo.Servico;
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

    public void gerarPdfExameTeorico(HttpServletRequest request, HttpServletResponse response, String sData)
            throws ServletException, IOException, ParseException {

        response.setContentType("application/pdf");
        try {

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
            Date data = sdf.parse(sData);

            ControleExameTeorico cet = new ControleExameTeorico();
            List<ExameTeorico> ets = cet.buscarExamePorData(data);

            int flag = 0;
            int i = 0;
            int j = 0;
            int idExa[] = new int[ets.size()];
            while (i <= ets.size() - 1) {
                Date dataMenor = sdf2.parse("23:59");
                for (ExameTeorico ep : ets) {

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
            PdfPCell celulaMed = new PdfPCell(new Phrase("Local de Aplicação"));
            celulaMed.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaMed.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaClin = new PdfPCell(new Phrase("Instrutor/Aplicador"));
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

                ExameTeorico et = cet.buscarExameTeoricosPorId(idExa[a]);

                PdfPCell ca = new PdfPCell(new Phrase(sdf2.format(et.getHorarioExame())));
                ca.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cb = new PdfPCell(new Phrase(et.getLocalAplicacao()));
                cb.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cc = new PdfPCell(new Phrase(et.getInstrutor().getNomeCompleto()));
                cc.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cd = new PdfPCell(new Phrase(et.getAlunos().get(0).getNomeCompleto()));
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

    //FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    public void gerarPdfExamePratico(HttpServletRequest request, HttpServletResponse response, String sData)
            throws ServletException, IOException, ParseException, dataIncorretaException {

        response.setContentType("application/pdf");
        try {

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
            Date data = sdf.parse(sData);

            ControleExamePratico cep = new ControleExamePratico();
            List<ExamePratico> ets = cep.buscarExamesPraticosPorData(data);
            System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + ets.size());

            int flag = 0;
            int i = 0;
            int j = 0;
            int idExa[] = new int[ets.size()];
            while (i <= ets.size() - 1) {
                Date dataMenor = sdf2.parse("23:59");
                for (ExamePratico ep : ets) {

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

            PdfPTable tabela = new PdfPTable(new float[]{2.5f, 5f, 5f, 5f, 5f});

            PdfPCell cabecalho = new PdfPCell(new Paragraph("EXAMES PRÁTICOS MARCADOS PARA O DIA: "));

            cabecalho.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho.setBorder(PdfPCell.BOX);
            cabecalho.setBackgroundColor(new BaseColor(255, 191, 0));
            cabecalho.setColspan(7);
            tabela.setWidthPercentage(96);
            tabela.addCell(cabecalho);

            PdfPCell celulaHorario = new PdfPCell(new Phrase("Horário"));
            celulaHorario.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaHorario.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaMed = new PdfPCell(new Phrase("Local de Aplicação"));
            celulaMed.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaMed.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaClin = new PdfPCell(new Phrase("Instrutor/Aplicador"));
            celulaClin.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaClin.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaAluno = new PdfPCell(new Phrase("Aluno"));
            celulaAluno.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaAluno.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaV = new PdfPCell(new Phrase("Veículo"));
            celulaV.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaV.setBackgroundColor(new BaseColor(245, 222, 179));

            tabela.addCell(celulaHorario);
            tabela.addCell(celulaMed);
            tabela.addCell(celulaClin);
            tabela.addCell(celulaAluno);
            tabela.addCell(celulaV);

            for (int a = 0; a < idExa.length; a++) {

                ExamePratico ep = cep.buscarExamePraticosPorId(idExa[a]);

                PdfPCell ca = new PdfPCell(new Phrase(sdf2.format(ep.getHorarioExame())));
                ca.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cb = new PdfPCell(new Phrase(ep.getCategoria()));
                cb.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cc = new PdfPCell(new Phrase(ep.getInstrutor().getNomeCompleto()));
                cc.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cd = new PdfPCell(new Phrase(ep.getAlunos().get(0).getNomeCompleto()));
                cd.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell ce = new PdfPCell(new Phrase(ep.getVeiculo().getPlaca()));
                cd.setHorizontalAlignment(Element.ALIGN_CENTER);

                tabela.addCell(ca);
                tabela.addCell(cb);
                tabela.addCell(cc);
                tabela.addCell(cd);
                tabela.addCell(ce);

            }

            document.add(tabela);

            document.close();

        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
        }

    }

    public void gerarPdfResultadoExame(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        response.setContentType("application/pdf");
        try {

            Date d = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dataFRelatorio = sdf.format(d);
            int mes = d.getMonth();
            int ano = d.getYear() + 1900;
            int dia = d.getDate();
            mes--;
            if (mes == -1) {
                mes = 11;
                ano--;
            }
            if (mes == 0) {
                dia = 31;
            }
            if (mes == 1) {
                //Teste de ano bissexto
                if (ano % 4 == 0 & (ano % 100 != 0 | ano % 400 == 0)) {
                    dia = 29;
                } else {
                    dia = 28;
                }
            }
            if (mes == 2) {
                dia = 31;
            }
            if (mes == 3) {
                dia = 30;
            }
            if (mes == 4) {
                dia = 31;
            }
            if (mes == 5) {
                dia = 30;
            }
            if (mes == 6) {
                dia = 31;
            }
            if (mes == 7) {
                dia = 31;
            }
            if (mes == 8) {
                dia = 30;
            }
            if (mes == 9) {
                dia = 31;
            }
            if (mes == 10) {
                dia = 30;
            }
            if (mes == 11) {
                dia = 31;
            }
            String dataIRelatorio = ano + "-" + mes + "-" + dia;
            ControleExame ce = new ControleExame();
            ControleExamePratico cep = new ControleExamePratico();
            ControleResultadoExame cre = new ControleResultadoExame();
            List<Exame> es = ce.buscarExamesPorData(dataIRelatorio, dataFRelatorio);
            List<ResultadoExame> res = new ArrayList();
            List<ResultadoExame> resA = new ArrayList();

            for (Exame e : es) {
                if (ce.verificarTipoExame(e.getIdExame()).equals("pratico")) {
                    resA = cre.buscarResultadoExamesPorExame(e.getIdExame());
                    for (ResultadoExame re : resA) {
                        res.add(re);
                    }
                }
            }
            ControleInstrutor ci = new ControleInstrutor();
            List<Instrutor> is = ci.buscarTodosInstrutores();
            List<Integer> porcentagensAp = new ArrayList();
            List<Integer> totalExames = new ArrayList();
            List<Integer> aprovados = new ArrayList();
            List<Integer> reprovados = new ArrayList();
            int total = 0;
            int aprovado = 0;
            double dporcentagem = 0;
            int porcentagem = 0;
            for (Instrutor i : is) {
                total = 0;
                aprovado = 0;
                porcentagem = 0;
                for (ResultadoExame re : res) {
                    if (i.getIdPessoa() == cep.buscarExamePraticosPorId(re.getExame().getIdExame()).getInstrutor().getIdPessoa()) {
                        total++;
                        if (re.getResultado().equals("Aprovado")) {
                            aprovado++;
                        }
                    }
                }
                if (total > 0) {
                    dporcentagem = (aprovado * 100) / total;
                    porcentagem = (int) dporcentagem;
                    porcentagensAp.add(porcentagem);
                    totalExames.add(total);
                    aprovados.add(aprovado);
                    reprovados.add(total - aprovado);
                } else {
                    porcentagensAp.add(0);
                    totalExames.add(0);
                    aprovados.add(0);
                    reprovados.add(0);
                }
            }

            Document document = new Document();

            OutputStream outs = response.getOutputStream();
            PdfWriter.getInstance(document, outs);

            document.open();

            PdfPTable tabela = new PdfPTable(new float[]{6f, 2.5f, 2.5f, 2.5f, 3f});

            PdfPCell cabecalho = new PdfPCell(new Paragraph("RESULTADO DE APROVAÇÕES E REPROVAÇÕES DO ÚLTIMO MÊS"));

            cabecalho.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho.setBorder(PdfPCell.BOX);
            cabecalho.setBackgroundColor(new BaseColor(255, 191, 0));
            cabecalho.setColspan(7);
            tabela.setWidthPercentage(96);
            tabela.addCell(cabecalho);

            PdfPCell celulaHorario = new PdfPCell(new Phrase("Instrutor"));
            celulaHorario.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaHorario.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaMed = new PdfPCell(new Phrase("N° de Exames Realizados"));
            celulaMed.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaMed.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaClin = new PdfPCell(new Phrase("Nº de Aprovações"));
            celulaClin.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaClin.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaTipoExMed = new PdfPCell(new Phrase("N° de Reprovações"));
            celulaTipoExMed.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaTipoExMed.setBackgroundColor(new BaseColor(245, 222, 179));
            PdfPCell celulaAluno = new PdfPCell(new Phrase("Porcentagem de Aprovação"));
            celulaAluno.setHorizontalAlignment(Element.ALIGN_CENTER);
            celulaAluno.setBackgroundColor(new BaseColor(245, 222, 179));

            tabela.addCell(celulaHorario);
            tabela.addCell(celulaMed);
            tabela.addCell(celulaClin);
            tabela.addCell(celulaTipoExMed);
            tabela.addCell(celulaAluno);
            
            int j = 0;
            for(Instrutor i:is){
                
            PdfPCell celula = new PdfPCell(new Phrase(i.getNomeCompleto()));
            celula.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell celula1 = new PdfPCell(new Phrase(""+totalExames.get(j)));
            celula1.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell celula2 = new PdfPCell(new Phrase(""+aprovados.get(j)));
            celula2.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell celula3 = new PdfPCell(new Phrase(""+reprovados.get(j)));
            celula3.setHorizontalAlignment(Element.ALIGN_CENTER);
           
            PdfPCell celula4 = new PdfPCell(new Phrase(porcentagensAp.get(j) + "%"));
            celula4.setHorizontalAlignment(Element.ALIGN_CENTER);
            if(porcentagensAp.get(j) > 70){
                celula4.setBackgroundColor(new BaseColor(0,255,0));
            } else {
                celula4.setBackgroundColor(new BaseColor(255,0,0));
            }
            
            tabela.addCell(celula);
            tabela.addCell(celula1);
            tabela.addCell(celula2);
            tabela.addCell(celula3);
            tabela.addCell(celula4);
                
            j++;
            
            }

            document.add(tabela);
            document.close();

        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
        }

    }

    public void gerarPdfRecibo(HttpServletRequest request, HttpServletResponse response, Conta c, double valorPago)
            throws ServletException, IOException, ParseException {

        response.setContentType("application/pdf");
        try {

            Document document = new Document();

            OutputStream outs = response.getOutputStream();
            PdfWriter.getInstance(document, outs);

            document.open();
            Font fonte = FontFactory.getFont(FontFactory.HELVETICA, Font.DEFAULTSIZE, Font.BOLD, new BaseColor(255, 165, 0));

            PdfPTable tabela = new PdfPTable(new float[]{2.5f, 5f});

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            PdfPCell cabecalho = new PdfPCell(new Paragraph("AUTOESCOLA BELL'S", fonte));
            PdfPCell cabecalho1 = new PdfPCell(new Paragraph("Rua 19 de Dezembro, 246 - Fone: 3423-1515"));
            PdfPCell cabecalho2 = new PdfPCell(new Paragraph("Recebido de: " + c.getAluno().getNomeCompleto()));

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

            double dDecimal = Double.parseDouble(formato.format(valorPago % 1).replace(",", "."));
            int decimal = (int) (100 * dDecimal);
            int inteiro = (int) (valorPago - dDecimal);

            GerarNumeroExtenso gne = new GerarNumeroExtenso(inteiro);
            GerarNumeroExtenso gne2 = new GerarNumeroExtenso(decimal);

            PdfPCell celulaDouble = new PdfPCell(new Phrase("Valor: R$" + valorPago));
            celulaDouble.setHorizontalAlignment(Element.ALIGN_CENTER);

            PdfPCell celulaVal = new PdfPCell();
            celulaVal.setHorizontalAlignment(Element.ALIGN_CENTER);

            if (decimal == 0) {
                celulaVal = new PdfPCell(new Phrase("Quantia de: " + gne + " reais"));
            } else {
                celulaVal = new PdfPCell(new Phrase("Quantia de: " + gne + " reais e " + gne2 + " centavos"));
                celulaVal.setHorizontalAlignment(Element.ALIGN_CENTER);
            }

            tabela.addCell(celulaDouble);
            tabela.addCell(celulaVal);

            List<Servico> ss = c.getServicos();
            PdfPCell ca = new PdfPCell(new Phrase("Referente ao Pagamento: " + ss.get(ss.size() - 1).getTipoServico()));
            ca.setHorizontalAlignment(Element.ALIGN_CENTER);

            ca.setHorizontalAlignment(Element.ALIGN_CENTER);
            ca.setBorder(PdfPCell.BOX);
            ca.setColspan(7);
            tabela.addCell(ca);

            PdfPCell celulaData = new PdfPCell(new Phrase("Data:" + sdf.format(new Date())));

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
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
            Font fonte = FontFactory.getFont(FontFactory.HELVETICA, Font.DEFAULTSIZE, Font.BOLD, new BaseColor(255, 165, 0));

            PdfPTable tabela = new PdfPTable(new float[]{2.5f, 5f, 5f, 5f});

            PdfPCell cabecalho = new PdfPCell(new Paragraph("AUTOESCOLA BELL'S", fonte));
            PdfPCell cabecalho1 = new PdfPCell(new Paragraph("Relatório de Registros do Dia: " + sdf.format(new Date()), fonte));

            ControleRegistro cr = new ControleRegistro();
            List<Registro> rs = cr.buscarRegistroPorData(new Date());

            cabecalho.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho.setBorder(PdfPCell.BOX);
            cabecalho.setColspan(7);
            cabecalho1.setHorizontalAlignment(Element.ALIGN_CENTER);
            cabecalho1.setBorder(PdfPCell.BOX);
            cabecalho1.setColspan(7);
            tabela.setWidthPercentage(96);

            tabela.addCell(cabecalho);
            tabela.addCell(cabecalho1);

            PdfPCell celulaDia = new PdfPCell(new Phrase("HORÁRIO"));
            celulaDia.setHorizontalAlignment(Element.ALIGN_CENTER);

            PdfPCell celulaReg = new PdfPCell(new Phrase("REGISTRO"));
            celulaReg.setHorizontalAlignment(Element.ALIGN_CENTER);

            PdfPCell celulaUsu0 = new PdfPCell(new Phrase("USUÁRIO"));
            celulaUsu0.setHorizontalAlignment(Element.ALIGN_CENTER);

            PdfPCell celulaAluno0 = new PdfPCell(new Phrase("CLIENTE"));
            celulaAluno0.setHorizontalAlignment(Element.ALIGN_CENTER);

            for (Registro r : rs) {

                PdfPCell celulaData = new PdfPCell(new Phrase(sdf1.format(r.getHorarioRegistro())));

                PdfPCell celulaValor = new PdfPCell(new Phrase(r.getTextoRegistro()));

                PdfPCell celulaUsu = new PdfPCell(new Phrase(r.getUsuario().getLogin()));

                PdfPCell celulaAluno = new PdfPCell(new Phrase(r.getConta().getAluno().getNomeCompleto()));

                tabela.addCell(celulaData);
                tabela.addCell(celulaValor);
                tabela.addCell(celulaUsu);
                tabela.addCell(celulaAluno);
            }

            tabela.addCell(celulaDia);
            tabela.addCell(celulaReg);
            tabela.addCell(celulaUsu0);
            tabela.addCell(celulaAluno0);

            PdfPCell ca = new PdfPCell(new Phrase("Total de Receita Recebido no Dia: R$1800,00"));
            ca.setHorizontalAlignment(Element.ALIGN_CENTER);

            ca.setHorizontalAlignment(Element.ALIGN_CENTER);
            ca.setBorder(PdfPCell.BOX);
            ca.setColspan(7);
            ca.setBackgroundColor(new BaseColor(50, 205, 50));
            tabela.addCell(ca);

            document.add(tabela);
            document.close();

        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
        }
    }
}
