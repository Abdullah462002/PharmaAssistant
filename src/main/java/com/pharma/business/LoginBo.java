package com.pharma.business;

import com.pharma.bean.User;
import com.pharma.dao.LoginDao;
import com.pharma.exception.InvalidUserException;

public class LoginBo {

	public boolean validateUser(User u) throws InvalidUserException {
		
		var ldao= new LoginDao();
		User uu=ldao.userValidation(u);
		
		if(uu!=null && u.pass().equals(uu.pass())) {
			return true;
		}
		throw new InvalidUserException("*Invalid Username or password");
	}
	
}
