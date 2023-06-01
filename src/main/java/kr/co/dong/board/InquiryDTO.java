package kr.co.dong.board;

public class InquiryDTO {
	
	private int i_p_num;
	private String u_p_id;
	private String b_p_code;
	private String b_product;
	private String i_content;
	private String i_date;
	private String i_answer;
	private int i_state;
	
	public int getI_p_num() {
		return i_p_num;
	}
	public void setI_p_num(int i_p_num) {
		this.i_p_num = i_p_num;
	}
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
	public String getB_product() {
		return b_product;
	}
	public void setB_product(String b_product) {
		this.b_product = b_product;
	}
	public String getI_content() {
		return i_content;
	}
	public void setI_content(String i_content) {
		this.i_content = i_content;
	}
	public String getI_date() {
		return i_date;
	}
	public void setI_date(String i_date) {
		this.i_date = i_date;
	}
	public String getI_answer() {
		return i_answer;
	}
	public void setI_answer(String i_answer) {
		this.i_answer = i_answer;
	}
	public int getI_state() {
		return i_state;
	}
	public void setI_state(int i_state) {
		this.i_state = i_state;
	}
	@Override
	public String toString() {
		return "InquiryDTO [i_p_num=" + i_p_num + ", u_p_id=" + u_p_id + ", b_p_code=" + b_p_code + ", b_product="
				+ b_product + ", i_content=" + i_content + ", i_date=" + i_date + ", i_answer=" + i_answer
				+ ", i_state=" + i_state + "]";
	}
	
}
