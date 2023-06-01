package kr.co.dong.board;

public class ReviewDTO {
	
	private String u_p_id;
	private String b_p_code;
	private String r_content;
	private int r_spoint;
	private int r_review;
	private String r_date;
	private int r_delete;
	private int r_p_num;
	
	public String getU_p_id() {
		return u_p_id;
	}
	public void setU_p_id(String u_p_id) {
		this.u_p_id = u_p_id;
	}
	public String getB_p_code() {
		return b_p_code;
	}
	public void setB_p_code(String b_p_code) {
		this.b_p_code = b_p_code;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getR_spoint() {
		return r_spoint;
	}
	public void setR_spoint(int r_spoint) {
		this.r_spoint = r_spoint;
	}
	public int getR_review() {
		return r_review;
	}
	public void setR_review(int r_review) {
		this.r_review = r_review;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public int getR_delete() {
		return r_delete;
	}
	public void setR_delete(int r_delete) {
		this.r_delete = r_delete;
	}
	public int getR_p_num() {
		return r_p_num;
	}
	public void setR_p_num(int r_p_num) {
		this.r_p_num = r_p_num;
	}
	
	@Override
	public String toString() {
		return "ReviewDTO [u_p_id=" + u_p_id + ", b_p_code=" + b_p_code + ", r_content=" + r_content + ", r_spoint="
				+ r_spoint + ", r_review=" + r_review + ", r_date=" + r_date + ", r_delete=" + r_delete + ", r_p_num="
				+ r_p_num + "]";
	}
	
}
