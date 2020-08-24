package kr.or.ddit.vo;

public class JobsBoardCommentVO {

	private String jobs_no;
	private String mem_id;
	private String comment_content;
	private String comment_regdate;
	private String comment_seq;
	
	
	

	public String getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(String comment_seq) {
		this.comment_seq = comment_seq;
	}
	public String getJobs_no() {
		return jobs_no;
	}
	public void setJobs_no(String jobs_no) {
		this.jobs_no = jobs_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(String comment_regdate) {
		this.comment_regdate = comment_regdate;
	}

	
	
}
