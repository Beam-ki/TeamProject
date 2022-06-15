package com.web.root.qna.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService_qna {

//	public void boardAllList(Model model);
	public void boardAllList(Model model, int num);
	
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void contentView(int writeNo, Model model);
	
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String boardDelete(int writeNo, String imageFileName, HttpServletRequest request);

	public void boardAllList_qna(Model model, int num);

	public void contentView_qna(int writeNo, Model model);
}
