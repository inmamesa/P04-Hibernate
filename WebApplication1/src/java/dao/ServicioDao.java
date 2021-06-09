/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Servicios;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import persistence.NewHibernateUtil;

/**
 *
 * @author inmamesa98
 */
public class ServicioDao implements ServicioInterfaz{

    @Override
    public ArrayList<Servicios> getServicios() {
        Session session = null;
        ArrayList<Servicios> servicio = null;
        try{
            session = NewHibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("from Servicios");
            servicio = (ArrayList<Servicios>) query.list();
        } catch (HibernateException HE){

        System.err.println(HE.getCause());
        System.err.println("Error doing a trabajo select.");
        } finally {
            if (session != null){
                session.close();
            }
        }
        return servicio;
    }
    public ArrayList<Servicios> getServiciodos(String nombre) {
        Session session = null;
        ArrayList<Servicios> servicio = null;
        try{ 
            session = NewHibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("from Servicios servicio where servicio.nombre='"+nombre+"'");
            servicio = (ArrayList<Servicios>) query.list();
        } catch (HibernateException HE){

        System.err.println(HE.getCause());
        System.err.println("Error doing a servicio select.");
        } finally {
            if (session != null){
                session.close();
            }
        }
        return servicio;
    }

//    @Override
//    public void insertSericio(Servicios servicio) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void editTrabajador(Servicios servicio) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void deleteTrabajador(Servicios servicio) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
    
    
    
}
