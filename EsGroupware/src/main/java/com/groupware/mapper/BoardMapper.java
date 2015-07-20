package com.groupware.mapper;

import java.util.HashMap;
import java.util.List;

import com.groupware.dto.Board;
import com.groupware.dto.BoardComment;

public interface BoardMapper {

	int insertBoard( Board board );

	/////////////////////////////조회하기 (목록조회하기)////////////////////////////
	List<Board> getBoardList(String classify);

	////////////////////////// 페이징 처리 (목록 조회)/////////////////////////////////////
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	List<Board> getBoardList(HashMap<String, Object> params);

	//*************** 페이징 처리 (목록 조회 - title(제목)으로 조회)
	List<Board> getBoardListByTitle(HashMap<String, Object> params);

	//*************** 페이징 처리 (목록 조회 - id(작성자)으로 조회)
	List<Board> getBoardListById(HashMap<String, Object> params);


	//*********게시판 전체 게시글 수  조회하는 작업***************
	int getBoardCount(String classify);

	int getBoardCountByTitle(HashMap<String, Object> params);

	int getBoardCountById(HashMap<String, Object> params);

	//*********** 게시글 (Board) list 보여주기 [view]작업  ************
	Board getBoardByBoardNo(HashMap<String, Object> params);

	//*************게시글 삭제
	int deleteBoard(int boardNo);

	//************ 게시글 수정  (편집)? 
	void updateBoard(HashMap<String, Object> params);
	void updateReadCount(HashMap<String, Object> params);
	//******************댓글쓰기
	void insertBoardReply(Board board);

	//********view 부분에 comment달기 작업
	void insertBoardComment(BoardComment comment);

	//*********
	List<BoardComment> getBoardCommentListByBoardNo(int boardNo);

	//*********comment 삭제

	int deleteComment(int commentNo);

	//**************comment 수정

	void updateComment(BoardComment comment);

}