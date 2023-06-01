package kr.co.dong.board;

public class BasketDTO {
	
	private String u_p_id;
	private String b_p_code;
	private int b_num;
	
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
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	
	@Override
	public String toString() {
		return "BasketDTO [u_p_id=" + u_p_id + ", b_p_code=" + b_p_code + ", b_num=" + b_num + "]";
	}
	
}
