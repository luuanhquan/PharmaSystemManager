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
import model.Branch;

/**
 *
 * @author Long
 */
public class BranchDAO {

    public void insert(Branch model) {
        String sql = "INSERT INTO DaiLy (MaDaiLy, TenDaiLy, EmailDaiLy, SDTDaiLy, DiaChiDaiLy, ThanhPhoDaiLy, TrangThaiDaiLy) VALUES (?, ?, ?, ?, ?, ?, ?)";
        JdbcHelper.executeUpdate(sql, model.getBranchID(), model.getBranchName(), model.getEmail(),
                model.getPhone(), model.getAddress(), model.getCity(), model.getStatus());
    }

    public void update(Branch model) {
        String sql = "UPDATE DaiLy SET TenDaiLy = ?, EmailDaiLy = ?, SDTDaiLy = ?, DiaChiDaiLy = ?, ThanhPhoDaiLy = ?, TrangThaiDaiLy = ? WHERE MaDaiLy = ?";
        JdbcHelper.executeUpdate(sql, model.getBranchName(), model.getEmail(), model.getPhone(),
                model.getAddress(), model.getCity(), model.getStatus(), model.getBranchID());
    }

    public void updateStatus(Branch model) {
        String sql = "UPDATE DaiLy SET TrangThaiDaiLy = ? Where MaDaiLy = ?";
        JdbcHelper.executeUpdate(sql, ShareHelper.getStatus(), model.getBranchID());
    }

    public void delete(String MaDaiLy) {
        String sql = "DELETE FROM DaiLy WHERE MaDaiLy = ?";
        JdbcHelper.executeUpdate(sql, MaDaiLy);
    }

    public List<Branch> select() {
        String sql = "SELECT * FROM DaiLy";
        return select(sql);
    }

    public Branch findById(String maDaiLy) {
        String sql = "SELECT * FROM DaiLy WHERE MaDaiLy = ?";
        List<Branch> list = select(sql, maDaiLy);
        return list.size() > 0 ? list.get(0) : null;
    }

    private List<Branch> select(String sql, Object... args) {
        List<Branch> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JdbcHelper.executeQuery(sql, args);
                while (rs.next()) {
                    Branch model = readFromResultSet(rs);
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

    private Branch readFromResultSet(ResultSet rs) throws SQLException {
        Branch model = new Branch();
        model.setBranchID(rs.getString("MaDaiLy"));
        model.setBranchName(rs.getString("TenDaiLy"));
        model.setEmail(rs.getString("EmailDaiLy"));
        model.setPhone(rs.getString("SDTDaiLy"));
        model.setAddress(rs.getString("DiaChiDaiLy"));
        model.setCity(rs.getString("ThanhPhoDaiLy"));
        model.setStatus(rs.getString("TrangThaiDaiLy"));
        return model;
    }

}
