package com.fr.jsp.admin.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.admin.model.dao.AdminNoticeBoardDao;
import com.fr.jsp.board.model.vo.NoticeBoard;

public class AdminNoticeBoardService {
	private Connection con;
	private AdminNoticeBoardDao anbDao;
	
	public AdminNoticeBoardService() {
		super();
		con = getConnection();
		anbDao = new AdminNoticeBoardDao();
	}
	// Connection close Method
	public void closeCon(){
		close(con);
	}
	// 공지사항 게시판 리스트
	public ArrayList<NoticeBoard> admin_noticeBoardAllList() {
		ArrayList<NoticeBoard> admin_noticeBoardAllList = anbDao.admin_noticeBoardAllList(con);
		return admin_noticeBoardAllList;
	}
	// 공지사항 등록
	public void admin_insertNoticeBoard(NoticeBoard noticeBoard) {
		int insertNoticeBoardCount = anbDao.admin_insertNoticeBoard(con, noticeBoard);
		if(insertNoticeBoardCount>0) commit(con);
		else rollback(con);
	}
	// 공지사항 수정
	public void admin_updateNoticeBoard(NoticeBoard noticeBoard) {
		int updateNoticeBoardCount = anbDao.admin_updateNoticeBoard(con, noticeBoard);
		if(updateNoticeBoardCount>0) commit(con);
		else rollback(con);
	}

}
