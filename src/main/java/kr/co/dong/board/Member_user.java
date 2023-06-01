package kr.co.dong.board;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Member_user {
	
	String m_p_grade;
	String u_p_id;
	int m_u_exp;
	int m_u_coupon;
	
	public String getM_p_grade() {
		return m_p_grade;
	}
	public void setM_p_grade(String m_p_grade) {
		this.m_p_grade = m_p_grade;
	}
	public String getU_p_id() {
		return u_p_id;
	}
	public void setU_p_id(String u_p_id) {
		this.u_p_id = u_p_id;
	}
	public int getM_u_exp() {
		return m_u_exp;
	}
	public void setM_u_exp(int m_u_exp) {
		this.m_u_exp = m_u_exp;
	}
	public int getM_u_coupon() {
		return m_u_coupon;
	}
	public void setM_u_coupon(int m_u_coupon) {
		this.m_u_coupon = m_u_coupon;
	}
	
	@Override
	public String toString() {
		return "member_user [m_p_grade=" + m_p_grade + ", u_p_id=" + u_p_id + ", m_u_exp=" + m_u_exp + ", m_u_coupon="
				+ m_u_coupon + "]";
	}
	
}
