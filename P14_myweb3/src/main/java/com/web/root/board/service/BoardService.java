package com.web.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.QnaReplyDTO;

public interface BoardService {

//	public void boardAllList(Model model);
	public void boardAllList(Model model, int num);
	
	public void qna(Model model, int num);
	
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String qnawriteSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void contentView(int product_no, Model model);
	
	public void qnacontentView(int product_no, Model model);
	
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String qnamodify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String boardDelete(int product_no, String product_img, HttpServletRequest request);
	
	public String qnaboardDelete(int product_no, String product_img, HttpServletRequest request);

///////////////////////////////////////////////////////////
	
	public List<QnaReplyDTO> readReply(int bno);
}
