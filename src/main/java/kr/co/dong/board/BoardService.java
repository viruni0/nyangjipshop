package kr.co.dong.board;

import java.util.List;
import java.util.Map;


public interface BoardService {

	// 전체목록  처리를 위한 메소드
	public List<BoardDTO> List(paging paging) throws Exception;
   
	// 선택목록(글읽기)을 위한 메소드
	public BoardDTO detail(int b_p_bno) throws Exception;
   
	// 글쓰기를 위한 메소드
	public int register(BoardDTO BoardDTO) throws Exception;
   
	// 글수정을 위한 메소드
	public int update(BoardDTO BoardDTO) throws Exception;
   
	// 글삭제를 위한 메소드
	public int delete(int b_p_bno) throws Exception;
	
	// 조회수 증가를 위한 메소드
	public int updateReadCnt(int b_p_bno) throws Exception;

	// 댓글 전체 목록
	public List<BoardReply> sel_reply(int b_p_bno) throws Exception;
	   
	// 댓글 쓰기
	public int ins_reply(BoardReply boardReply) throws Exception;
   
	// 해당 댓글 읽기(조회)
	public BoardReply detailreply(int b_r_p_reno) throws Exception;
	   
	// 댓글 수정
	public int upd_reply(BoardReply boardReply) throws Exception;
	   
	// 댓글 삭제
	public int del_reply(BoardReply boardReply) throws Exception;
   
	// 로그인 처리를 위한 메소드
	public Map login(Map<String, Object> map);
   
	// 페이징 처리(전체 건수 조회)
	public int paging() throws Exception;
	
	// 장바구니
	public List<ProductDTO> basket(String u_p_id) throws Exception;
	
	// 찜목록
	public List<ProductDTO> wishlist(String u_p_id) throws Exception;
	
	// 메인
	public List<ProductDTO> main() throws Exception;
	
	// 상품 전체리스트(All)
	public List<ProductDTO> shop_list() throws Exception;
	
	// 상품(식품) 리스트(F)
	public List<ProductDTO> shop_list_F() throws Exception;
   
	// 상품(식품) 리스트(B)
	public List<ProductDTO> shop_list_B() throws Exception;
   
	// 상품(식품) 리스트(H)
	public List<ProductDTO> shop_list_H() throws Exception;
   
	// 상품(식품) 리스트(J)
	public List<ProductDTO> shop_list_J() throws Exception;
	
	// 상품 상세조회(shop_detail)
	public ProductDTO shop_detail(String b_p_code) throws Exception;
	
	// 상품 후기 조회
	public List<ReviewDTO> shop_review(String b_p_code) throws Exception;
	
	// 상품 후기 저장
	public int shop_detail_review(ReviewDTO reviewDTO) throws Exception;
	
	// 상품별 후기 개수
	public int shop_review_cnt(String b_p_code) throws Exception;
	   
	// 상품 문의 조회
	public List<InquiryDTO> shop_inquiry(String b_p_code) throws Exception;	
	
	// 상품 문의 저장
	public int shop_detail_inquiry(InquiryDTO inquiryDTO) throws Exception;
	
	// 상품별 문의 개수
	public int shop_inquiry_cnt(String b_p_code) throws Exception;
	
	// 문의저장
	public int qnainsert(BoardDTO boardDTO) throws Exception;
	
	// 신고작성
	public int reportinsert(BoardDTO boardDTO) throws Exception;
	
	// 개인 문의 목록(글읽기)을 위한 메소드
	public BoardDTO qadetail(int b_p_bno) throws Exception;
	
	// 신고 목록(글읽기)을 위한 메소드
	public BoardDTO rpdetail(int b_p_bno) throws Exception;
	
	// 상품 검색
	public List<ProductDTO> search(String keyWord) throws Exception;
	
}