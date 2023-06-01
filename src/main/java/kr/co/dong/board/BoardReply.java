package kr.co.dong.board;

import lombok.Data;

@Data
public class BoardReply {
   
	private int b_r_p_reno;
	private int b_p_bno;
	private String u_p_id;
	private String b_r_content;
	private String b_r_date;
	private int b_r_state;
	
	public int getB_r_p_reno() {
		return b_r_p_reno;
	}
	public void setB_r_p_reno(int b_r_p_reno) {
		this.b_r_p_reno = b_r_p_reno;
	}
	public int getB_p_bno() {
		return b_p_bno;
	}
	public void setB_p_bno(int b_p_bno) {
		this.b_p_bno = b_p_bno;
	}
	public String getU_p_id() {
		return u_p_id;
	}
	public void setU_p_id(String u_p_id) {
		this.u_p_id = u_p_id;
	}
	public String getB_r_content() {
		return b_r_content;
	}
	public void setB_r_content(String b_r_content) {
		this.b_r_content = b_r_content;
	}
	public String getB_r_date() {
		return b_r_date;
	}
	public void setB_r_date(String b_r_date) {
		this.b_r_date = b_r_date;
	}
	public int getB_r_state() {
		return b_r_state;
	}
	public void setB_r_state(int b_r_state) {
		this.b_r_state = b_r_state;
	}
	@Override
	public String toString() {
		return "BoardReply [b_r_p_reno=" + b_r_p_reno + ", b_p_bno=" + b_p_bno + ", u_p_id=" + u_p_id + ", b_r_content="
				+ b_r_content + ", b_r_date=" + b_r_date + ", b_r_state=" + b_r_state + "]";
	}
   
}