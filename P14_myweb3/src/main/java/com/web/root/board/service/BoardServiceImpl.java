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
		dto.setProduct_writer(mul.getParameter("product_writer"));
		dto.setProduct_title(mul.getParameter("product_title"));
		dto.setProduct_main(mul.getParameter("product_main"));
		MultipartFile file=mul.getFile("product_img");
		
//		데이터 가져오는지 테스트
//		String writer=mul.getParameter("product_writer");
//		String title=mul.getParameter("product_title");
//		String main=mul.getParameter("product_main");
//		String fileName=file.getOriginalFilename();
//		System.out.println(writer);
//		System.out.println(title);
//		System.out.println(main);
//		System.out.println(fileName);
		
		if(file.getSize()!=0) {	// 이미지 파일이 있을때
			dto.setProduct_img(bfs.saveFile(file));
		} else {
			dto.setProduct_img("nan");
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
	public void contentView(int product_no, Model model) {
		model.addAttribute("data", mapper.contentView(product_no));
//		upHit(product_no);
	}
	
//	private void upHit(int product_no) {
//		mapper.upHit(product_no);
//	}

	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		BoardDTO dto=new BoardDTO();
		dto.setProduct_no(Integer.parseInt(mul.getParameter("product_no")));
		dto.setProduct_title(mul.getParameter("product_title"));
		dto.setProduct_main(mul.getParameter("product_main"));
		
		MultipartFile file=mul.getFile("product_img");
		if(file.getSize()!=0) {
			dto.setProduct_img(bfs.saveFile(file));
			bfs.deleteImage(mul.getParameter("originFileName"));
		} else {
			dto.setProduct_img(mul.getParameter("originFileName"));
		}
		int result=mapper.modify(dto);
		
		String msg,url;
		if(result==1) {
			msg="내용이 변경되었습니다";
			url="/board/boardAllList";
		} else {
			msg="수정 오류";
			url="/board/modifyForm?product_no="+dto.getProduct_no();
		}
		return bfs.getMessage(request, msg, url);
	}

	@Override
	public String boardDelete(int product_no, String product_img, HttpServletRequest request) {
		// DB에서 글번호 해당하는 레코드 삭제
		
		// DB 처리 결과값으로 성공, 실패 결정
		// - 성공 : 해당 글번호 이미지 파일 삭제하고 글목록 이동
		//   실패 : 해당 글로 다시 이동
		int result=mapper.delete(product_no);
		
		String msg, url;
		if(result==1) {
			msg="삭제되었습니다";
			url="/board/boardAllList";
			bfs.deleteImage(product_img);
		} else {
			msg="삭제 오류";
			url="/board/contentView?product_img="+product_no;
		}
		return bfs.getMessage(request, msg, url);
	}
	

//	@Override
//	public void qna(Model model, int num) {
//		int pageLetter=3; // 한 페이지당 글목록 수
//		int allCount=mapper.selectBoardCount(); // 전체 글 수
//		
//		int repeat=allCount/pageLetter; // 마지막 페이지 번호
//		if(allCount%pageLetter!=0) {
//			repeat+=1;
//		}
//		int end=num*pageLetter;
//		int start=end+1-pageLetter;
//		
//		model.addAttribute("repeat", repeat);
//		model.addAttribute("qnaList", mapper.qna(start, end));
//	}
	
	
	
	
}
