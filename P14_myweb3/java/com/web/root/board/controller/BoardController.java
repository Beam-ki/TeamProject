package com.web.root.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.QnaReplyDTO;
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
	@GetMapping("qna")
	public String qna(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		bs.qna(model, num);
		return "board/qna";
	}
	@GetMapping("Notice")
	   public String Notice() {
	      return "board/Notice";
	   }
    @GetMapping("qnaNotice")
    public String qnaNotice() {
       return "board/qnaNotice";
    }
	
	@GetMapping("writeForm")
	public String writeForm() {
		return "board/writeForm";
	}
	@GetMapping("qnawriteForm")
	public String qnawriteForm() {
		return "board/qnawriteForm";
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
	@PostMapping("qnawriteSave")
	public void qnawriteSave(MultipartHttpServletRequest mul, 
                          HttpServletResponse response, 
                          HttpServletRequest request) throws IOException{
	    String message = bs.qnawriteSave(mul, request);
	    response.setContentType("text/html; charset=utf-8");
	    PrintWriter out = response.getWriter();
	    out.print(message);
	    
	}
	
	@GetMapping("contentView")
	public String contentView(@RequestParam int product_no, Model model) {
		bs.contentView(product_no, model);
		return "board/contentView";
	}
	@GetMapping("qnacontentView")
	public String qnacontentView(BoardDTO dto, @RequestParam int product_no, Model model) {
		bs.qnacontentView(product_no, model);
		
		List<QnaReplyDTO> replyList=bs.readReply(dto.getProduct_no());
		model.addAttribute("replyList", replyList);
		return "board/qnacontentView";
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
	@GetMapping("qnamodifyform")
	public String qnamodifyForm(@RequestParam int product_no, Model model) {
		bs.qnacontentView(product_no, model);
		return "board/qnamodifyform";
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
	
	@PostMapping("qnamodify")
	public void qnamodify(MultipartHttpServletRequest mul,
					   HttpServletRequest request,
					   HttpServletResponse response) throws Exception {
		String message=bs.qnamodify(mul, request);
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
	
	@GetMapping("qnadelete")
	public void qnadelete(@RequestParam int product_no,
					   @RequestParam String product_img,
	           		   HttpServletRequest request,
	           		   HttpServletResponse response) throws Exception {
		String message=bs.qnaboardDelete(product_no, product_img, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(message);
		
	}
	


	
	
}
