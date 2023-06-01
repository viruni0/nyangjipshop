package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	@Override
	public Map login(Map<String, Object> map) {
	// TODO Auto-generated method stub
		return dao.login(map);
	}

	@Override
	public List<BoardReply> sel_reply(int b_p_bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.sel_reply(b_p_bno);
	}

	@Override
	public int ins_reply(BoardReply boardReply) throws Exception {
		// TODO Auto-generated method stub
		return dao.ins_reply(boardReply);
	}

	@Override
	public BoardReply detailreply(int b_r_p_reno) throws Exception {
		// TODO Auto-generated method stub
		return dao.detailreply(b_r_p_reno);
	}

	@Override
	public int upd_reply(BoardReply boardReply) throws Exception {
		// TODO Auto-generated method stub
		return dao.upd_reply(boardReply);
	}

	@Override
	public int del_reply(BoardReply boardReply) throws Exception {
	// TODO Auto-generated method stub
		return dao.del_reply(boardReply);
	}

	@Override
	public List<BoardDTO> List(paging paging) throws Exception {
	// TODO Auto-generated method stub
		return dao.List(paging);
	}

	@Override
	public BoardDTO detail(int b_p_bno) throws Exception {
	// TODO Auto-generated method stub
		return dao.detail(b_p_bno);
	}

	@Override
	public int register(BoardDTO BoardDTO) throws Exception {
	// TODO Auto-generated method stub
		return dao.register(BoardDTO);
	}

	@Override
	public int update(BoardDTO BoardDTO) throws Exception {
	// TODO Auto-generated method stub
		return dao.update(BoardDTO);
	}

	@Override
	public int delete(int b_p_bno) throws Exception {
	// TODO Auto-generated method stub
		return dao.delete(b_p_bno);
	}

	@Override
	public int paging() throws Exception {
	// TODO Auto-generated method stub
		return dao.paging();
	}
	
	// 조회수 증가를 위한 메소드
	@Override
	public int updateReadCnt(int b_p_bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateReadCnt(b_p_bno);
	}
	
	// 장바구니
	@Override
	public List<ProductDTO> basket(String u_p_id) throws Exception{
		return dao.basket(u_p_id);
	}
	
	// 찜목록
	@Override
	public List<ProductDTO> wishlist(String u_p_id) throws Exception{
		return dao.wishlist(u_p_id);
	}
	
	// 메인
	@Override
	public List<ProductDTO> main() throws Exception {
		// TODO Auto-generated method stub
		return dao.main();
	}
	
	// 상품 전체리스트(All)
	@Override
	public List<ProductDTO> shop_list() throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_list();
	}
	
	// 상품(식품) 리스트(F)
	@Override
	public List<ProductDTO> shop_list_F() throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_list_F();
	}
	   
	// 상품(식품) 리스트(B)
	@Override
	public List<ProductDTO> shop_list_B() throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_list_B();
	}
	   
	// 상품(식품) 리스트(H)
	@Override
	public List<ProductDTO> shop_list_H() throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_list_H();
	}
	   
	// 상품(식품) 리스트(J)
	@Override
	public List<ProductDTO> shop_list_J() throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_list_J();
	}
	
	// 상품 상세조회(detail)
	@Override
	public ProductDTO shop_detail(String b_p_code) throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_detail(b_p_code);
	}
	
	// 상품 후기 조회
	@Override
	public List<ReviewDTO> shop_review(String b_p_code) throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_review(b_p_code);
	}
	
	// 상품 후기 저장
	@Override
	public int shop_detail_review(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_detail_review(reviewDTO);
	}
	
	// 상품별 후기 개수
	@Override
	public int shop_review_cnt(String b_p_code) throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_review_cnt(b_p_code);
	}
	   
	// 상품 문의 조회
	@Override
	public List<InquiryDTO> shop_inquiry(String b_p_code) throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_inquiry(b_p_code);
	}
	
	// 상품 문의 저장
	@Override
	public int shop_detail_inquiry(InquiryDTO inquiryDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_detail_inquiry(inquiryDTO);
	}
	
	// 상품별 문의 개수
	@Override
	public int shop_inquiry_cnt(String b_p_code) throws Exception {
		// TODO Auto-generated method stub
		return dao.shop_inquiry_cnt(b_p_code);
	}
	
	// 문의저장
	@Override
	public int qnainsert(BoardDTO boardDTO) throws Exception{
		return dao.qnainsert(boardDTO);
	}
	
	// 신고작성
	@Override
	public int reportinsert(BoardDTO boardDTO) throws Exception {
		return dao.reportinsert(boardDTO);
	}
	
	// 개인 문의 목록(글읽기)을 위한 메소드
	@Override
	public BoardDTO qadetail(int b_p_bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.qadetail(b_p_bno);
	}
	
	// 신고 목록(글읽기)을 위한 메소드
	@Override
	public BoardDTO rpdetail(int b_p_bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.rpdetail(b_p_bno);
	}
	
	// 상품 검색
	@Override
	public List<ProductDTO> search(String keyWord) throws Exception {
		// TODO Auto-generated method stub
		return dao.search(keyWord);
	}
	
}