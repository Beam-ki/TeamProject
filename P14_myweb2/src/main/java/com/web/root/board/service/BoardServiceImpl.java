package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.BoardDTO;
import com.web.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardFileService bfs;
	
	@Override
//	public void boardAllList(Model model) {
//		model.addAttribute("boardList", mapper.boardAllList());
//	}
	public void boardAllList(Model model, int num) {
		int pageLetter=3; // 한 페이지당 글목록 수
		int allCount=mapper.selectBoardCount(); // 전체 글 수
		
		int repeat=allCount/pageLetter; // 마지막 페이지 번호
		if(allCount%pageLetter!=0) {
			repeat+=1;
		}
		int end=num*pageLetter;
		int start=end+1-pageLetter;
		
		model.addAttribute("repeat", repeat);
		model.addAttribute("boardList", mapper.boardAllList(start, end));
	}

	@Override
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		BoardDTO dto=new BoardDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file=mul.getFile("image_file_name");
		if(file.getSize()!=0) {	// 이미지 파일이 있을때
			dto.setImageFileName(bfs.saveFile(file));
		} else {
			dto.setImageFileName("nan");
		}
		int result=0;
		try {
			result=mapper.writeSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result==1) {
			msg="글이 등록되었습니다";
			url="/board/boardAllList";
		} else {
			msg="문제가 발생했습니다";
			url="/board/writeForm";
		}
		return bfs.getMessage(request, msg, url);
	}

	@Override
	public void contentView(int writeNo, Model model) {
		model.addAttribute("data", mapper.contentView(writeNo));
		upHit(writeNo);
	}
	
	private void upHit(int writeNo) {
		mapper.upHit(writeNo);
	}

	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		BoardDTO dto=new BoardDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		
		MultipartFile file=mul.getFile("image_file_name");
		if(file.getSize()!=0) {
			dto.setImageFileName(bfs.saveFile(file));
			bfs.deleteImage(mul.getParameter("originFileName"));
		} else {
			dto.setImageFileName(mul.getParameter("originFileName"));
		}
		int result=mapper.modify(dto);
		
		String msg,url;
		if(result==1) {
			msg="내용이 변경되었습니다";
			url="/board/boardAllList";
		} else {
			msg="수정 오류";
			url="/board/modify_form?writeNo="+dto.getWriteNo();
		}
		return bfs.getMessage(request, msg, url);
	}

	@Override
	public String boardDelete(int writeNo, String imageFileName, HttpServletRequest request) {
		// DB에서 글번호 해당하는 레코드 삭제
		
		// DB 처리 결과값으로 성공, 실패 결정
		// - 성공 : 해당 글번호 이미지 파일 삭제하고 글목록 이동
		//   실패 : 해당 글로 다시 이동
		int result=mapper.delete(writeNo);
		
		String msg, url;
		if(result==1) {
			msg="삭제되었습니다";
			url="/board/boardAllList";
			bfs.deleteImage(imageFileName);
		} else {
			msg="삭제 오류";
			url="/board/contentView?writeNo="+writeNo;
		}
		return bfs.getMessage(request, msg, url);
	}

	@Override
	public void qna(Model model, int num) {
		int pageLetter=3; // 한 페이지당 글목록 수
		int allCount=mapper.selectBoardCount(); // 전체 글 수
		
		int repeat=allCount/pageLetter; // 마지막 페이지 번호
		if(allCount%pageLetter!=0) {
			repeat+=1;
		}
		int end=num*pageLetter;
		int start=end+1-pageLetter;
		
		model.addAttribute("repeat", repeat);
		model.addAttribute("qnaList", mapper.qna(start, end));
	}
	
	
	
	
}
