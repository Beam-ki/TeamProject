package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface BoardFileService {

	public static String IMAGE_REPO="C:\\Users\\ehdwn\\OneDrive\\바탕 화면\\디바이스융합\\05_Spring\\image_repo";
	
	public String getMessage(HttpServletRequest request, String msg, String url);
	
	public String saveFile(MultipartFile file);
	
	public void deleteImage(String originFileName);
}
