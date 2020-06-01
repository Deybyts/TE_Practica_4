package com.emergentes.controlador;

import com.emergentes.utiles.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorLogin", urlPatterns = {"/ControladorLogin"})
public class ControladorLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //Solicitamos un dato y lo validamos
        String action = (request.getParameter("action")  == null ) ? "view" : request.getParameter("action");
        
        if(action.equals("view")){//si es igual a view (que no ingreso nada en el espacio del formulario)
            response.sendRedirect("login.jsp");//como no lleno el espacio lo redireccionamos devuel al formulario login
        }
        if(action.equals("logout")){//para cerrar la secion
            HttpSession ses = request.getSession();//Sacamos la session
            ses.invalidate();//Eliminamos toda la session
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            //para executar la consulta creamos la variable resulset
            ResultSet rs;
            //Verificamos que los datos (usuario, password) se en cuentres en la tabla de usuario
            ConexionBD canal = new ConexionBD();
            
            Connection cnn = canal.conectar();
            String sql = "select * from usuario where usuario = ?  and password = ? limit 1";
            PreparedStatement ps = cnn.prepareStatement(sql);
            
            //Pasamos los dos parametos
            ps.setString(1, usuario);
            ps.setString(2, password);
            
            //ejecutar consultas
            rs =ps.executeQuery();
            
            //verificamos si hay concidencias
            if(rs.next()){//Si hay un registro pa
                HttpSession ses = request.getSession();//creamos la sesion para auntentificar al usuario
                ses.setAttribute("logueado", "OK"); //Damos atributos (nobre del atributo los llamaremos logeado, Ok)
                ses.setAttribute("usuario", usuario);// (variable, valor(el usuario con el q ingreso))
                //Enviamos al panel de control
                response.sendRedirect("ControladorRegistro");
            }
            else{
                //si no coniside
                response.sendRedirect("login.jsp");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ControladorLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
