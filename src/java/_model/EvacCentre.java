/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _model;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class EvacCentre implements Serializable{
    protected int id;
    protected String centreName;
    protected String centreLoc;
    protected int capacity;
    protected int maxCapacity;
    protected String activity;

    public EvacCentre() {
    }

    public EvacCentre(int id, String centreName, String centreLoc, int capacity, int maxCapacity, String activity) {
        this.id = id;
        this.centreName = centreName;
        this.centreLoc = centreLoc;
        this.capacity = capacity;
        this.maxCapacity = maxCapacity;
        this.activity = activity;
    }

    public EvacCentre(String centreName, String centreLoc, int capacity, int maxCapacity, String activity) {
        this.centreName = centreName;
        this.centreLoc = centreLoc;
        this.capacity = capacity;
        this.maxCapacity = maxCapacity;
        this.activity = activity;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public EvacCentre(int id) {
        this.id = id;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCentreName() {
        return centreName;
    }

    public void setCentreName(String centreName) {
        this.centreName = centreName;
    }

    public String getCentreLoc() {
        return centreLoc;
    }

    public void setCentreLoc(String centreLoc) {
        this.centreLoc = centreLoc;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
    
    public int getMaxCapacity() {
        return maxCapacity;
    }

    public void setMaxCapacity(int maxCapacity) {
        this.maxCapacity = maxCapacity;
    }
}
