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
                <td align="center"><h1><font color="#FFFFFF">Login</font></h1></td>
            </tr>
        </table>
        
        <form action="ControladorLogin" method="post">
            <table border="0">
                <tr>
                    <td height="50"></td>
                </tr>
                <tr>
                    <td width="100"><font color="#08B7EF">Usuario</font></td>
                    <td width="100"><input type="text" name="usuario" placeholder="solo letras"></td>
                </tr>
                <tr>
                    <td width="100"><font color="#08B7EF">Password</font></td>
                    <td width="100"><input type="password" name="password" placeholder="sin caracteres extraños"></td>
                </tr>
                <tr>
                    <td width="100"></td>
                    <td width="100"><input type="submit" value="Ingresar"></td>
                </tr>
            </table>
        </form>
    </center>
    </body>
</html>
