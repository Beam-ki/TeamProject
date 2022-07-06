package com.web.root.board.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.QnaReplyDTO;
import com.web.root.mybatis.board.BoardMapper;
import com.web.root.mybatis.board.ReplyMapper;

@Service
public class BoardServiceImpl implements BoardService {

   @Autowired
   BoardMapper mapper;
   
   @Autowired
   BoardFileService bfs;
   
   @Override
   public void boardAllList(Model model, int num) {
      int pageLetter=8; // 한 페이지당 글목록 수
      int allCount1=mapper.selectBoardCount(); // 전체 글 수
      
      int repeat=allCount1/pageLetter; // 마지막 페이지 번호
      if(allCount1%pageLetter!=0) {
         repeat+=1;
      }
      int end=num*pageLetter;
      int start=end+1-pageLetter;
      
      model.addAttribute("repeat", repeat);
      model.addAttribute("boardList", mapper.boardAllList(start, end));
   }
   @Override
   public void Notice(Model model, int num) {
	  int pageLetter=8; // 한 페이지당 글목록 수
      int allCount1=mapper.selectBoardCount(); // 전체 글 수
      
      int repeat=allCount1/pageLetter; // 마지막 페이지 번호
      if(allCount1%pageLetter!=0) {
         repeat+=1;
      }
      int end=num*pageLetter;
      int start=end+1-pageLetter;
      
      model.addAttribute("repeat", repeat);
      model.addAttribute("NoticeList", mapper.NoticeList(start, end));
   }
   
   @Override
	public List<BoardDTO> BlistAll(String searchOption, String keyword) {
	   // 검색옵션, 키워드 맵에 저장
	   Map<String, String> map = new HashMap<String, String>(); 
	   map.put("searchOption", searchOption);
	   map.put("keyword", keyword); 
	   return mapper.BlistAll(map);
	}
	
	@Override
	public int BcountArticle(String searchOption, String keyword) {
		// 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return mapper.BcountArticle(map);
	}
	
	@Override
	public List<BoardDTO> QlistAll(String searchOption, String keyword) {
	   // 검색옵션, 키워드 맵에 저장
	   Map<String, String> map = new HashMap<String, String>(); 
	   map.put("searchOption", searchOption);
	   map.put("keyword", keyword); 
	   return mapper.QlistAll(map);
	}
	
	@Override
	public int QcountArticle(String searchOption, String keyword) {
		// 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return mapper.QcountArticle(map);
	}
   
   @Override
   public void mypageList(Model model, int num,String id) {
	      int pageLetter=8; // 한 페이지당 글목록 수
	      int allCount2=mapper.myselectBoardCount(id); // 전체 글 수
	      
	      int repeat=allCount2/pageLetter; // 마지막 페이지 번호
	      if(allCount2%pageLetter!=0) {
	         repeat+=1;
	      }
	      int end=num*pageLetter;
	      int start=end+1-pageLetter;
	      
	      model.addAttribute("repeat", repeat);
	      model.addAttribute("mypageList", mapper.mypageList(start, end,id));
	   }

   @Override
   public void qnamypageList(Model model, int num,String id) {
	      int pageLetter=8; // 한 페이지당 글목록 수
	      int allCount2=mapper.qnamyselectBoardCount(id); // 전체 글 수
	      
	      int repeat=allCount2/pageLetter; // 마지막 페이지 번호
	      if(allCount2%pageLetter!=0) {
	         repeat+=1;
	      }
	      int end=num*pageLetter;
	      int start=end+1-pageLetter;
	      
	      model.addAttribute("repeat", repeat);
	      model.addAttribute("qnamypageList", mapper.qnamypageList(start, end,id));
	   }

   @Override
   public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
      BoardDTO dto=new BoardDTO();
      
      dto.setProduct_writer(mul.getParameter("product_writer"));
      dto.setProduct_title(mul.getParameter("product_title"));
      dto.setProduct_main(mul.getParameter("product_main"));
      dto.setProduct_type(mul.getParameter("product_type"));
      dto.setProduct_price((Integer.parseInt (mul.getParameter("product_price"))));
      dto.setProduct_trade(mul.getParameter("product_trade"));
      dto.setProduct_status(mul.getParameter("product_status"));
      dto.setProduct_status1(mul.getParameter("product_status1"));
      MultipartFile file=mul.getFile("product_img");
      
//      데이터 가져오는지 테스트
//      String writer=mul.getParameter("product_writer");
//      String title=mul.getParameter("product_title");
//      String main=mul.getParameter("product_main");
//      String fileName=file.getOriginalFilename();
//      System.out.println(writer);
//      System.out.println(title);
//      System.out.println(main);
//      System.out.println(fileName);
      
      if(file.getSize()!=0) {   // 이미지 파일이 있을때
         System.out.println(bfs.saveFile(file));
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
   public String NoticeWriteSave(HttpServletRequest request) {
	   BoardDTO dto=new BoardDTO();
	   dto.setProduct_writer(request.getParameter("product_writer"));
	   dto.setProduct_title(request.getParameter("product_title"));
	   dto.setProduct_main(request.getParameter("product_main"));
	   dto.setProduct_type(request.getParameter("product_type"));
	   int result=0;
	   try {
		   result=mapper.NoticeWriteSave(dto);
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   String msg, url;
	   if(result==1) {
		   msg="글이 등록되었습니다";
		   url="/board/Notice";
	   } else {
		   msg="문제가 발생했습니다";
		   url="/board/NoticeWriteForm";
	   }
	   return bfs.getMessage(request, msg, url);
   }
   
   @Override
   public String qnawriteSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
      BoardDTO dto=new BoardDTO();
      dto.setProduct_writer(mul.getParameter("product_writer"));
      dto.setProduct_title(mul.getParameter("product_title"));
      dto.setProduct_main(mul.getParameter("product_main"));
      dto.setProduct_type(mul.getParameter("product_type"));
      MultipartFile file=mul.getFile("product_img");
      
      if(file.getSize()!=0) {   // 이미지 파일이 있을때
         System.out.println(bfs.saveFile(file));
         dto.setProduct_img(bfs.saveFile(file));
      } else {
         dto.setProduct_img("nan");
      }
      int result=0;
      try {
         result=mapper.qnawriteSave(dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      String msg, url;
      if(result==1) {
         msg="글이 등록되었습니다";
         url="/board/qna";
      } else {
         msg="문제가 발생했습니다";
         url="/board/qnawriteForm";
      }

      return bfs.getMessage(request, msg, url);
   }

   @Override
   public void contentView(int product_no, Model model) {
      model.addAttribute("data", mapper.contentView(product_no));
   }
   
   @Override
   public void NoticeView(int product_no, Model model) {
	   model.addAttribute("data", mapper.NoticeView(product_no));
   }
   

   @Override
   public void qnacontentView(int product_no, Model model) {
      model.addAttribute("data", mapper.contentView(product_no));

   }
   
   @Override
   public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
      BoardDTO dto=new BoardDTO();
      dto.setProduct_no(Integer.parseInt(mul.getParameter("product_no")));
      dto.setProduct_title(mul.getParameter("product_title"));
      dto.setProduct_main(mul.getParameter("product_main"));
//      dto.setproduct_type(mul.getParameter("product_type"));
      dto.setProduct_price(Integer.parseInt(mul.getParameter("product_price")));
      dto.setProduct_trade(mul.getParameter("product_trade"));
      dto.setProduct_status(mul.getParameter("product_status"));
      dto.setProduct_status1(mul.getParameter("product_status1"));
      
      MultipartFile file=mul.getFile("product_img");
      if(file.getSize()!=0) {
         dto.setProduct_img(bfs.saveFile(file));
         bfs.deleteImage(mul.getParameter("originFileName"));
      } else {
         dto.setProduct_img(mul.getParameter("originFileName"));
      }
      int result=mapper.modify(dto);
      
      
      try {
         result=mapper.modify(dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      String msg,url;
      if(result==1) {
         msg="내용이 변경되었습니다";
         url="/board/contentView?product_no="+dto.getProduct_no();
      } else {
         msg="수정 오류";
         url="/board/modifyForm?product_no="+dto.getProduct_no();
      }
      return bfs.getMessage(request, msg, url);
      
   }
   
   @Override
   public String NoticeModify(HttpServletRequest request) {
      BoardDTO dto=new BoardDTO();
      dto.setProduct_no(Integer.parseInt(request.getParameter("product_no")));
      dto.setProduct_title(request.getParameter("product_title"));
      dto.setProduct_main(request.getParameter("product_main"));
      
      int result=0;
      try {
         result=mapper.NoticeModify(dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      String msg,url;
      if(result==1) {
         msg="내용이 변경되었습니다";
         url="/board/Notice";
      } else {
         msg="수정 오류";
         url="/board/NoticeModifyForm?product_no="+dto.getProduct_no();
      }
      return bfs.getMessage(request, msg, url);
   }   
   
   @Override
   public String qnamodify(MultipartHttpServletRequest mul, HttpServletRequest request) {
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
      
      int result=0;
      try {
         result=mapper.qnamodify(dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      String msg,url;
      if(result==1) {
         msg="내용이 변경되었습니다";
         url="/board/qna";
      } else {
         msg="수정 오류";
         url="/board/qnamodifyForm?product_no="+dto.getProduct_no();
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
   
	@Override
	public String Noticedelete(int product_no, HttpServletRequest request) {
		int result=mapper.delete(product_no);
  
		String msg, url;
		if(result==1) {
			msg="삭제되었습니다";
			url="/board/Notice";
		} else {
			msg="삭제 오류";
			url="/board/Notice?product_no="+product_no;
		}
		return bfs.getMessage(request, msg, url);
	}
   
   @Override
   public String qnaboardDelete(int product_no, String product_img, HttpServletRequest request) {
      int result=mapper.qnadelete(product_no);
      
      String msg, url;
      if(result==1) {
         msg="삭제되었습니다";
         url="/board/qna";
         bfs.deleteImage(product_img);
      } else {
         msg="삭제 오류";
         url="/board/qnacontentView?product_img="+product_no;
      }
      return bfs.getMessage(request, msg, url);
   }
	
	@Override
	public void qna(Model model, int num) {
		int pageLetter=8; // 한 페이지당 글목록 수
		int allCount3=mapper.qnaselectBoardCount(); // 전체 글 수
  
		int repeat=allCount3/pageLetter; // 마지막 페이지 번호
		if(allCount3%pageLetter!=0) {
			repeat+=1;
		}
		int end=num*pageLetter;
		int start=end+1-pageLetter;
  
		model.addAttribute("repeat", repeat);
		model.addAttribute("qna", mapper.qna(start, end));
	}

/////////////////////////////////////////////////////////////////////
   
   @Autowired
   ReplyMapper remapper;
   
   @Override
   public List<QnaReplyDTO> readReply(int bno) {
	   return remapper.readReply(bno);
   }

   @Override
   public String reply(HttpServletRequest request) {
	   QnaReplyDTO dto=new QnaReplyDTO();
	   dto.setBno(Integer.parseInt(request.getParameter("product_no")));
	   dto.setWriter(request.getParameter("writer"));
	   dto.setContent(request.getParameter("content"));
	   dto.setRegdate(request.getParameter("regdate"));
       int result=0;
       try {
          result=remapper.reply(dto);
       } catch (Exception e) {
          e.printStackTrace();
       }
       
       String msg, url;
       if(result==1) {
          msg="글이 등록되었습니다";
          url="/board/qnacontentView?product_no="+request.getParameter("product_no");
       } else {
          msg="문제가 발생했습니다";
          url="/board/qnacontentView?product_no="+request.getParameter("product_no");
       }
       
       return bfs.getMessage(request, msg, url);
   }
      
   

   
   
   
   
}