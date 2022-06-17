package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface BoardFileService {

	public static String IMAGE_REPO="D:/Edu/05_SPRING/image_repo";
	
	public String getMessage(HttpServletRequest request, String msg, String url);
	
	public String saveFile(MultipartFile file);
	
	public void deleteImage(String originFileName);
}
