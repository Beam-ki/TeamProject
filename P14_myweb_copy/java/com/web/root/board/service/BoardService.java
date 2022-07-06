package com.web.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.QnaReplyDTO;

public interface BoardService {

	public void boardAllList(Model model, int num);
	
	public void qna(Model model, int num);
	
	public void Notice(Model model, int num);
	
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String NoticeWriteSave(HttpServletRequest request);
	
	public String qnawriteSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void contentView(int product_no, Model model);
	
	public void NoticeView(int product_no, Model model);
	
	public void qnacontentView(int product_no, Model model);
	
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String NoticeModify(HttpServletRequest request);
	
	public String qnamodify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String boardDelete(int product_no, String product_img, HttpServletRequest request);
	
	public String Noticedelete(int product_no, HttpServletRequest request);
	
	public String qnaboardDelete(int product_no, String product_img, HttpServletRequest request);
	
	public List<QnaReplyDTO> readReply(int bno);
	
	public String reply(HttpServletRequest request);

	public void mypageList(Model model, int num, String id);	

	public void qnamypageList(Model model, int num, String id);
	
	/////////////////////////////////////////////////////////////////

	public List<BoardDTO> BlistAll(String searchOption, String keyword);

	public int BcountArticle(String searchOption, String keyword);
	
	public List<BoardDTO> QlistAll(String searchOption, String keyword);

	public int QcountArticle(String searchOption, String keyword);

	

	
}
