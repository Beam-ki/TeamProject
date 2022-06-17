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
//   public void boardAllList(Model model) {
//      model.addAttribute("boardList", mapper.boardAllList());
//   }
   public void boardAllList(Model model, int num) {
      int pageLetter=8; // 한 페이지당 글목록 수
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
      dto.setProduct_no((Integer.parseInt (mul.getParameter("product_no"))));
      dto.setProduct_writer(mul.getParameter("product_writer"));
      dto.setProduct_title(mul.getParameter("product_title"));
      dto.setProduct_main(mul.getParameter("product_main"));
      dto.setproduct_type(mul.getParameter("product_type"));
      dto.setproduct_price((Integer.parseInt (mul.getParameter("product_price"))));
      dto.setProduct_trade(mul.getParameter("product_trade"));
      dto.setProduct_status(mul.getParameter("product_status"));
      dto.setproduct_status1(mul.getParameter("product_status1"));
      //dto.setproduct_status2(mul.getParameter("product_status2"));
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
   public String qnawriteSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
      BoardDTO dto=new BoardDTO();
      //dto.setProduct_no((Integer.parseInt (mul.getParameter("product_no"))));
      dto.setProduct_writer(mul.getParameter("product_writer"));
      dto.setProduct_title(mul.getParameter("product_title"));
      dto.setProduct_main(mul.getParameter("product_main"));
      dto.setproduct_type(mul.getParameter("product_type"));
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
         url="/board/qnawriteForm.jsp";
      }

      return bfs.getMessage(request, msg, url);
   }

   @Override
   public void contentView(int product_no, Model model) {
      model.addAttribute("data", mapper.contentView(product_no));
      upHit(product_no);
   }
   @Override
   public void qnacontentView(int product_no, Model model) {
      model.addAttribute("data", mapper.contentView(product_no));
      upHit(product_no);
   }
   
   private void upHit(int product_no) {
      mapper.upHit(product_no);
   }

   @Override
   public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
      BoardDTO dto=new BoardDTO();
      dto.setProduct_no(Integer.parseInt(mul.getParameter("product_no")));
      dto.setProduct_title(mul.getParameter("product_title"));
      dto.setProduct_main(mul.getParameter("product_main"));
//      dto.setproduct_type(mul.getParameter("product_type"));
      dto.setproduct_price(Integer.parseInt(mul.getParameter("product_price")));
      dto.setProduct_trade(mul.getParameter("product_trade"));
      dto.setProduct_status(mul.getParameter("product_status"));
      dto.setproduct_status1(mul.getParameter("product_status1"));
      
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
         url="/board/boardAllList";
      } else {
         msg="수정 오류";
         url="/board/modifyForm?product_no="+dto.getProduct_no();
      }
      return bfs.getMessage(request, msg, url);
      
   }
   
   @Override
   public String qnamodify(MultipartHttpServletRequest mul, HttpServletRequest request) {
      BoardDTO dto=new BoardDTO();
      dto.setProduct_no(Integer.parseInt(mul.getParameter("product_no")));
      dto.setProduct_title(mul.getParameter("product_title"));
      dto.setProduct_main(mul.getParameter("product_main"));
//      dto.setproduct_type(mul.getParameter("product_type"));

      
      MultipartFile file=mul.getFile("product_img");
      if(file.getSize()!=0) {
         dto.setProduct_img(bfs.saveFile(file));
         bfs.deleteImage(mul.getParameter("originFileName"));
      } else {
         dto.setProduct_img(mul.getParameter("originFileName"));
      }
      int result=mapper.qnamodify(dto);
      
      
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
   public String qnaboardDelete(int product_no, String product_img, HttpServletRequest request) {
      // DB에서 글번호 해당하는 레코드 삭제
      
      // DB 처리 결과값으로 성공, 실패 결정
      // - 성공 : 해당 글번호 이미지 파일 삭제하고 글목록 이동
      //   실패 : 해당 글로 다시 이동
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
      int allCount=mapper.selectBoardCount(); // 전체 글 수
      
      int repeat=allCount/pageLetter; // 마지막 페이지 번호
      if(allCount%pageLetter!=0) {
         repeat+=1;
      }
      int end=num*pageLetter;
      int start=end+1-pageLetter;
      
      model.addAttribute("repeat", repeat);
      model.addAttribute("qna", mapper.qna(start, end));
   }


      
   

   
   
   
   
}