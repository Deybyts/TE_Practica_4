package com.emergentes.modelo;

public class Blogs {
    private int id;
    private String titulo;
    private String contenido;
    private String fecha;

    public Blogs() {
        this.id = 0;
        this.titulo = "";
        this.contenido = "";
        this.fecha = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}
