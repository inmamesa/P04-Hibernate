/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Trabajadores;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import persistence.NewHibernateUtil;

/**
 *
 * @author inmamesa98
 */
public class TrabajadoresDao implements TrabajadoresInterfaz{

    /**
     *
     * @param id
     * @param nombret
     * @return
     */
    @Override
    public ArrayList<Trabajadores> getTrabajadores(int id, String nombret) {
        Session session = null;
        ArrayList<Trabajadores> trabajador = new ArrayList<>();
        try{
            session = NewHibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("from Trabajadores trabajador where trabajador.id="+id+" and trabajador.nombret='"+nombret+"'");
            trabajador = (ArrayList<Trabajadores>) query.list();
        } catch (HibernateException HE){

        System.err.println(HE.getCause());
        System.err.println("Error doing a trabajo select.");
        
        } finally {
            if (session != null){
                session.close();

            }
        }
        return trabajador;
    }

//    @Override
//    public void insertTrabajador(Trabajadores trabaja) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void editTrabajador(Trabajadores trabaja) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void deleteTrabajador(Trabajadores trabaja) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//   
}
