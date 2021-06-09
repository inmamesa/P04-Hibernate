/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Servicios;

/**
 *
 * @author inmamesa98
 */
public interface ServicioInterfaz {
    public ArrayList<Servicios> getServicios();
    public ArrayList<Servicios> getServiciodos(String nombre);
//    public void insertSericio(Servicios servicio);
//    public void editTrabajador(Servicios servicio);
//    public void deleteTrabajador(Servicios servicio);
}
