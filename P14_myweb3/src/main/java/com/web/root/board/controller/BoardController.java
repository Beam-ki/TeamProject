package com.web.root.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.service.BoardFileService;
import com.web.root.board.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	BoardService bs;
	
	@GetMapping("boardAllList")
	public String boardAllList(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		bs.boardAllList(model, num);
		return "board/boardAllList";
	}
	
	@GetMapping("writeForm")
	public String writeForm() {
		return "board/writeForm";
	}
	
	@PostMapping("writeSave")
	public void writeSave(MultipartHttpServletRequest mul, 
                          HttpServletResponse response, 
                          HttpServletRequest request) throws IOException{
	    String message = bs.writeSave(mul, request);
	    response.setContentType("text/html; charset=utf-8");
	    PrintWriter out = response.getWriter();
	    out.print(message);
	}
	
	@GetMapping("contentView")
	public String contentView(@RequestParam int product_no, Model model) {
		bs.contentView(product_no, model);
		return "board/contentView";
	}
	
	@GetMapping("download")
	public void download(@RequestParam("file") String fileName, HttpServletResponse response) throws Exception {
		response.addHeader("content-disposition", "attachment;fileName="+fileName);
		File file=new File(BoardFileService.IMAGE_REPO+"\\"+fileName);
		FileInputStream in=new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@GetMapping("modifyForm")
	public String modifyForm(@RequestParam int product_no, Model model) {
		bs.contentView(product_no, model);
		return "board/modifyForm";
	}
	
	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul,
			           HttpServletRequest request,
			           HttpServletResponse response) throws Exception {
		String message=bs.modify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(message);
	}
	
	@GetMapping("delete")
	public void delete(@RequestParam int product_no,
					   @RequestParam String product_img,
	           		   HttpServletRequest request,
	           		   HttpServletResponse response) throws Exception {
		String message=bs.boardDelete(product_no, product_img, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(message);
		
	}

	
//	@GetMapping("qna")
//	public String qna(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
//		bs.qna(model, num);
//		return "board/qna";
//	}
	
	
}
