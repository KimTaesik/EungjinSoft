package com.groupware.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.groupware.dto.Board;
import com.groupware.dto.BoardComment;
import com.groupware.mapper.BoardMapper;

@Component(value="boardDao")
public class OracleBoardDao implements BoardDao {
	private final String dsn = "oracle";
	
	private BoardMapper boardMapper;
	@Autowired
	@Qualifier("boardMapper")
	public void setBoardMapper(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}
	@Override
	public int insertBoard(Board board ) { 
	
		
//		String sequence=null;
//		String sequencecurrval=null;
//		if(board.getClassify().equals("1"))
//		{
//			sequence="boardnotice_sequence.nextval";
//			sequencecurrval="boardnotice_sequence.currval";
//		}
//		else if(board.getClassify().equals("2"))
//		{
//			sequence="boardsystemnotice_sequence.nextval";
//			sequencecurrval="boardsystemnotice_sequence.currval";
//		}
//		else if(board.getClassify().equals("3"))
//		{
//			sequence="boardfree_sequence.nextval";
//			sequencecurrval="boardfree_sequence.currval";
//		}
//		else if(board.getClassify().equals("4"))
//		{
//			sequence="boardreference_sequence.nextval";	
//			sequencecurrval="boardreference_sequence.currval";
//		}
//		HashMap<String, Object> params = new HashMap<String, Object>();
//		params.put("sequence", sequence);
//		params.put("sequencecurrval", sequencecurrval);
//		params.put("board",board);
	
			
		boardMapper.insertBoard(board);
		
		return 0;
	}
	
/////////////////////////////조회하기 (목록조회하기)/////////////////////////////////////////////

//	@Override
//	public List<Board> getBoardList(String classify) {
//	
//		List<Board> boards = boardMapper.getBoardList(classify);
//		return boards;
//	}

//////////////////////////페이징 처리 (목록 조회)/////////////////////////////////////
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	@Override
	public List<Board> getBoardList(int first, int last ,String classify) {
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("first", first);
	params.put("last", last);
	params.put("classify", classify);
	
	return	boardMapper.getBoardList(params);
}
	
	//*************** 페이징 처리 (목록 조회 - title(제목)으로 조회)
	@Override
	public List<Board> getBoardListByTitle(int first, int last, String title ,String classify) {

	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("first", first);
	params.put("last", last);
	params.put("title", title);
	params.put("classify", classify);
	return boardMapper.getBoardListByTitle(params);
	}

	//*************** 페이징 처리 (목록 조회 - id(작성자)으로 조회)
	@Override
	public List<Board> getBoardListById(int first, int last, String id ,String classify) {
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("first", first);
	params.put("last", last);
	params.put("id", id);
	params.put("classify", classify);
	return boardMapper.getBoardListById(params);
	}
	
	//*********게시판 전체 게시글 수  조회하는 작업***************
	@Override
	public int getBoardCount(String classify) {
	
	return boardMapper.getBoardCount(classify);
	}	
	
	//*********검색해서, 검색조건에 맞는 게시판 게시글 수 (title)로 조회하는 작업***************
	@Override
	public int getBoardCountByTitle(String title,String classify) {
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("title", title);
	params.put("classify", classify);
	return boardMapper.getBoardCountByTitle(params);
	}	
	
	////
	//*********검색해서, 검색조건에 맞는 게시판 게시글 수 (id)로 조회하는 작업***************
	
	@Override
	public int getBoardCountById(String id,String classify) {
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("id", id);
	params.put("classify", classify);
	return boardMapper.getBoardCountById(params);
	}	
	
	
	//*********** 게시글 (Board) list 보여주기 [view]작업  ************
	@Override
	public Board getBoardByBoardNo(int boardNo,String classify) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("boardno", boardNo);
		params.put("classify", classify);
		
		return  boardMapper.getBoardByBoardNo(params);
	}
	
	///////////////////////////////////////////////////////////////
	//*************게시글 삭제

	@Override
	public void deleteBoard(int boardNo) {
	
	boardMapper.deleteBoard(boardNo);
	}

	//************ 게시글 수정  (편집)? 
	@Override
	public void updateBoard(Board board) {
		HashMap<String, Object> params =new HashMap<String, Object>();
		params.put("title",board.getTitle());
		params.put("content",board.getContent());
		params.put("boardno",board.getBoardNo());
		boardMapper.updateBoard(params);
		  
	}
	////////////////////////////////////////////////////////////////////////
	//******************댓글쓰기
	@Override
	public void insertBoardReply(Board board) { 
		
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 String sequence=null;
			String sequencecurrval=null;
		try {

			Board parent = getBoardByBoardNo(board.getBoardNo(),board.getClassify());
			System.out.println(parent.getGroupNo());
			conn = ConnectionHelper.getConnection(dsn);
			
			String sql= "UPDATE board SET step=step+1 " + " WHERE groupno=? AND step > ? and classify= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parent.getGroupNo());
			
			pstmt.setInt(2, parent.getStep());
			pstmt.setString(3,board.getClassify());
			pstmt.executeUpdate();
			pstmt.close();
			
			if(board.getClassify().equals("1"))
			{
				sequence="boardnotice_sequence.nextval";
				sequencecurrval="boardnotice_sequence.currval";
			}
			else if(board.getClassify().equals("2"))
			{
				sequence="boardsystemnotice_sequence.nextval";
				sequencecurrval="boardsystemnotice_sequence.currval";
			}
			else if(board.getClassify().equals("3"))
			{
				sequence="boardfree_sequence.nextval";
				sequencecurrval="boardfree_sequence.currval";
			}
			else if(board.getClassify().equals("4"))
			{
				sequence="boardreference_sequence.nextval";	
				sequencecurrval="boardreference_sequence.currval";
			}
			
			sql = "INSERT INTO board (board_no,boardno, title, id, content, groupno, step,depth,classify) "
					+ "VALUES (board_sequence.nextval,"+sequence+",?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, parent.getGroupNo());
			pstmt.setInt(5, parent.getStep()+1);
			pstmt.setInt(6, parent.getDepth()+1);
			pstmt.setString(7, parent.getClassify());
			
			pstmt.executeUpdate();
			
			
		}catch (SQLException ex) {
			ex.printStackTrace();
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}	
	}
	///////////////////////////////////////////////////////////////
	//********view 부분에 comment달기 작업
	@Override
	public void insertBoardComment(BoardComment comment) { 
		
	boardMapper.insertBoardComment(comment);
	
	}
	///////////////////////////////////////////////////////////
	//*********
	@Override
	public List<BoardComment> getBoardCommentListByBoardNo(int boardNo) {
		 
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		
	 ArrayList<BoardComment> comments = new ArrayList<BoardComment>();
	 try {
		  
		  	conn = ConnectionHelper.getConnection(dsn);
		  
			StringBuilder sql = new StringBuilder(200);
			sql.append("SELECT ")
			   .append("      commentno, board_no, id, content, regdate ")
			   .append("      FROM boardcomment ")
			   .append("	  WHERE board_no= ?");	
			   
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1,boardNo);
			rs=pstmt.executeQuery();
			
			while (rs.next()) { 
				BoardComment comment = new BoardComment();
				comment.setCommentNo(rs.getInt(1));
				comment.setBoard_No(rs.getInt(2));  
				comment.setWriter(rs.getString(3));
				comment.setContent(rs.getString(4));
				comment.setRegDate(rs.getDate(5));
				
				comments.add(comment);
			}
		}catch (SQLException ex) {
			ex.printStackTrace();
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}	
		return comments;
	}
	////////////////////////////////////////////////////////////////
	//*********comment 삭제
	
	@Override
	public void deleteComment(int commentNo) {
	
	boardMapper.deleteComment(commentNo);
	}
	
	@Override
	public void updateComment(BoardComment comment) {
		
	boardMapper.updateComment(comment);
	}
	
	@Override
	public void updateReadCount(int boardNo,String classify) {
		
		HashMap<String ,Object> params =new HashMap<String,Object>();
		params.put("boardno", boardNo);
		params.put("classify", classify);
		boardMapper.updateReadCount(params);
	}
}
