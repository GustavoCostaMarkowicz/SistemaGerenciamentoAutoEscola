<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ItemMenu"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControlePaginas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav>
    <div class="red darken-4 nav-wrapper">
        <a href="telaInicial.jsp" class="brand-logo">Bell's</a>
        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons left">menu</i></a>
        <ul class="right hide-on-med-and-down">

            <%
                session = request.getSession();
                Usuario u = (Usuario) session.getAttribute("usuario");

                ControleUsuario cu = new ControleUsuario();
                String tipoUsuario = cu.verificarTipoUsuario(u.getIdUsuario());
                boolean logado = false;
                if (u != null) {
                    logado = true;
                }

                ControlePaginas controle = new ControlePaginas();
                for (ItemMenu item : controle.getItens()) {
                    if (!item.isVisivel()) {
                        continue;
                    }
                    if(logado == true){
                    if (item.isAberta()) {
            %>
            <li>
                <a href="<%=item.getUrl()%>">
                    <i class="material-icons left">
                        <%=item.getIcone()%>
                    </i>
                    <%=item.getValor()%>
                </a>
            </li>
            <%} else if(tipoUsuario.equals("diretor")){
            %>
            <li>
                <a href="<%=item.getUrl()%>">
                    <i class="material-icons left">
                        <%=item.getIcone()%>
                    </i>
                    <%=item.getValor()%>
                </a>
            </li>
            <%}
                }
}
            %>
        </ul>
    </div>
</nav>

<script type="text/javascript">
    /*
     document.addEventListener('DOMContentLoaded', function () {
     var elems = document.querySelectorAll('.sidenav');
     var instances = M.Sidenav.init(elems, options);
     }); */

    // Or with jQuery

    $(document).ready(function () {
        $('.sidenav').sidenav();
    });
</script>