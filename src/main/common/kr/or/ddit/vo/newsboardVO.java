package kr.or.ddit.vo;

import java.sql.Date;

public class newsboardVO {
	private String r;
	private int news_no      ;
	private String mem_id        ;
	private String news_title   ;
	private String news_content ;
	private String news_regdate ;
	private int news_hit     ;
	public int getNews_no() {
		return news_no;
	}
	
	public String getR() {
		return r;
	}

	public void setR(String r) {
		this.r = r;
	}

	public void setNews_no(int news_no) {
		this.news_no = news_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public String getNews_regdate() {
		return news_regdate;
	}
	public void setNews_regdate(String news_regdate) {
		this.news_regdate = news_regdate;
	}
	public int getNews_hit() {
		return news_hit;
	}
	public void setNews_hit(int news_hit) {
		this.news_hit = news_hit;
	}

	
	

	
	
}
