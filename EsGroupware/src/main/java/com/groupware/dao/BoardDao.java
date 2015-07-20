package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import com.groupware.dto.Board;
import com.groupware.dto.BoardComment;

public interface BoardDao {

	int insertBoard(Board board);

	/////////////////////////////조회하기 (목록조회하기)/////////////////////////////////////////////
	//List<Board> getBoardList(String classify);

	////////////////////////// 페이징 처리 (목록 조회)/////////////////////////////////////
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	List<Board> getBoardList(int first, int last, String classify);
	void updateReadCount(int board_no,String classify);
	//////
	//*************** 페이징 처리 (목록 조회 - title(제목)으로 조회)
	List<Board> getBoardListByTitle(int first, int last, String title,
			String classify);

	///
	//*************** 페이징 처리 (목록 조회 - id(작성자)으로 조회)
	List<Board> getBoardListById(int first, int last, String id, String classify);

	///////////////////////////////////////////////////////////////////////////////

	//*********게시판 전체 게시글 수  조회하는 작업***************
	int getBoardCount(String classify);

	int getBoardCountByTitle(String title, String classify);

	int getBoardCountById(String id, String classify);

	//////////////////////////////////////////////////////////
	//*********** 게시글 (Board) list 보여주기 [view]작업  ************
	Board getBoardByBoardNo(int boardNo, String classify);

	///////////////////////////////////////////////////////////////
	//*************게시글 삭제
	
	void deleteBoard(int boardNo);

	//////////////////////////////////////////////////////////////////
	//************ 게시글 수정  (편집)? 
	void updateBoard(Board board);

	////////////////////////////////////////////////////////////////////////
	//******************댓글쓰기
	void insertBoardReply(Board board);

	///////////////////////////////////////////////////////////////
	//********view 부분에 comment달기 작업
	void insertBoardComment(BoardComment comment);

	///////////////////////////////////////////////////////////
	//*********
	List<BoardComment> getBoardCommentListByBoardNo(int boardNo);

	////////////////////////////////////////////////////////////////
	//*********comment 삭제

	void deleteComment(int commentNo);

	/////////////////////////////////////////////////////////////////////
	//**************comment 수정

	void updateComment(BoardComment comment);

}