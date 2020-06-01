
package com.emergentes.controlador;

import com.emergentes.modelo.Blogs;
import com.emergentes.utiles.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorRegistro", urlPatterns = {"/ControladorRegistro"})
public class ControladorRegistro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String op ;
        //se almacena en opcion si se tiene un valor nulo
        op = (request.getParameter("op") != null) ? request.getParameter("op") : "list";
        //Creamos lista para obtener los registro de la tabla blog
        ArrayList<Blogs> lista = new ArrayList<Blogs>();
        //crear las condicione para conectarce a la base de datos
        ConexionBD canal = new ConexionBD();
        //Creamos variable con para obtener el valor de la connecnion
        Connection conn = canal.conectar();
        //preparamos las variables para la base de datos 
        PreparedStatement ps;
        //Obtenemos los datos de la consulta en rs
        ResultSet rs;
        
        //hacemos proceso para el listado
        if(op.equals("list")){//si la opcion esta en el listado
            try{
                //sacamos todos los libro
                String sql = "select * from blog;";
                //pasamos la consulta
                ps =conn.prepareStatement(sql);
                //ejecutamos la consulta y almacenamos los valores de la consulta en rs
                rs = ps.executeQuery();
                
                //como ya tenemos en rs todos los registros Lo colocamos en una coleccion
                while(rs.next()){
                    Blogs bg = new Blogs();
                    //recuperamos el id
                    bg.setId(rs.getInt("id"));
                    bg.setFecha(rs.getString("fecha"));
                    bg.setTitulo(rs.getString("titulo"));
                    bg.setContenido(rs.getString("contenido"));
                    
                    lista.add(bg);
                }
                //enviarmos la lista Blog como atributo
                request.setAttribute("lista",lista);
                request.getRequestDispatcher("panel.jsp").forward(request, response);
                
            } catch(SQLException ex){
                System.out.println("Error en SQL "+ex.getMessage());
            } finally{
                canal.desconectar();
            }
        }
        
        if(op.equals("nuevo")){
            //creamos un nuevo blog
            Blogs b = new Blogs();
            //lo colocamos como parametro a b
            request.setAttribute("blog", b);
            //lo redireccionamos
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        
        if(op.equals("editar")) {
            try {
                String di = request.getParameter("id");
                int id = Integer.parseInt(di);
                String sql = "select *  from blog where id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                
                rs = ps.executeQuery();
                Blogs bl = new Blogs();
                while(rs.next()){
                    bl.setId(rs.getInt("id"));
                    bl.setFecha(rs.getString("fecha"));
                    bl.setTitulo(rs.getString("titulo"));
                    bl.setContenido(rs.getString("contenido"));
                }
                request.setAttribute("blog", bl);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
            } catch (SQLException ex) {
                System.out.println("Error de SQL " + ex.getMessage());
            }
        }
                
        if(op.equals("eliminar")){
            try {
                //eliminamos un blog
                int id = Integer.parseInt(request.getParameter("id"));
                //creamos la consulta para eliminar
                String sql = "delete from blog where id = ?";
                //remplasamos el signo de interrogacion
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                //executamos la consulta
                ps.executeUpdate();
            } catch (SQLException ex) {
                System.out.println("Error en SQL "+ex.getMessage());
            }finally {
                canal.desconectar();
            } 
            //eviamos el control a controlador
            response.sendRedirect("ControladorRegistro");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String s_id = request.getParameter("id");
        int id = Integer.parseInt(s_id);
        String fecha = request.getParameter("fecha");
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");
        
        //colocamos aun objeto
        Blogs b = new Blogs();
        b.setId(id);
        b.setFecha(fecha);
        b.setTitulo(titulo);
        b.setContenido(contenido);

        //Conectamos por que tenemos un registro nuevo
        ConexionBD canal = new ConexionBD();
        Connection conn = canal.conectar();
        PreparedStatement ps;
        ResultSet rs;
        //Para insertar un nuevo registro
        if(id == 0) {
            //Sie el id == a 0 es un nuevo registro
            String sql = "insert into blog(fecha,titulo,contenido)values(?, ? ,?)";
            try { 
                //ejecutamos la consulta
                ps = conn.prepareStatement(sql);
                //pasamos los paametros
                ps.setString(1, b.getFecha());
                ps.setString(2, b.getTitulo());
                ps.setString(3, b.getContenido());
                //ejecutamos la consulta update por que va a modificar la BD
                ps.executeUpdate();
            } catch (SQLException ex) {
                System.out.println("Error de SQL"+ex.getMessage());
            } finally {
                canal.desconectar();
            }
            //enviamos el control a otro recurso
            response.sendRedirect("ControladorRegistro");
        }
        else {
            try {
                String sql = "update blog set fecha=?,titulo=?,contenido=? where id=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, b.getFecha());
                ps.setString(2, b.getTitulo());
                ps.setString(3, b.getContenido());
                ps.setInt(4, b.getId());
                ps.executeUpdate();
            } catch (SQLException ex) {
                System.out.println("Error al actualizar"+ex.getMessage());
            }
            response.sendRedirect("ControladorRegistro");
        }
    }
}
