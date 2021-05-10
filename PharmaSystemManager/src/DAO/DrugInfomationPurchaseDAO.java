/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import helper.JdbcHelper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.DrugInfomation;

/**
 *
 * @author longd
 */
public class DrugInfomationPurchaseDAO {

    public List<DrugInfomation> select() {
        String sql = "SELECT * FROM THUOC\n"
                + "JOIN THUOCTRONGKHO ON THUOC.TENTHUOC = THUOC.MATHUOC\n"
                + "ORDER BY NGAYHETHAN ASC";
        return select(sql);
    }
    
    public List<DrugInfomation> findByID(String drugInfo) {
        String sql = "SELECT * FROM THUOC\n"
                + "JOIN THUOCTRONGKHO ON THUOCTRONGKHO.MATHUOC = THUOC.MATHUOC\n"
                + "WHERE THUOC.TENTHUOC LIKE '%" + drugInfo + "%' OR THUOCTRONGKHO.MATHUOC LIKE '%"+drugInfo+"%' or TENKHOAHOC LIKE '%" +drugInfo+"%' or nhasx like '%" +drugInfo+"%' "
                + " ORDER BY NGAYHETHAN ASC";
        return select(sql);
    }

    private List<DrugInfomation> select(String sql, Object... args) {
        List<DrugInfomation> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JdbcHelper.executeQuery(sql, args);
                while (rs.next()) {
                    DrugInfomation model = readFromResultSet(rs);
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

    private DrugInfomation readFromResultSet(ResultSet rs) throws SQLException {
        DrugInfomation model = new DrugInfomation();
        model.setDrugID(rs.getString("MATHUOC"));
        model.setDrugName(rs.getString("TENTHUOC"));
        model.setBatchNo(rs.getString("MALOHANG"));
        model.setPurchasePrice(rs.getDouble("GIANHAP"));
        model.setSalePrice(rs.getDouble("GIABAN"));
        model.setImportDate(rs.getDate("NGAYNHAPHANG"));
        model.setExpirationDate(rs.getDate("NGAYHETHAN"));
        model.setManufactured(rs.getString("NhaSX"));
        model.setUnit(rs.getString("donvitinh"));
        model.setQuantity(rs.getInt("Soluongton"));
        return model;
    }
}
