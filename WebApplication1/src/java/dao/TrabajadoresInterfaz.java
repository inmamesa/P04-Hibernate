/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Trabajadores;
import java.util.ArrayList;
/**
 *
 * @author inmamesa98
 */
public interface TrabajadoresInterfaz {
   
    public ArrayList<Trabajadores> getTrabajadores(int id, String nombre);
//    public void insertTrabajador(Trabajadores trabaja);
//    public void editTrabajador(Trabajadores trabaja);
//    public void deleteTrabajador(Trabajadores trabaja);

}
