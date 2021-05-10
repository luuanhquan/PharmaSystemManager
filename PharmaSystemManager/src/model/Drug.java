/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author rondw
 */
public class Drug {

    private String ID, name, scienceName, packing, unit, producer, description, status, drugCategoryID;
    private int storageTemperatures;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getScienceName() {
        return scienceName;
    }

    public void setScienceName(String scienceName) {
        this.scienceName = scienceName;
    }

    public String getPacking() {
        return packing;
    }

    public void setPacking(String packing) {
        this.packing = packing;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDrugCategoryID() {
        return drugCategoryID;
    }

    public void setDrugCategoryID(String drugCategoryID) {
        this.drugCategoryID = drugCategoryID;
    }

    public int getStorageTemperatures() {
        return storageTemperatures;
    }

    public void setStorageTemperatures(int storageTemperatures) {
        this.storageTemperatures = storageTemperatures;
    }
    
}
