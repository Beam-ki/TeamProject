package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {

//	public void boardAllList(Model model);
	public void boardAllList(Model model, int num);
	
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void contentView(int product_no, Model model);
	
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String boardDelete(int product_no, String product_img, HttpServletRequest request);
	
//	public void qna(Model model, int num);
}
