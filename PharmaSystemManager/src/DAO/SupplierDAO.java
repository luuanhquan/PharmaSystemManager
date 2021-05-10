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
import java.util.ArrayList;
import java.util.List;
import model.Supplier;

/**
 *
 * @author rondw
 */
public class SupplierDAO {

    public void insert(Supplier model) {
        String sql = "INSERT INTO NhaCungCap ( TenNCC, EmailNCC, SDTNCC, DiaChiNCC, ThanhPhoNCC, Mota, TrangThaiNCC) VALUES ( ?, ?, ?, ?, ?, ?, ?)";
        JdbcHelper.executeUpdate(sql, model.getName(), model.getEmail(), model.getPhoneNumber(), model.getAddress(), model.getCity(), model.getDescription(), model.getStatus());
    }

    public void update(Supplier model) {
        String sql = "UPDATE NhaCungCap SET TenNCC = ?, EmailNCC = ?, SDTNCC = ?, DiaChiNCC = ?, ThanhPhoNCC = ?, Mota = ?, TrangThaiNCC = ? WHERE MaNCC = ?";
        JdbcHelper.executeUpdate(sql, model.getName(), model.getEmail(), model.getPhoneNumber(), model.getAddress(), model.getCity(), model.getDescription(), model.getStatus(), model.getID());
    }

    public void updateStatus(Supplier model) {
        String sql = "UPDATE NhaCungCap SET TrangThaiNCC = ? Where MaNCC = ?";
        JdbcHelper.executeUpdate(sql, ShareHelper.getStatus(), model.getID());
    }

    public List<Supplier> select() {
        String sql = "SELECT * FROM NhaCungCap";
        return select(sql);
    }

    public Supplier findById(String supplierID) {
        String sql = "SELECT * FROM NhaCungCap WHERE MaNCC = ?";
        List<Supplier> list = select(sql, supplierID);
        return list.size() > 0 ? list.get(0) : null;
    }

    private List<Supplier> select(String sql, Object... args) {
        List<Supplier> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JdbcHelper.executeQuery(sql, args);
                while (rs.next()) {
                    Supplier model = readFromResultSet(rs);
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

    private Supplier readFromResultSet(ResultSet rs) throws SQLException {
        Supplier model = new Supplier();
        model.setID(rs.getString("MaNCC"));
        model.setName(rs.getString("TenNCC"));
        model.setEmail(rs.getString("EmailNCC"));
        model.setPhoneNumber(rs.getString("SDTNCC"));
        model.setAddress(rs.getString("DiaChiNCC"));
        model.setCity(rs.getString("ThanhPhoNCC"));
        model.setDescription(rs.getString("Mota"));
        model.setStatus(rs.getString("TrangThaiNCC"));
        return model;
    }
}
