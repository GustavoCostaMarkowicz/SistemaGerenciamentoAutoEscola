<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ItemMenu"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControlePaginas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav style="background-color: gray">
    <div class="nav-wrapper">
        <a href="telainicial.jsp" class="brand-logo">BELL'S</a>
        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons left">menu</i></a>
        <ul class="right hide-on-med-and-down">

            <%

                ControlePaginas controle = new ControlePaginas();
                for (ItemMenu item : controle.getItens()) {
                   
                    
            %>
            <li>
                <a href="<%=item.getUrl()%>">
                    <i class="material-icons left">
                        <%=item.getIcone()%>
                    </i>
                    <%=item.getValor()%>
                </a>
            </li>
            <%
            }
            %>
        </ul>
    </div>
</nav>

<ul class="sidenav" id="mobile-demo">
    <%
        for (ItemMenu item : controle.getItens()) {
            
    %>
    <li>
        <a href="<%=item.getUrl()%>">
            <i class="material-icons">
                <%=item.getIcone()%>
            </i>
            <%=item.getValor()%>
        </a>
    </li>
    <% }

    %>
</ul>

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