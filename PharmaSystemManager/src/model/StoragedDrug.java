/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author rondw
 */
public class StoragedDrug {

    private int  quantity;
    private Date MFG, EXP, purchaseDate;
    private String ID, batchNo, drugID, branchID, status;
    private double purchasePrice, salesPrice;
    public String getID()
    {
        return ID;
    }

    public void setID(String ID)
    {
        this.ID = ID;
    }

    public double getPurchasePrice()
    {
        return purchasePrice;
    }

    public void setPurchasePrice(double purchasePrice)
    {
        this.purchasePrice = purchasePrice;
    }

    public double getSalesPrice()
    {
        return salesPrice;
    }

    public void setSalesPrice(double salesPrice)
    {
        this.salesPrice = salesPrice;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public double getPurchaseMoney() {
        return purchasePrice;
    }

    public void setPurchaseMoney(double purchaseMoney) {
        this.purchasePrice = purchaseMoney;
    }

    public double getSaleMoney() {
        return salesPrice;
    }

    public void setSaleMoney(double saleMoney) {
        this.salesPrice = saleMoney;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getMFG() {
        return MFG;
    }

    public void setMFG(Date MFG) {
        this.MFG = MFG;
    }

    public Date getEXP() {
        return EXP;
    }

    public void setEXP(Date EXP) {
        this.EXP = EXP;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    public String getDrugID() {
        return drugID;
    }

    public void setDrugID(String drugID) {
        this.drugID = drugID;
    }

    public String getBranchID() {
        return branchID;
    }

    public void setBranchID(String branchID) {
        this.branchID = branchID;
    }
    
    public String toString(){
        return this.drugID;
    }

}
