/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import helper.JdbcHelper;
import helper.ShareHelper;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Employee;

/**
 *
 * @author Long
 */
public class EmployeeDAO {

    public void insert(Employee model) {
        String sql = "INSERT INTO NhanVien (MaNV, MatKhau, VaiTro, HoVaTen, NgaySinh, NgayLamViec, SDTNV, EmailNV, DiaChiNV, TrangThaiNV, Hinh, MaDaiLy) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        JdbcHelper.executeUpdate(sql, model.getEmployeeID(), model.getPassword(), model.isRole(), model.getName(), model.getDateOfBirth(),
                model.getStartDate(), model.getPhone(), model.getEmail(), model.getAddress(), model.getStatus(), model.getAvatar(), model.getStoreID());
    }

    public void update(Employee model) {
        String sql = "UPDATE NhanVien SET MatKhau = ?, VaiTro = ?, HoVaTen = ?, NgaySinh = ?, NgayLamViec = ?, SDTNV = ?, EmailNV = ?, DiaChiNV = ?, TrangThaiNV = ?, Hinh = ?, MaDaiLy = ? WHERE MaNV = ?";
        JdbcHelper.executeUpdate(sql, model.getPassword(), model.isRole(), model.getName(), model.getDateOfBirth(),
                model.getStartDate(), model.getPhone(), model.getEmail(), model.getAddress(), model.getStatus(), model.getAvatar(), model.getStoreID(), model.getEmployeeID());
    }

    public void updateStatus(Employee model) {
        String sql = "UPDATE NhanVien SET TrangThaiNV = ? Where MaNV = ?";
        JdbcHelper.executeUpdate(sql, ShareHelper.getStatus(), model.getEmployeeID());
    }

    public List<Employee> select() {
        String sql = "SELECT * FROM NhanVien";
        return select(sql);
    }

    public Employee findById(String manv) {
        String sql = "SELECT * FROM NhanVien WHERE MaNV = ?";
        List<Employee> list = select(sql, manv);
        return list.size() > 0 ? list.get(0) : null;
    }

    public List<Employee> findByBranch(String maDaiLy) {
        String sql = "SELECT * FROM NhanVien WHERE MaDaiLy = ?";
        List<Employee> list = select(sql, maDaiLy);
        return list;
    }

    private List<Employee> select(String sql, Object... args) {
        List<Employee> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JdbcHelper.executeQuery(sql, args);
                while (rs.next()) {
                    Employee model = readFromResultSet(rs);
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

    private Employee readFromResultSet(ResultSet rs) throws SQLException {
        Employee model = new Employee();
        model.setEmployeeID(rs.getString("MaNV"));
        model.setPassword(rs.getString("MatKhau"));
        model.setRole(rs.getBoolean("VaiTro"));
        model.setName(rs.getString("HoVaTen"));
        model.setDateOfBirth(rs.getDate("NgaySinh"));
        model.setStartDate(rs.getDate("NgayLamViec"));
        model.setPhone(rs.getString("SDTNV"));
        model.setEmail(rs.getString("EmailNV"));
        model.setAddress(rs.getString("DiaChiNV"));
        model.setStatus(rs.getString("TrangThaiNV"));
        model.setAvatar(rs.getBytes("Hinh"));
        model.setStoreID(rs.getString("MaDaiLy"));
        return model;
    }
}
