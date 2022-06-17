package com.web.root.mybatis.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.root.board.dto.BoardDTO;

public interface BoardMapper {

//	public List<BoardDTO> boardAllList();
	public List<BoardDTO> boardAllList(@Param("s") int start, @Param("e") int end);
	
	public List<BoardDTO> qna(@Param("s") int start, @Param("e") int end);
	
	public List<BoardDTO> mypageList(@Param("s") int start, @Param("e") int end, String id);
	
	public int writeSave(BoardDTO dto);
	
	public int qnawriteSave(BoardDTO dto);
	
	public BoardDTO contentView(int product_no);
	
	public BoardDTO qnacontentView(int product_no);
	
	public void upHit(int product_no);
	
	public int modify(BoardDTO dto);
	
	public int qnamodify(BoardDTO dto);
	
	public int delete(int product_no);
	
	public int qnadelete(int product_no);
	
	public int selectBoardCount();






}
