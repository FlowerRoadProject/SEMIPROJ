package com.fr.jsp.board.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.board.model.dao.ReviewBoardDao;
import com.fr.jsp.board.model.vo.ReviewBoard;
import com.fr.jsp.common.PageInfo;

public class ReviewBoardService {
	
	private Connection con;
	private ReviewBoardDao rbDao;
	
	public ReviewBoardService(){
		rbDao =new ReviewBoardDao();
		
	}
	
	public ArrayList<ReviewBoard> selectReviewList(String pno) {

		con = getConnection();

		ArrayList<ReviewBoard> list = null;

		

		list = rbDao.selectReviewList(con, pno);

		if (list != null)
			commit(con);
		else
			rollback(con);

		return list;
	}

	public int insertReview(ReviewBoard rb) {

		con = getConnection();

		int result = 0;

		

		result = rbDao.insertReview(con, rb);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		return result;

	}

	public int getListCount(String pno) {

		con = getConnection();

		int result = 0;

		

		result = rbDao.getListCount(con,pno);

		close(con);

		return result;
	}
	
	public int getListCount() {

		con = getConnection();

		int result = 0;

	
		result = rbDao.getListCount(con);

		close(con);

		return result;
	}

	public ArrayList<ReviewBoard> selectList(String pno, PageInfo pi) {
		
		con = getConnection();
		ArrayList<ReviewBoard> list =rbDao.selectList(con,pno,pi);
		
		if(list!=null) commit(con);
		else rollback(con);
		
		close(con);
		
		return list;
	}
		
		// Connection close Method
		public void closeCon(){
			close(con);
		}

}
