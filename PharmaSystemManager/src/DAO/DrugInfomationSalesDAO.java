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
import model.DrugInfomation;

/**
 *
 * @author longd
 */
public class DrugInfomationSalesDAO {

    public List<DrugInfomation> select() {
        String sql = "SELECT * FROM THUOC\n"
                + "JOIN THUOCTRONGKHO ON THUOC.TENTHUOC = THUOC.MATHUOC\n where madaily='" +ShareHelper.Branch
                + "' group by mathuoc";
        return select(sql);
    }
    
    public List<DrugInfomation> findByID(String drugInfo) {
        String sql = "SELECT * FROM THUOC\n"
                + "JOIN THUOCTRONGKHO ON THUOCTRONGKHO.MATHUOC = THUOC.MATHUOC\n"
                + "WHERE madaily='" +ShareHelper.Branch.getBranchID()+"' and soluongton>0 and (THUOC.TENTHUOC LIKE '%" + drugInfo + "%' OR THUOCTRONGKHO.MATHUOC LIKE '%"+drugInfo+"%' or TENKHOAHOC LIKE '%" +drugInfo+"%' or nhasx like '%" +drugInfo+"%' )";
        return select(sql);
    }
    
    public List<DrugInfomation> findByInvoice(String InvoiceNo) {
        String sql = "SELECT TTK.MATHUOC, THUOC.TENTHUOC, MALOHANG, GIANHAP, GIABAN, NGAYNHAPHANG, NGAYHETHAN, NHASX, DONVITINH, HCT.SOLUONG AS soluongton, HCT.IDTHUOC FROM THUOC\n"
                + "JOIN THUOCTRONGKHO TTK ON TTK.MATHUOC = THUOC.MATHUOC JOIN HOADONBANHANGCHITIET HCT ON TTK.IDTHUOC= HCT.IDTHUOC JOIN HOADONBANHANG HB ON HB.MAHDBAN=HCT.MAHDBAN"
                + " WHERE madaily='" +ShareHelper.Branch.getBranchID()+"' and HB.MAHDBAN='"+InvoiceNo+"'";
        return select(sql);
    }
    
    public DrugInfomation findById(String ID) {
        String sql = "SELECT * FROM THUOC\n"
                + "JOIN THUOCTRONGKHO ON THUOCTRONGKHO.MATHUOC = THUOC.MATHUOC\n"
                + "WHERE madaily = '" +ShareHelper.Branch.getBranchID()+"' and soluongton>0 AND thuoctrongkho.maTHUOC= '"+ID+"'";
        List<DrugInfomation> list = select(sql);
        return list.size() > 0 ? list.get(0) : null;
    }
    
    public int findMax(int ID) {
        String sql = "SELECT * from THUOC\n"
                + "JOIN THUOCTRONGKHO ON THUOCTRONGKHO.MATHUOC = THUOC.MATHUOC WHERE madaily = '" +ShareHelper.Branch.getBranchID()+"' and idthuoc= "+ID+" and soluongton>0 ";
        List<DrugInfomation> list = select(sql);
        return list.size() > 0 ? list.get(0).getQuantity() : 0;
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
            ex.printStackTrace();
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
        model.setDrugNumber(rs.getInt("IDTHUOC"));
        return model;
    }
}
