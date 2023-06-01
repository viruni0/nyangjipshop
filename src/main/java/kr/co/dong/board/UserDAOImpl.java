package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository //세션호출하기 위함
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	private static final String namespace = "kr.co.dong.boardMapper";
	
	// 아이디 찾기 결과
	@Override
	public UserDTO id_s_result(UserDTO UserDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".id_s_result", UserDTO);
	}
	
	// 비밀번호 찾기
	@Override
	public UserDTO pwsearch(UserDTO UserDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".pwsearch", UserDTO);
	}
	
	// 비밀번호 찾기 변경 저장
	@Override
	public UserDTO pw_s_result(UserDTO UserDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".pw_s_result", UserDTO);
	}
	
	// 유저 개인정보 조회
	@Override
	public UserDTO my_search(String u_p_id) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".my_search", u_p_id);
	}
	
	// 유저 개인정보 수정 저장
	@Override
	public int my_update(UserDTO UserDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.update(namespace+".my_update", UserDTO);
	}
	
	// 회원가입 중복방지 아이디 조회
	@Override
	public int Join_sel(String u_p_id) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".Join_sel", u_p_id);
	}
	
	// 회원가입 중복방지 닉네임 조회
	@Override
	public int join_nnamesel(String u_nname) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".join_nnamesel", u_nname);
	}
	
	// 회원가입
	@Override
	public int Join(UserDTO UserDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.insert(namespace+".Join", UserDTO);
	}
	
	// 유저 회원 탈퇴
	@Override
	public int my_out(UserDTO UserDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.update(namespace+".my_out", UserDTO);
	}
	
	// 유저 전체 조회
	@Override
	public List<UserDTO> searchlist(UserDTO UserDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".searchlist",UserDTO);
	}
	
	// 관리자 문의 내역
	@Override
	public List<UserDTO> qalist(String u_p_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".qalist", u_p_id);
	}
	
	// 관리자 문의 처리 완료시
	@Override
	public int qa_gmresult(int b_p_bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".rp_gmresult", b_p_bno);
	}

	// 관리자 신고 내역
	@Override
	public List<UserDTO> rplist(String u_p_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".rplist", u_p_id);
	}
	
	// 관리자 신고 처리 완료시
	@Override
	public int rp_gmresult(int b_p_bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".rp_gmresult", b_p_bno);
	}
	
	// 관리자 상품 문의 내역 조회
	@Override
	public List<InquiryDTO> shop_inquiry_gm() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".shop_inquiry_gm");
	}
	
	// 관리자 상품 문의 내역 읽기
	@Override
	public InquiryDTO inquirydetail(int i_p_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".inquirydetail", i_p_num);
	}
	
	// 관리자 상품 문의 저장
	@Override
	public int inquirydetail_result(InquiryDTO inquiryDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".inquirydetail_result", inquiryDTO);
	}
	
	// 관리자 유저 정보 조회 및 수정
	@Override
	public UserDTO update_gm(String u_p_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".update_gm", u_p_id);
	}
	
	// 관리자 유저 정보 조회 및 수정 저장
	@Override
	public int update_gm_up(UserDTO userDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".update_gm_up", userDTO);
	}
	
	// 유저정보조회
	@Override
	public List<UserDTO> ulist(String u_p_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".ulist",u_p_id);
	}
	
	// 개인 유저 문의 내역
	@Override
	public List<UserDTO> my_qalist(String u_p_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".my_qalist", u_p_id);
	}

	// 개인 유저 신고 내역
	@Override
	public List<UserDTO> my_rplist(String u_p_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".my_rplist", u_p_id);
	}
	
	// 개인 유저 리뷰 내역
	@Override
	public List<ReviewDTO> my_review(String u_p_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".my_review", u_p_id);
	}
	
	// 개인 유저 상품문의 내역 조회
	@Override
	public List<InquiryDTO> my_inquirylist(String u_p_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".my_inquirylist", u_p_id);
	}
	
	// 상품 디테일 유저 찜버튼 불러오기
	@Override
	public WishDTO wish(WishDTO WishDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".wish", WishDTO);
	}
	
	// ajax 디테일서 장바구니 조회
	@Override
	public BasketDTO detail_basket(BasketDTO BasketDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".detail_basket", BasketDTO);
	}	
	
	// ajax 디테일서 장바구니 담기
	@Override
	public int ins_basket(BasketDTO BasketDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.insert(namespace+".ins_basket", BasketDTO);
	}		
	
	// ajax shop_detail 찜추가
	@Override
	public int wish_like(WishDTO WishDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.insert(namespace+".wish_like", WishDTO);
	}
	
	// ajax shop_detail 찜삭제
	@Override
	public int wish_un(WishDTO WishDTO) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.delete(namespace+".wish_un", WishDTO);
	}
	
	// 찜 개수 표시
	@Override
	public int wish_cnt(String u_p_id) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".wish_cnt", u_p_id);
	}
	
	// 유저 개인 자유게시판 개수
	@Override
	public int user_board_count(String u_p_id) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".user_board_count", u_p_id);
	}
	
	// 유저 개인 리뷰 개수
	@Override
	public int my_review_count(String u_p_id) throws Exception {
	// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".my_review_count", u_p_id);
	}

	// ajax 장바구니 수정
	@Override
	public int upd_basket(BasketDTO BasketDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".upd_basket", BasketDTO);
	}
	
	// 장바구니 삭제
	@Override
	public int del_basket(BasketDTO BasketDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.delete(namespace+".del_basket", BasketDTO);
	}

}
