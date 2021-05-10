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
public class SaleInvoice {

    private String ID,employeeID,status;
    private Date saleDate;
    private int discount;
    private double purchaseByCash,purchaseByCredit;

    public double getPurchaseByCash() {
        return purchaseByCash;
    }

    public void setPurchaseByCash(double purchaseByCash) {
        this.purchaseByCash = purchaseByCash;
    }

    public double getPurchaseByCredit() {
        return purchaseByCredit;
    }

    public void setPurchaseByCredit(double purchaseByCredit) {
        this.purchaseByCredit = purchaseByCredit;
    }
    
    public String getID() {
        return ID;
    }

    public void setID(String saleInvoiceID) {
        this.ID = saleInvoiceID;
    }

    public Date getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }


    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String invoiceStatus) {
        this.status = invoiceStatus;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

}
