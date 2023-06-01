package kr.co.dong.board;

import java.util.List;
import java.util.Map;

public interface UserDAO {
	
	// 아이디 찾기
	public UserDTO id_s_result(UserDTO UserDTO) throws Exception;
	
	// 비밀번호 찾기
	public UserDTO pwsearch(UserDTO UserDTO) throws Exception;
	
	// 비밀번호 찾기 변경 저장
	public UserDTO pw_s_result(UserDTO UserDTO) throws Exception;
	
	// 유저 개인정보 조회
	public UserDTO my_search(String u_p_id) throws Exception;
	
	// 유저 개인정보 수정 저장
	public int my_update(UserDTO UserDTO) throws Exception;
	
	// 회원가입 중복방지 아이디 조회
	public int Join_sel(String u_p_id) throws Exception;
	
	// 회원가입 중복방지 닉네임 조회
	public int join_nnamesel(String u_nname) throws Exception;
	
	// 회원가입
	public int Join(UserDTO UserDTO) throws Exception;
	
	// 유저 회원 탈퇴
	public int my_out(UserDTO UserDTO) throws Exception;
	
	// 전체 유저 조회
	public List<UserDTO> searchlist(UserDTO UserDTO) throws Exception;
	
	// 관리자 문의 내역 조회
	public List<UserDTO> qalist (String u_p_id) throws Exception;
	
	// 관리자 문의 처리 완료시
	public int qa_gmresult (int b_p_bno) throws Exception;
	
	// 관리자 신고 내역 조회
	public List<UserDTO> rplist (String u_p_id) throws Exception;
	
	// 관리자 신고 처리 완료시
	public int rp_gmresult (int b_p_bno) throws Exception;
	
	// 관리자 상품 문의 내역 조회
	public List<InquiryDTO> shop_inquiry_gm() throws Exception;
	
	// 관리자 상품 문의 내역 읽기
	public InquiryDTO inquirydetail(int i_p_num) throws Exception;
	
	// 관리자 상품 문의 내역 저장
	public int inquirydetail_result(InquiryDTO inquiryDTO) throws Exception;
	
	// 관리자 유저 정보 조회 및 수정
	public UserDTO update_gm(String u_p_id) throws Exception;
	
	// 관리자 유저 정보 조회 및 수정 저장
	public int update_gm_up(UserDTO userDTO) throws Exception;
	
	// 개인 유저 문의 내역
	public List<UserDTO> my_qalist (String u_p_id) throws Exception;
	
	// 개인 유저 신고 내역
	public List<UserDTO> my_rplist (String u_p_id) throws Exception;
	
	// 개인 유저 리뷰 내역
	public List<ReviewDTO> my_review(String u_p_id) throws Exception;
	
	// 개인 유저 상품문의 내역 조회
	public List<InquiryDTO> my_inquirylist(String u_p_id) throws Exception;
	
	// 상품 디테일 유저 찜버튼 불러오기
	public WishDTO wish(WishDTO WishDTO) throws Exception;
	
	// ajax 디테일서 장바구니 조회
	public BasketDTO detail_basket(BasketDTO BasketDTO) throws Exception;
	
	// ajax 디테일서 장바구니 담기
	public int ins_basket(BasketDTO BasketDTO) throws Exception;
	
	// ajax shop_detail 찜추가
	public int wish_like(WishDTO WishDTO) throws Exception;
	
	// ajax shop_detail 찜삭제
	public int wish_un(WishDTO WishDTO) throws Exception;
	
	// 찜 개수 표시
	public int wish_cnt(String u_p_id) throws Exception;
	
	// 유저 개인 자유게시판 개수
	public int user_board_count(String u_p_id) throws Exception;
	
	// 유저 개인 리뷰 개수
	public int my_review_count(String u_p_id) throws Exception;
	
	// 유저정보조회
	public List<UserDTO> ulist(String u_p_id) throws Exception;
	
	// ajax 장바구니 수정
	public int upd_basket(BasketDTO BasketDTO) throws Exception;
	
	// 장바구니 삭제
	public int del_basket(BasketDTO BasketDTO) throws Exception;

}
