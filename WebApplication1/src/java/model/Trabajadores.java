package model;
// Generated 03-jun-2021 14:09:08 by Hibernate Tools 4.3.1



/**
 * Trabajadores generated by hbm2java
 */
public class Trabajadores  implements java.io.Serializable {


     private int id;
     private Integer dni;
     private String nombret;
     private String apellidost;

    public Trabajadores() {
    }

	
    public Trabajadores(int id) {
        this.id = id;
    }
    public Trabajadores(int id, Integer dni, String nombret, String apellidost) {
       this.id = id;
       this.dni = dni;
       this.nombret = nombret;
       this.apellidost = apellidost;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Integer getDni() {
        return this.dni;
    }
    
    public void setDni(Integer dni) {
        this.dni = dni;
    }
    public String getNombret() {
        return this.nombret;
    }
    
    public void setNombret(String nombret) {
        this.nombret = nombret;
    }
    public String getApellidost() {
        return this.apellidost;
    }
    
    public void setApellidost(String apellidost) {
        this.apellidost = apellidost;
    }




}


