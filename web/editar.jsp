<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Blogs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Blogs blog = (Blogs)request.getAttribute("blog");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#E6F2FE">
        <table>
             <tr><td width="100%" height="100" align="center"></td></tr>
        </table>
        <form action="ControladorRegistro" method="post">
            <table  border="0"  style="margin: 0 auto; " bgcolor="#FFFFFF">
                <input type="hidden" name="id" value="${blog.id}">
                <tr>
                    <td colspan=4 align="center" bgcolor="5FB0FF" >
                    <font color="#FFFFFF">
                    <h1>
                        <c:if test="${blog.id == 0}">Nuevo Blog</c:if>
                        <c:if test="${blog.id != 0}">Editar Blog</c:if>
                    </h1>
                    </font>
                    <td/>
                </tr>
                <tr><td height="30" colspan="4"></td></tr>
                <tr>
                    <td width="80"></td>
                    <td>Fecha</td>
                    <td><input type="text" name="fecha" value="${blog.fecha}" placeholder="dd-mm-aaaa"></td>
                    <td width="80"></td>
                </tr>
                <tr>
                    <td width="80"></td>
                    <td>Titulo</td>
                    <td><input type="text" name="titulo" value="${blog.titulo}"></td>
                    <td width="80"></td>
                </tr>
                <tr>
                    <td width="20"></td>
                    <td valign=top>Contenido del Blog</td>
                    ​<td><textarea name="contenido" rows="10" cols="50">${blog.contenido}</textarea></td>
                    <td width="80"></td>  
                </tr>
                <br><br>
                <tr>
                    <td width="20"></td>
                    <td></td>
                    <td><input type="submit"  value="Registrar"></td>
                    <td width="80"></td>
                </tr>
                <tr>
                    <td height="60" colspan="4"></td>
                </tr>
            </table>
        </form>     
    </body>
</html>
