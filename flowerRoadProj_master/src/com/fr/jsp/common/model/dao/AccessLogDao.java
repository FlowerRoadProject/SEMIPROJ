package com.fr.jsp.common.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Properties;

import com.fr.jsp.product.model.dao.ProductDao;


public class AccessLogDao {

	private Properties prop;
	
	public AccessLogDao(){
		
		prop=new Properties();
		
		String fileName = ProductDao.class.getResource("/config/common/accesslog-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			System.out.println("accesslog-query.properties 파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int insertLog(Connection con, String memberNum, Timestamp timeStamp) {
		PreparedStatement pstmt=null;
		int result= 0;
		
		try{
			pstmt = con.prepareStatement(prop.getProperty("insertLog"));
			
			pstmt.setString(1, memberNum);
			pstmt.setTimestamp(2, timeStamp);
			
			result =  pstmt.executeUpdate();
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			
			close(pstmt);
		}
		
		return result;
		
	}

	
	
}
