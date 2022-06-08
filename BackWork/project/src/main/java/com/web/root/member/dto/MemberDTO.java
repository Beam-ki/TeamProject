package com.web.root.member.dto;

//create table membership(
//id varchar2(20) primary key,
//pw varchar2(100),
//addr varchar2(300)
//);

public class MemberDTO {

	private String id;
	private String pw;
	private String addr;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	
}
