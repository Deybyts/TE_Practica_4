<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Blogs"%>
<%@page import="java.util.List"%>
<%

    List<Blogs> lista = (List<Blogs>) request.getAttribute("lista");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <table border="0" width="100%" bgcolor="#2BC4F5">
            <tr>
                <td width="60%"></td>
                <td align="right" width="20%"><font color="#FFFFFF" ><p>Usuario : ${sessionScope.usuario}</p></font></td>
                <td align="right" width="15%"><a  href="ControladorLogin?action=logout"><font color="#FFFFFF" ><p>[=>] Salir</p></font></a></td>
                
            </tr> 
            <tr>
                <td align="center" colspan=3 ><h1><font color="#FFFFFF">Blog Tecnologico</font></h1></td>
            </tr>
            <tr>
                <td width="100%"  colspan=3 height="3" bgcolor="#FFFFFF" align="center"></td>
            </tr>
            <tr>
                <td width="100%"  colspan=3 height="1" bgcolor="2BC4F5" align="center"></td>
            </tr>
        </table>
        
        <table width="90%" height=90%>
            <tr>
                <td><p><a href="ControladorRegistro?op=nuevo">Nuevo Blog</a></p></td>
            </tr>   
        </table>
        
        <table border="0" width="90%" height=90%>
            <c:forEach var="item" items="${lista}">
                <table border="0" width="90%" height=90%  style="margin: 0 auto;" >
                    <tr>
                        <td colspan=3><p>${item.fecha}</p></td>
                    </tr>
                    <tr>     
                        <td colspan=3 ><h3><font color="red">${item.titulo}</font></h3></td>
                    </tr>
                    <tr>
                        <td colspan=3>${item.contenido}</td>
                    </tr>  
                    <tr height="60">
                        <td width="100%"></td>
                        <td width="10%"><a href="ControladorRegistro?op=editar&id=${item.id}">Editar</a></td>
                        <td width="10%"><a href="ControladorRegistro?op=eliminar&id=${item.id}" onclick="return(confirm('Esta seguro de eliminar'))">Eliminar</a></td>
                     </tr>
                     <tr><td  colspan="3" width="100%" height="0.5" bgcolor="#2BC4F5" align="center"></td></tr>
                 </table>
                  <br>
                  
            </c:forEach>
        </table>
    </center>

    </body>
</html>
