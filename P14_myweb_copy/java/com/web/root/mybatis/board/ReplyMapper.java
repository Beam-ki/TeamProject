package com.web.root.mybatis.board;

import java.util.List;

import com.web.root.board.dto.QnaReplyDTO;

public interface ReplyMapper {
	
	public List<QnaReplyDTO> readReply(int bno);

	public int reply(QnaReplyDTO dto);

}
