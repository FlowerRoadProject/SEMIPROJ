package com.fr.jsp.board.model.service;

import static com.fr.jdbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.board.model.dao.FaqBoardDao;
import com.fr.jsp.board.model.vo.FaqBoard;

public class FaqBoardService {

	private Connection con;
	
	public FaqBoardService(){
		con = getConnection();
	}
	
	public ArrayList<FaqBoard> showFaq(){	
		//System.out.println("service완료");
		ArrayList<FaqBoard> list = new FaqBoardDao().showFaq(con);
		close(con);
		return list;
	}
}
