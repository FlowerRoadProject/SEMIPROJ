package com.fr.jsp.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.fr.jdbc.common.JDBCTemplate.*;
import com.fr.jsp.board.model.vo.FaqBoard;


public class FaqBoardDao implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8925654L;
	
	private Properties prop;
	
	public FaqBoardDao(){
		prop = new Properties();
		String fileName = FaqBoardDao.class.getResource("/config/board/faq.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	public ArrayList<FaqBoard> showFaq(Connection con){
		System.out.println("Dao 입장");
		Statement stmt= null;
		ResultSet rset = null;
		FaqBoard faq;
		ArrayList<FaqBoard> list = new ArrayList<FaqBoard>();
		
		String sql = prop.getProperty("showFaq");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			//String bNum, String bTitle, String bContent, String contentCategory
			while(rset.next()){
				faq = new FaqBoard(rset.getInt("BNUM"), rset.getString("BTITLE"), rset.getString("BCONTENT"), rset.getString("CONTENT_CATEGORY"));
				list.add(faq);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		System.out.println("Dao 완료");
		
		return list;	
		
	}
	
}
