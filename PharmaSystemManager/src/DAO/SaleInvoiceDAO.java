/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import helper.JdbcHelper;
import helper.ShareHelper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SaleInvoice;

/**
 *
 * @author rondw
 */
public class SaleInvoiceDAO {

    public String insert(SaleInvoice model) {
        try {
            String sql = "call InsertSaleInvoice (?, ?, ?, ?, ?, ?)";
            return JdbcHelper.CallableStatementWithOutputAtParameterOneAndTypeIsNvarchar(sql, model.getSaleDate(), model.getPurchaseByCash(), model.getPurchaseByCredit(),
                    model.getDiscount(), model.getEmployeeID());
        } catch (SQLException ex) {
            Logger.getLogger(PurchaseInvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(SaleInvoice model) {
        String sql = "UPDATE HoaDonBanHang SET NgayBan = ?, TTTienMat = ?,TTThe = ?, GiamGia = ?, TrangThaiHDBan = ?, MaNV = ? WHERE MaHDBan = ?";
        JdbcHelper.executeUpdate(sql, model.getSaleDate(), model.getPurchaseByCash(), model.getPurchaseByCredit(), model.getDiscount(), model.getStatus(), model.getEmployeeID(), model.getID());
    }

    public void updateStatus(SaleInvoice model) {
        String sql = "UPDATE HoaDonBanHang SET TrangThaiHDBan = ? Where MaHDBan = ?";
        JdbcHelper.executeUpdate(sql, ShareHelper.getStatus(), model.getID());
    }

    public List<SaleInvoice> select() {
        String sql = "SELECT * FROM HoaDonBanHang";
        return select(sql);
    }

    public SaleInvoice findById(String MaHDBan) {
        String sql = "SELECT * FROM HoaDonBanHang WHERE MaHDBan = ?";
        List<SaleInvoice> list = select(sql, MaHDBan);
        return list.size() > 0 ? list.get(0) : null;
    }

    public SaleInvoice findByEmployeeID(String EmployeeID) {
        String sql = "SELECT * FROM HoaDonBanHang WHERE MaNV = ?";
        List<SaleInvoice> list = select(sql, EmployeeID);
        return list.size() > 0 ? list.get(0) : null;
    }

    public String DatePurchaseByID(String InvoiceID) {
        String sql = "SELECT NgayBan FROM dbo.HoaDonBanHang WHERE MaHDBan = '" + InvoiceID + "'";
        ResultSet resultSet = JdbcHelper.executeQuery(sql);
        String date = null;
        try {
            while (resultSet.next()) {
                SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                return df.format(resultSet.getTimestamp("NgayBan"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PurchaseInvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return date;
    }

    private List<SaleInvoice> select(String sql, Object... args) {
        List<SaleInvoice> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JdbcHelper.executeQuery(sql, args);
                while (rs.next()) {
                    SaleInvoice model = readFromResultSet(rs);
                    list.add(model);
                }
            } finally {
                rs.getStatement().getConnection().close();
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return list;
    }

    private SaleInvoice readFromResultSet(ResultSet rs) throws SQLException {
        SaleInvoice model = new SaleInvoice();
        model.setID(rs.getString("MaHDBan"));
        model.setSaleDate(rs.getDate("NgayBan"));
        model.setPurchaseByCash(rs.getDouble("TTTienMat"));
        model.setPurchaseByCredit(rs.getDouble("TTThe"));
        model.setDiscount(rs.getInt("GiamGia"));
        model.setStatus(rs.getString("TrangThaiHDBan"));
        model.setEmployeeID(rs.getString("MaNV"));
        return model;
    }
}
