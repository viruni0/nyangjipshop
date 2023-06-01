package kr.co.dong.board;

public class WishDTO {
	
	private String u_p_id;
	private String b_p_code;
	
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
	@Override
	public String toString() {
		return "WishDTO [u_p_id=" + u_p_id + ", b_p_code=" + b_p_code + "]";
	}
	
}
