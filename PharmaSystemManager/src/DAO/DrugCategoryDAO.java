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
import model.DrugCategory;

/**
 *
 * @author rondw
 */
public class DrugCategoryDAO {

    public void insert(DrugCategory model) {
        String sql = "INSERT INTO LoaiThuoc (MaLoaiThuoc, TenLoaiThuoc, MoTa) VALUES (?, ?, ?)";
        JdbcHelper.executeUpdate(sql, model.getDrugCategoryID(), model.getDrugCategoryName(), model.getDescription());
    }

    public void update(DrugCategory model) {
        String sql = "UPDATE LoaiThuoc SET TenLoaiThuoc = ?, MoTa = ? WHERE MaLoaiThuoc = ?";
        JdbcHelper.executeUpdate(sql, model.getDrugCategoryName(), model.getDescription(), model.getDrugCategoryID());
    }

    public List<DrugCategory> select() {
        String sql = "SELECT * FROM LoaiThuoc";
        return select(sql);
    }

    public DrugCategory findById(String MaLoaiThuoc) {
        String sql = "SELECT * FROM LoaiThuoc WHERE MaLoaiThuoc = ?";
        List<DrugCategory> list = select(sql, MaLoaiThuoc);
        return list.size() > 0 ? list.get(0) : null;
    }

    private List<DrugCategory> select(String sql, Object... args) {
        List<DrugCategory> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JdbcHelper.executeQuery(sql, args);
                while (rs.next()) {
                    DrugCategory model = readFromResultSet(rs);
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

    private DrugCategory readFromResultSet(ResultSet rs) throws SQLException {
        DrugCategory model = new DrugCategory();
        model.setDrugCategoryID(rs.getString("MaLoaiThuoc"));
        model.setDrugCategoryName(rs.getString("TenLoaiThuoc"));
        model.setDescription(rs.getString("MoTa"));
        return model;
    }
}
