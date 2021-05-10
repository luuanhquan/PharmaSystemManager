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
public class PurchaseInvoice {

    private String ID, employeeID, supplierID, status, drugID, batchNo, drugStatus;
    private Date purchaseDate, mfg, exp, dueDate;
    private int discount, number, quantity, yearDueDate;
    private double purchaseByCash, purchaseByCredit, remainMoney, purchasePrice, salePrice;

    public int getYearDueDate() {
        return yearDueDate;
    }

    public void setYearDueDate(int yearDueDate) {
        this.yearDueDate = yearDueDate;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getDrugStatus() {
        return drugStatus;
    }

    public void setDrugStatus(String drugStatus) {
        this.drugStatus = drugStatus;
    }

    public String getDrugID() {
        return drugID;
    }

    public void setDrugID(String drugID) {
        this.drugID = drugID;
    }

    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    public Date getMfg() {
        return mfg;
    }

    public void setMfg(Date mfg) {
        this.mfg = mfg;
    }

    public Date getExp() {
        return exp;
    }

    public void setExp(Date exp) {
        this.exp = exp;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(double purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

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

    public void setID(String purchaseInvoiceID) {
        this.ID = purchaseInvoiceID;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public String getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(String supplierID) {
        this.supplierID = supplierID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String purchaseInvoiceStatus) {
        this.status = purchaseInvoiceStatus;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date saleDate) {
        this.purchaseDate = saleDate;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public double getRemainMoney() {
        return remainMoney;
    }

    public void setRemainMoney(double remainMoney) {
        this.remainMoney = remainMoney;
    }

}
