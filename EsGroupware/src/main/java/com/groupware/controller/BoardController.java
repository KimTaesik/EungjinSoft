package com.groupware.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.BoardDao;
import com.groupware.dto.Board;
import com.groupware.dto.BoardComment;
import com.groupware.dto.Employee;
import com.groupware.ui.ThePager;

@Controller
@RequestMapping(value="board")
public class BoardController {

	private BoardDao boardDao; 
	@Autowired
	@Qualifier("boardDao")
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@RequestMapping(value="list.action", method = RequestMethod.GET)
	public ModelAndView list(String classify ,HttpServletRequest req, String type, String search ,Integer pageno) {
		
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 10; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 10; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "list.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
		String queryString = "classify="+classify ;
		//요청한 페이지 번호가 있다면, 읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
		if (pageno != null ) {
			pageNo =pageno;
		}
		
		//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
		int first = (pageNo - 1) * pageSize + 1; //1 page -> 1, 2 page -> 4, 3 page -> 7
		
		//1. 데이터 조회 (DAO객체 이용해서 처리)
		
		//내가 조건에 맞게 검색한 정보만, (type별로) 나오게 하는 작업.
		List<Board> boards = null;

		if (type == null || type.equals("1") )
			boards= boardDao.getBoardList(first, first + pageSize,classify); // 페이징 처리로 해줬기 때문에 이런 처리를 해줘야한다.			
		else if(type.equals("2") )
			boards= boardDao.getBoardListByTitle(first, first + pageSize, search,classify);
		else if (type.equals("3"))
			boards= boardDao.getBoardListById(first, first + pageSize, search,classify);

		
		//$$$$$$$$$$$$$$$$  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
		
		
		if (type == null || type.equals("1"))
			dataCount = boardDao.getBoardCount(classify); //전체 게시물 갯수 조회
		else if (type.equals("2"))
			dataCount = boardDao.getBoardCountByTitle(search,classify);
		else if (type.equals("3"))
			dataCount = boardDao.getBoardCountById(search,classify);
			
		ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, url, queryString);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("boards", boards);
		mav.addObject("classify", classify);
		mav.addObject("pager", pager);
		mav.addObject("pageno", pageNo);
		mav.setViewName("board/boardlist2");

		return mav;
	}
	
	@RequestMapping(value="view.action", method = RequestMethod.GET)
	public ModelAndView view(int boardNo,int pageno, String classify) {
				
				boardDao.updateReadCount(boardNo,classify);
				Board board = boardDao.getBoardByBoardNo(boardNo,classify);
			
				ModelAndView mav = new ModelAndView();
				if(classify.equals("4"))
					mav.setViewName("board/uploadview");
				else
				mav.setViewName("board/boardview");
				
				mav.addObject("board", board);
				mav.addObject("pageno", pageno);
				mav.addObject("classify", classify);
				
				return mav;
		
	}
	
	@RequestMapping(value="view.action", method = RequestMethod.POST)
	public ModelAndView view2(int boardNo,int pageno, String classify) {
				
				
				Board board = boardDao.getBoardByBoardNo(boardNo,classify);
				
				
//				if(board == null ){ 
//					resp.sendRedirect("list.action");
//					return;
//				}
				
				ModelAndView mav = new ModelAndView();
				mav.setViewName("board/boardview");
				mav.addObject("board", board);
				mav.addObject("pageno", pageno);
				mav.addObject("classify", classify);
				
				return mav;
		
	}
	@RequestMapping(value = "write.action", method = RequestMethod.GET)
	public ModelAndView writeForm(HttpSession session) {
			ModelAndView mav = new ModelAndView();
		Employee loginUser = new Employee();
		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		String id = loginUser.getId();
		mav.setViewName("board/boardwriteform");
		mav.addObject("id",id);
		return mav;
	}
	
	@RequestMapping(value="write.action", method= RequestMethod.POST)
	public String write(@ModelAttribute Board board) {
		
		
			boardDao.insertBoard(board);
	
			return "redirect:/board/list.action?classify="+board.getClassify();
		
		
	}
	
	@RequestMapping(value = "edit.action", method = RequestMethod.GET)
	public ModelAndView editForm(int boardNo, String classify ,int pageno) {
		Board board = boardDao.getBoardByBoardNo(boardNo,classify);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardeditform");
		mav.addObject("board", board);
		mav.addObject("pageno", pageno);
		
		return mav;
	}
	
	@RequestMapping(value="edit.action", method= RequestMethod.POST)
	public String update(int boardNo, String title, String content, String pageno, String classify,Board board) {

//		spring에서는 객체생성 ㄴㄴ
//		board = new Board();
//		board.setTitle(title);
//		board.setContent(content);
//		board.setboardNo(boardNo);
		
		boardDao.updateBoard(board);
		
		return "redirect:/board/list.action?boardNo="+boardNo+"&pageno="+ pageno +"&classify=" + classify;
	}
	
	@RequestMapping(value="delete.action", method= RequestMethod.GET)
	public String delete(int boardNo, String pageno, String board_No, String classify) {
		
		boardDao.deleteBoard(boardNo);
		return "redirect:/board/list.action?pageno="+pageno+"&classify=" + classify;
	}
	
//	@RequestMapping(value="writecomment.action", method= RequestMethod.GET)
//	public void writecommentform(int pageno, int boardNo, String classify, int board_No,BoardComment comment) {
//		
//		boardDao.insertBoardComment(comment);
//		
//	}
	
	@RequestMapping(value="writecomment.action", method= RequestMethod.POST)
	public ModelAndView writeComment(int pageno,int board_No, int boardNo, String writer, String classify, String content,BoardComment comment) {
		comment.setBoard_No(board_No);
		
		ModelAndView mav =new ModelAndView();
		boardDao.insertBoardComment(comment);
		mav.setViewName("redirect:/board/view.action?boardNo="+boardNo+"&pageno="+ pageno +"&classify=" + classify);
		return mav;
	
	}

	@RequestMapping(value="deletecomment.action", method= RequestMethod.GET)
	public String deleteComment(int commentNo, int board_No, int pageno, String classify, int boardNo) {
		
		boardDao.deleteComment(commentNo);
		return "redirect:/board/view.action?boardNo="+boardNo+"&pageno="+ pageno +"&classify=" + classify;
		
	}
	
	@RequestMapping(value="updatecomment.action", method= RequestMethod.POST)
	public String updateComment(int pageno, int boardNo, String classify,@ModelAttribute BoardComment comment) {

		boardDao.updateComment(comment);
		//redirect를 쓰면, 바로 view.action으로 넘어가는게 아니라, 위에 있는 view.action쪽으로 가서 그 문장을 실행한다. 
		
		return "redirect:/board/view.action?boardNo="+boardNo+"&pageno="+ pageno +"&classify=" + classify;
	
	}
	
	
	//boardDao.updateComment(comment);
	
//	@RequestMapping(value="deletecomment.action", method= RequestMethod.POST)
//	public ModelAndView deleteComment(int pageno,int board_No, int boardNo, String writer, String classify, String content,BoardComment comment) {
//		comment.setboard_No(board_No);
//		
//		ModelAndView mav =new ModelAndView();
//		boardDao.deleteComment(comment.getCommentNo());
//		mav.setViewName("redirect:/board/view.action?boardNo="+boardNo+"&pageno="+ pageno +"&classify=" + classify);
//		return mav;
//	
//	}
	
}
