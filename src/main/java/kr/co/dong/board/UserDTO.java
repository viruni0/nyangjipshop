package kr.co.dong.board;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDTO {
	
	private String u_p_id;
	private String u_p_snumber;
	private String u_nname;
	private String u_pw;
	private String u_name;
	private String u_phone;
	private String u_address;
	private String u_gender;
	private String u_mail;
	private int u_personaldata;
	private int u_advertising;
	private int u_state;
	private int u_media;
	private int u_b_cnt;
	
	private Member_user member_user;

	public String getU_p_id() {
		return u_p_id;
	}

	public void setU_p_id(String u_p_id) {
		this.u_p_id = u_p_id;
	}

	public String getU_p_snumber() {
		return u_p_snumber;
	}

	public void setU_p_snumber(String u_p_snumber) {
		this.u_p_snumber = u_p_snumber;
	}

	public String getU_nname() {
		return u_nname;
	}

	public void setU_nname(String u_nname) {
		this.u_nname = u_nname;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_mail() {
		return u_mail;
	}

	public void setU_mail(String u_mail) {
		this.u_mail = u_mail;
	}

	public int getU_personaldata() {
		return u_personaldata;
	}

	public void setU_personaldata(int u_personaldata) {
		this.u_personaldata = u_personaldata;
	}

	public int getU_advertising() {
		return u_advertising;
	}

	public void setU_advertising(int u_advertising) {
		this.u_advertising = u_advertising;
	}

	public int getU_state() {
		return u_state;
	}

	public void setU_state(int u_state) {
		this.u_state = u_state;
	}

	public int getU_media() {
		return u_media;
	}

	public void setU_media(int u_media) {
		this.u_media = u_media;
	}

	public int getU_b_cnt() {
		return u_b_cnt;
	}

	public void setU_b_cnt(int u_b_cnt) {
		this.u_b_cnt = u_b_cnt;
	}

	public Member_user getMember_user() {
		return member_user;
	}

	public void setMember_user(Member_user member_user) {
		this.member_user = member_user;
	}

	@Override
	public String toString() {
		return "UserDTO [u_p_id=" + u_p_id + ", u_p_snumber=" + u_p_snumber + ", u_nname=" + u_nname + ", u_pw=" + u_pw
				+ ", u_name=" + u_name + ", u_phone=" + u_phone + ", u_address=" + u_address + ", u_gender=" + u_gender
				+ ", u_mail=" + u_mail + ", u_personaldata=" + u_personaldata + ", u_advertising=" + u_advertising
				+ ", u_state=" + u_state + ", u_media=" + u_media + ", u_b_cnt=" + u_b_cnt + ", member_user="
				+ member_user + "]";
	}
	
}
