package com.fr.jsp.board.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.board.model.vo.FaqBoard;

public class UserQuestionBoardDao {
	private Properties prop;

	public UserQuestionBoardDao() {
		super();
		prop = new Properties();
		String fileName = ReviewBoardDao.class.getResource("/config/board/userQuestionBoard_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
