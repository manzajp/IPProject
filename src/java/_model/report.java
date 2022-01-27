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
public class report implements Serializable{
    
    protected int id;
    protected String location;
    protected String disaster_type;
    protected String asst_type;
    protected String asst_source;

    public report(int id, String location, String disaster_type, String asst_type, String asst_source) {
        this.id = id;
        this.location = location;
        this.disaster_type = disaster_type;
        this.asst_type = asst_type;
        this.asst_source = asst_source;
    }

    public report(String location, String disaster_type, String asst_type, String asst_source) {
        this.location = location;
        this.disaster_type = disaster_type;
        this.asst_type = asst_type;
        this.asst_source = asst_source;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDisaster_type() {
        return disaster_type;
    }

    public void setDisaster_type(String disaster_type) {
        this.disaster_type = disaster_type;
    }

    public String getAsst_type() {
        return asst_type;
    }

    public void setAsst_type(String asst_type) {
        this.asst_type = asst_type;
    }

    public String getAsst_source() {
        return asst_source;
    }

    public void setAsst_source(String asst_source) {
        this.asst_source = asst_source;
    }
    
    
}
