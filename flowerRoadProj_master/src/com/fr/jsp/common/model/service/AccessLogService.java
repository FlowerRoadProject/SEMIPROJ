package com.fr.jsp.common.model.service;

import static com.fr.jdbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Timestamp;

import com.fr.jsp.common.model.dao.AccessLogDao;

public class AccessLogService {

	public int insertLog(String memberNum) {
		
		Connection con = getConnection();
		int result = 0;
		
		 Timestamp timeStamp = new Timestamp(new java.util.Date().getTime());
		 result =  new AccessLogDao().insertLog(con,memberNum,timeStamp);
		 
		
		 
		 
		
		 if(result>0)
			 commit(con);
		 else
			 rollback(con);
		 
		 return result;
		 
		
	}

	
	
}
