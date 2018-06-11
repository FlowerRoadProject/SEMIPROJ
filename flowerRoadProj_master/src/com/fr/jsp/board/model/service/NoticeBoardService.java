package com.fr.jsp.board.model.service;

import static com.fr.jdbc.common.JDBCTemplate.*;

import java.sql.*;
import java.util.*;
import com.fr.jsp.board.model.dao.NoticeBoardDao;
import com.fr.jsp.board.model.vo.NoticeBoard;

public class NoticeBoardService {

	private Connection con;
	
	public NoticeBoardService(){
		con = getConnection();
	}
	
	public ArrayList<NoticeBoard> showNotice(int currentPage, int limit){
		ArrayList<NoticeBoard> list = new NoticeBoardDao().showNotice(con, currentPage, limit);
		close(con);
		return list;
	}
	
	public int getListCount(){
		int result = new NoticeBoardDao().getListCount(con);
		close(con);
		return result;		
	}
	
	public NoticeBoard showContent(int bNum){
		NoticeBoard notice = new NoticeBoardDao().showContent(con, bNum);
		close(con);
		return notice;
	}

	 public int updateContent(int bNum, String bTitle, String bContent){
		 int result = 0;
		 result = new NoticeBoardDao().updateContent(con, bNum, bTitle, bContent);
		 
		 if(result >0) commit(con);
		 else rollback(con);
		 
		 close(con);
		 return result;
		 
		 
	 }
	 
	 public int deleteNotice(int bNum){
		 int result = new NoticeBoardDao().deleteNotice(con, bNum);
		 
		 if(result >0) commit(con);
		 else rollback(con);
		 
		 close(con);
		 return result;
	 }

	public int updateCount(int bNum) {
		Connection con = getConnection();
		int result = new NoticeBoardDao().updateCount(con, bNum);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
