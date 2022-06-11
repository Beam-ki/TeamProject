package com.web.root.board.dto;

//create table board_product(
//product_title varchar(30),
//product_day date default sysdate,
//product_view number(38) default 0,
//product_main varchar2(300),
//product_img varchar(40),
//product_wait varchar(40),
//product_soldout varchar(40),
//product_writer varchar2(20),
//constraint fk foreign key(product_writer) references membership1(id) on delete cascade
//);

public class BoardDTO {

	private int product_no;
	private String product_title;
	private String product_day;
	private int product_view;
	private String product_main;
	private String product_img;
	private String product_wait;
	private String product_soldout;
	private String product_writer;
	
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public String getProduct_day() {
		return product_day;
	}
	public void setProduct_day(String product_day) {
		this.product_day = product_day;
	}
	public int getProduct_view() {
		return product_view;
	}
	public void setProduct_view(int product_view) {
		this.product_view = product_view;
	}
	public String getProduct_main() {
		return product_main;
	}
	public void setProduct_main(String product_main) {
		this.product_main = product_main;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_wait() {
		return product_wait;
	}
	public void setProduct_wait(String product_wait) {
		this.product_wait = product_wait;
	}
	public String getProduct_soldout() {
		return product_soldout;
	}
	public void setProduct_soldout(String product_soldout) {
		this.product_soldout = product_soldout;
	}
	public String getProduct_writer() {
		return product_writer;
	}
	public void setProduct_writer(String product_writer) {
		this.product_writer = product_writer;
	}
	
	
	
}
