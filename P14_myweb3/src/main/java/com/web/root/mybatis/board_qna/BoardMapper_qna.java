package com.web.root.mybatis.board_qna;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.root.board.dto.BoardDTO;
import com.web.root.qna.dto.BoardDTO_qna;

public interface BoardMapper_qna {

//	public List<BoardDTO> boardAllList();
	public List<BoardDTO> boardAllList(@Param("s") int start, @Param("e") int end);
	
	public List<BoardDTO> qna(@Param("s") int start, @Param("e") int end);
	
	public int writeSave(BoardDTO dto);
	
	public BoardDTO contentView(int product_no);
	
//	public void upHit(int product_no);
	
	public int modify(BoardDTO dto);
	
	public int delete(int product_no);
	
	public int selectBoardCount();
	
	public int writeSave(BoardDTO_qna dto);

	public void upHit(int writeNo);

	public int modify(BoardDTO_qna dto);


}
