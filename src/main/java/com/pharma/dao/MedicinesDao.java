package com.pharma.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pharma.bean.Medicine;
import com.pharma.constants.QueryConstants;
import com.pharma.exception.DuplicateException;
import com.pharma.exception.NotFoundException;
import com.pharma.util.DbUtil;


public class MedicinesDao {

	Connection conn = DbUtil.getConnection();
	PreparedStatement ps = null;
	ResultSet rs = null;

	public boolean addMedBatch(Medicine med) throws DuplicateException {
		try {
			ps = conn.prepareStatement(QueryConstants.ADDSQL);
			ps.setString(1, med.batchCode());
			ps.setString(2, med.medicineCode());
			ps.setString(3, med.weight());
			ps.setString(4, med.price());
			ps.setString(5, med.medicineType());
			ps.setString(6, med.refrigeration());
			ps.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new DuplicateException("No Duplicate Batch Code");
		}

	}

	public List<Medicine> getMed(String bCode) throws NotFoundException {

		try {
			ps = conn.prepareStatement(QueryConstants.SEARCHSQL);
			ps.setString(1, bCode);
			rs = ps.executeQuery();
			var li = new ArrayList<Medicine>();
			Medicine m = null;
			while (rs.next()) {
				m = new Medicine(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6));
				li.add(m);
			}
			return li;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new NotFoundException("Batch Code not found");
		}
	}

	public List<Medicine> getAllMed() {
		var li = new ArrayList<Medicine>();
		try {
			ps = conn.prepareStatement(QueryConstants.SHOWSQL);
			rs = ps.executeQuery();

			Medicine d = null;
			while (rs.next()) {
				d = new Medicine(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6));
				li.add(d);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	public boolean updateMed(Medicine med) throws NotFoundException {

		try {
			ps = conn.prepareStatement(QueryConstants.UPDATESQL);
			ps.setString(1, med.medicineCode());
			ps.setString(2, med.weight());
			ps.setString(3, med.price());
			ps.setString(4, med.medicineType());
			ps.setString(5, med.refrigeration());
			ps.setString(6, med.batchCode());
			ps.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new NotFoundException(med.batchCode() + " Not Exist");
		}
	}

	public boolean deleteMed(String bCode) throws NotFoundException {

		try {
			ps = conn.prepareStatement(QueryConstants.DELETESQL);
			ps.setString(1, bCode);
			int n = ps.executeUpdate();
			return (n == 1);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new NotFoundException("Batch Code " + bCode + " not exist");
		}
	}
	public List<String> getAllMedCode() {
		var li = new ArrayList<String>();
		try {
			ps = conn.prepareStatement(QueryConstants.MEDLI);
			rs = ps.executeQuery();

			while (rs.next()) {
				li.add(rs.getString(1));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
}
