package com.pharma.business;

import java.util.List;

import com.pharma.bean.Medicine;
import com.pharma.dao.MedicinesDao;
import com.pharma.exception.DuplicateException;
import com.pharma.exception.NotFoundException;

public class MedicineBo {

	MedicinesDao meddao=new MedicinesDao();
	public boolean addMedBatch(Medicine m) throws DuplicateException {
		return meddao.addMedBatch(m);
	}
	public List<Medicine> getMed(String bCode) throws NotFoundException {
		return meddao.getMed(bCode);
	}
	public List<Medicine> getAllMed() {
		return meddao.getAllMed();
	}
	public boolean updateMed(Medicine m) throws NotFoundException {
		return meddao.updateMed(m);
	}
	public boolean delMed(String bCode) throws NotFoundException {
		return meddao.deleteMed(bCode);
	}
	public List<String> getAllMedCode() {
		return meddao.getAllMedCode();
	}
}
