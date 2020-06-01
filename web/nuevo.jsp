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
    <body>
        <h1>
            <c:if test="${blog.id == 0}">Nuevo Blog</c:if>
            <c:if test="${blog.id != 0}">Editar Blog</c:if>
        </h1>
        <p>ID : ${blog.id}</p>
        <form action="ControladorRegistro" method="post">
            <table>
                <input type="hidden" name="id" value="${blog.id}">
                <tr>
                    <td>Fecha</td>
                    <td><input type="text" name="fecha" value="${blog.fecha}"></td>
                </tr>
                <tr>
                    <td>Titulo</td>
                    <td><input type="text" name="titulo" value="${blog.titulo}"></td>
                </tr>
                <tr>
                    <td>Contenido del Blog</td>
                    <td><input type="text" name="contenido" value="${blog.contenido}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit"  value="Registrar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
