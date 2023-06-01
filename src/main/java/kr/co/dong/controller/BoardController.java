package kr.co.dong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.Session;

import kr.co.dong.board.BasketDTO;
import kr.co.dong.board.BoardDTO;
import kr.co.dong.board.BoardReply;
import kr.co.dong.board.BoardService;
import kr.co.dong.board.InquiryDTO;
import kr.co.dong.board.Member_user;
import kr.co.dong.board.ProductDTO;
import kr.co.dong.board.ReviewDTO;
import kr.co.dong.board.UserDTO;
import kr.co.dong.board.UserService;
import kr.co.dong.board.WishDTO;
import kr.co.dong.board.paging;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	@Autowired
	UserService Uservice;
	
	// 회원가입
	@RequestMapping(value="login/join", method = RequestMethod.GET)
	public String join() throws Exception {
		
		return "join";
	}
	
	// ajax 회원가입 아이디 중복 조회
	@ResponseBody
	@RequestMapping(value = "login/join_sel", method = RequestMethod.POST)
	public int join_sel(@RequestParam("u_p_id") String u_p_id) throws Exception {
		return Uservice.Join_sel(u_p_id);
	}
	
	// ajax 회원가입 닉네임 중복 조회
	@ResponseBody
	@RequestMapping(value = "login/join_nnamesel", method = RequestMethod.POST)
	public int join_nnamesel(@RequestParam("u_nname") String u_nname) throws Exception {
		return Uservice.join_nnamesel(u_nname);
	}
	
	// 회원가입 저장
	@RequestMapping(value="login/join", method = RequestMethod.POST)
	public String join(UserDTO UserDTO, HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		
		int r = Uservice.Join(UserDTO);
		
		return "redirect:/";
	}
	
	// 회원탈퇴
	@RequestMapping(value="mypageU/my_out", method = RequestMethod.GET)
	public String my_out(HttpSession session, String u_p_id, Model model) throws Exception {
		
		u_p_id = (String)session.getAttribute("u_p_id");
		UserDTO usersearch = Uservice.my_search(u_p_id);
		model.addAttribute("usersearch",usersearch);
		
		return "my_out";
	}
	
	// 회원탈퇴 완료
	@RequestMapping(value="mypageU/my_out", method = RequestMethod.POST)
	public String my_out(UserDTO UserDTO, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		int r = Uservice.my_out(UserDTO);
		if(r>0) {
			// 탈퇴 성공
			rttr.addFlashAttribute("msg", "탈퇴에 성공하였습니다.");
			session.invalidate();
		}
		return "my_outclose";
	}
	
	// 아이디 찾기
	@RequestMapping(value="login/idsearch", method = RequestMethod.GET)
	public String idsearch(UserDTO UserDTO) throws Exception {
		
		return "idsearch";
	}
	
	// 아이디 찾기 결과
	@RequestMapping(value="login/id_s_result", method = RequestMethod.POST)
	public String id_s_result(UserDTO UserDTO, RedirectAttributes rttr, Model model) throws Exception {
		
		UserDTO usersearch = Uservice.id_s_result(UserDTO);
		
		if(usersearch == null) {
			// 일치하는 값이 없을때
			rttr.addFlashAttribute("msg", "일치하는 유저 정보가 없습니다.");
			return "redirect:idsearch";
		} else {
			model.addAttribute("usersearch",usersearch);
			return "id_s_result";
		}
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value="login/pwsearch", method = RequestMethod.GET)
	public String pwsearch() throws Exception {
		
		return "pwsearch";
	}
	
	// 비밀번호 찾기 
	@RequestMapping(value="login/pwsearch", method = RequestMethod.POST)
	public String pwsearch(UserDTO UserDTO, Model model) throws Exception {
		
		UserDTO usersearch = Uservice.pwsearch(UserDTO);
		model.addAttribute("usersearch",usersearch);
		
		return "pwsearch";
	}
	
	// 비밀번호 찾기 결과 폼
	@GetMapping(value="login/pw_s_result")
	public String pw_s_result(UserDTO UserDTO, RedirectAttributes rttr, Model model) throws Exception {
		UserDTO usersearch = Uservice.pwsearch(UserDTO);
		// 일치하는 값이 있는지 확인
		if(usersearch == null) {
			// 일치하는 값이 없을때
			rttr.addFlashAttribute("msg", "일치하는 유저 정보가 없습니다.");
			return "redirect:pwsearch";
		} else {
			model.addAttribute("usersearch",usersearch);
			return "pw_s_result";
		}
	}
	
	// 비밀번호 찾기 결과 저장
	@PostMapping(value="login/pw_s_result")
	public String pw_s_result(UserDTO UserDTO, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		// 내용 저장할 서비스 불러오기
		UserDTO r = Uservice.pw_s_result(UserDTO);
		
		return "redirect:/";
	}
	
	// 개인정보 조회
	@RequestMapping(value="mypageU/my_search", method = RequestMethod.GET)
	public String my_search(HttpSession session, String u_p_id, Model model) throws Exception {
		
		u_p_id = (String)session.getAttribute("u_p_id");
		UserDTO usersearch = Uservice.my_search(u_p_id);
		model.addAttribute("usersearch",usersearch);
		
		return "my_search";
	}
	
	// 개인정보 수정 넘어가기전 비밀번호 확인
	@RequestMapping(value="mypageU/pwtest", method = RequestMethod.GET)
	public String pwtest(HttpSession session, String u_p_id, Model model) throws Exception {
		
		u_p_id = (String)session.getAttribute("u_p_id");
		UserDTO usersearch = Uservice.my_search(u_p_id);
		model.addAttribute("usersearch",usersearch);
		
		return "pwtest";
	}
	
	// 개인정보 수정
	@RequestMapping(value="mypageU/my_update", method = RequestMethod.GET)
	public String my_update(HttpSession session, String u_p_id, Model model) throws Exception {
		
		u_p_id = (String)session.getAttribute("u_p_id");
		UserDTO usersearch = Uservice.my_search(u_p_id);
		model.addAttribute("usersearch",usersearch);
		
		return "my_update";
	}
	
	// 개인정보 수정 저장
	@RequestMapping(value="mypageU/my_update", method = RequestMethod.POST)
	public String my_update(UserDTO UserDTO, Model model, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		int r = Uservice.my_update(UserDTO);
		if(r>0) {
			// 수정 성공
			rttr.addFlashAttribute("msg", "수정에 성공하였습니다.");
		}
		return "redirect:my_search";
	}
	
	// 고객센터
	@RequestMapping(value="cs/cs", method = RequestMethod.GET)
	public String cs() throws Exception {
		return "cs";
	}
	
	// 문의
	@RequestMapping(value="one_qna/qna", method = RequestMethod.GET)
	public String one_qna() throws Exception {
		return "one_qna";
	}
	
	//문의 저장
	@RequestMapping(value="one_qna/qna", method = RequestMethod.POST)
	public String qnainsert(BoardDTO boardDTO, HttpServletRequest request)throws Exception {
		System.out.println("!!!!qnainsert");
		
		request.setCharacterEncoding("utf-8");
		int r = service.qnainsert(boardDTO);
	
		return "my_outclose";
	}
	
	// 신고폼
	@RequestMapping(value = "report/report", method = RequestMethod.GET)
	public String report() throws Exception {
		return "report";
	}

	// 신고작성
	@RequestMapping(value = "report/report", method = RequestMethod.POST)
	public String reportinsert(BoardDTO boardDTO, HttpServletRequest request) throws Exception {
		System.out.println("!?!?!?!?!??!?!?!?");

		request.setCharacterEncoding("utf-8");
		int r = service.reportinsert(boardDTO);

		return "my_outclose";
	}
	
	// 관리자 문의내역 조회
	@RequestMapping(value="mypageGM/qa_gm", method = RequestMethod.GET)
	public ModelAndView qa_gm(HttpSession session,String u_p_id,  Model model) throws Exception {
		u_p_id = (String)session.getAttribute("u_p_id");
		ModelAndView mva = new ModelAndView();
		List <UserDTO> qa_gm = Uservice.qalist(u_p_id);
		mva.addObject("qalist", qa_gm);
		mva.setViewName("qa_gm");
		
		return mva;
	}
	
	// 관리자 문의 완료버튼 클릭시
	@RequestMapping(value="mypageGM/qa_gmresult", method = RequestMethod.GET)
	public String qa_gmresult(@RequestParam("b_p_bno") int b_p_bno) throws Exception {
		
		int r = Uservice.qa_gmresult(b_p_bno);
		
		return "redirect:qa_gm";
	}
	
	// 관리자 신고내역 조회
	@RequestMapping(value="mypageGM/rp_gm", method = RequestMethod.GET)
	public ModelAndView rp_gm(HttpSession session,String u_p_id,  Model model) throws Exception {
		u_p_id = (String)session.getAttribute("u_p_id");
		ModelAndView mvt = new ModelAndView();
		List <UserDTO> rp_gm = Uservice.rplist(u_p_id);
		mvt.addObject("rp_gm", rp_gm);
		mvt.setViewName("rp_gm");
		
		return mvt;
	}
	
	//신고목록(글읽기)
	@RequestMapping(value="cs/rpdetail", method = RequestMethod.GET)
	public String rpdetail(@RequestParam("b_p_bno") int b_p_bno, Model model) throws Exception {
		
		BoardDTO board = service.rpdetail(b_p_bno);
		model.addAttribute("board",board);
		System.out.println(board.getB_p_bno());
		board.getB_p_bno();
		List<BoardReply> list = service.sel_reply(b_p_bno);
		model.addAttribute("list", list);

		return "rpdetail";
	}
	
	// 관리자 신고 완료버튼 클릭시
	@RequestMapping(value="mypageGM/rp_gmresult", method = RequestMethod.GET)
	public String rp_gmresult(@RequestParam("b_p_bno") int b_p_bno) throws Exception {
		
		int r = Uservice.rp_gmresult(b_p_bno);
		
		return "redirect:rp_gm";
	}
	
	// 관리자 상품 문의 내역 조회
	@RequestMapping(value="mypageGM/shop_inquiry_gm", method = RequestMethod.GET)
	public ModelAndView inquiry_gm() throws Exception {
		ModelAndView mvt = new ModelAndView();
		List <InquiryDTO> shop_inquiry_gm = Uservice.shop_inquiry_gm();
		mvt.addObject("shop_inquiry_gm", shop_inquiry_gm);
		mvt.setViewName("shop_inquiry_gm");
		
		return mvt;
	}
	
	// 관리자 상품 문의 글읽기 및 답변
	@RequestMapping(value="mypageGM/inquirydetail", method = RequestMethod.GET)
	public String inquirydetail(@RequestParam("i_p_num") int i_p_num, Model model) throws Exception {
		
		InquiryDTO inquirydetail = Uservice.inquirydetail(i_p_num);
		model.addAttribute("inquirydetail", inquirydetail);
		
		return "inquirydetail";
	}
	
	// 관리자 상품 문의 글읽기 및 답변 저장
	@RequestMapping(value="mypageGM/inquirydetail", method = RequestMethod.POST)
	public String inquirydetail(InquiryDTO inquiryDTO) throws Exception {
		
		int r = Uservice.inquirydetail_result(inquiryDTO);
		
		return "redirect:shop_inquiry_gm";
	}
	
	//개인 유저 문의내역 조회
	@RequestMapping(value="cs/my_qalist", method = RequestMethod.GET)
	public ModelAndView my_qalist(HttpSession session, String u_p_id,  Model model) throws Exception {
		
		u_p_id = (String)session.getAttribute("u_p_id");
		ModelAndView mvu = new ModelAndView();
		List <UserDTO> my_qalist = Uservice.my_qalist(u_p_id);
		mvu.addObject("my_qalist", my_qalist);
		mvu.setViewName("my_qalist");
		
		return mvu;
	}

	// 개인 유저 신고내역 조회
	@RequestMapping(value="report/my_rplist", method = RequestMethod.GET)
	public ModelAndView my_rplist(HttpSession session,String u_p_id,  Model model) throws Exception {
		u_p_id = (String)session.getAttribute("u_p_id");
		ModelAndView mvp = new ModelAndView();
		List<UserDTO> my_rplist = Uservice.my_rplist(u_p_id);
		mvp.addObject("my_rplist", my_rplist);
		mvp.setViewName("my_rplist");
		
		return mvp;
	}
	
	// 개인 유저 상품문의 내역 조회
	@RequestMapping(value="mypageU/my_inquirylist", method = RequestMethod.GET)
	public String my_inquirylist(HttpSession session, String u_p_id, Model model) throws Exception {
		u_p_id = (String)session.getAttribute("u_p_id");
		List<InquiryDTO> my_inquirylist = Uservice.my_inquirylist(u_p_id);
		model.addAttribute("my_inquirylist", my_inquirylist);
		
		return "my_inquirylist";
	}
	
	// 문의목록(글읽기)
	@RequestMapping(value="cs/qadetail", method = RequestMethod.GET)
	public String qadetail(@RequestParam("b_p_bno") int b_p_bno, Model model) throws Exception {
		
		BoardDTO board = service.qadetail(b_p_bno);
		model.addAttribute("board",board);
		System.out.println(board.getB_p_bno());
		board.getB_p_bno();
		List<BoardReply> list = service.sel_reply(b_p_bno);
		model.addAttribute("list", list);

		return "qadetail";
	}
	
	// 문의 글 삭제
	@RequestMapping(value="cs/qadel",method = RequestMethod.GET)
	public String qadel(@RequestParam("b_p_bno") int b_p_bno, RedirectAttributes rttr) throws Exception {
		int r = service.delete(b_p_bno);
		// 삭제에 성공하면 게시판 목록보기로 이동
		if(r>0) {
			rttr.addFlashAttribute("msg", "삭제에 성공하였습니다.");
			return "redirect:my_qalist";
		}
		// 삭제에 실패하면 기존상세보기 화면으로 이동
		return "redirect:qadetail?b_p_bno="+b_p_bno;
	}

	// 관리자 전체 유저 조회
	@RequestMapping(value="mypageGM/search_gm", method = RequestMethod.GET)
	public ModelAndView search_gm(UserDTO UserDTO,  Model model) throws Exception {
		
		ModelAndView mvg=new ModelAndView();
		List <UserDTO> search_gm = Uservice.searchlist(UserDTO);
		mvg.addObject("searchlist", search_gm);
		mvg.setViewName("search_gm");
		
		return mvg;
	}
	
	// 관리자 유저 정보 조회 및 수정
	@RequestMapping(value="mypageGM/update_gm", method = RequestMethod.GET)
	public String update_gm(@RequestParam("u_p_id") String u_p_id,Model model) throws Exception {
		
		UserDTO usersearch = Uservice.update_gm(u_p_id);
		model.addAttribute("usersearch",usersearch);
		
		return "update_gm";
	}
	
	// 관리자 유저 정보 조회 및 수정 저장
	@RequestMapping(value="mypageGM/update_gm", method = RequestMethod.POST)
	public String update_gm_up(UserDTO userDTO) throws Exception {
		
		int r = Uservice.update_gm_up(userDTO);
		String u_p_id = userDTO.getU_p_id();
		return "redirect:update_gm?u_p_id="+u_p_id;
	}
	
	//자유게시판 전체리스트 조회
	/* 1. 입출력값이 어떻게 되는지(매개변수와 리턴값 확인)
	* 2. 사용할 데이터 조작방식 선택(get/post)
	* 추가 : 첫단에 logger.info 적어두면 오류 났을때 찾기 편함
	*/

	@RequestMapping(value="board_dto/freelist", method = RequestMethod.GET)
	public ModelAndView freelist(@RequestParam(value="page", required = false, defaultValue="1") int page, 
		@RequestParam(value="range", required = false, defaultValue="1") int range) throws Exception {
		// 장바구니 같은 거(조회한 것 넣어줌)
		ModelAndView mav = new ModelAndView();
		// 페이징 처리(전체 건수 조회)
		paging paging = new paging();
		int listCnt = service.paging();
		paging.pageInfo(page, range, listCnt);
		mav.addObject("pagination", paging);
		mav.setViewName("pagination");
		// 게시판 전체 리스트 조회하는 sql을 list라는 이름으로 저장(多건)
		List<BoardDTO> list = service.List(paging); 
		// "list"라는 이름으로 넣어놓음
		mav.addObject("list", list);
		// 화면에 "list" 넘겨줌
		mav.setViewName("free");
		return mav; 
	}
		
	// 선택목록(글읽기)
	@RequestMapping(value = "board_dto/fr_detail", method = RequestMethod.GET)
	public String fr_detail(@RequestParam("b_p_bno") int b_p_bno, Model model) throws Exception {

		BoardDTO board = service.detail(b_p_bno);
		model.addAttribute("board", board);

		System.out.println(board.getB_p_bno());
		board.getB_p_bno();

		List<BoardReply> list = service.sel_reply(b_p_bno);
		model.addAttribute("list", list);

		// 조회 수 증가
		int r = service.updateReadCnt(b_p_bno);

		return "fr_detail";
	}
	
	//글쓰기폼
	@RequestMapping(value="board_dto/fr_register", method = RequestMethod.GET)
	public String fr_register() {
		
		return "fr_register";
	}
	
	//글쓰기 저장
	@RequestMapping(value="board_dto/fr_register", method = RequestMethod.POST)
	public String fr_register(BoardDTO boardDTO, HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = service.register(boardDTO);
		
		return "redirect:freelist";
	}
	
	//글 수정 폼(기존데이터 전송- 글읽기)
	@RequestMapping(value="board_dto/fr_update", method = RequestMethod.GET)
	public String fr_update(@RequestParam("b_p_bno") int b_p_bno, Model model) throws Exception {
		BoardDTO board = service.detail(b_p_bno);
		model.addAttribute("board",board);
		return "fr_update";
	}	
	
	//글 수정 저장
	@RequestMapping(value="board_dto/fr_update", method = RequestMethod.POST)
	public String fr_update(BoardDTO boardDTO, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = service.update(boardDTO);
		
		// 수정에 성공하면 목록보기로 이동
		if(r>0) {
			rttr.addFlashAttribute("msg", "수정에 성공하였습니다.");
			return "redirect:freelist";
		}
		// 수정에 실패하면 수정보기 화면으로 이동
		return "redirect:fr_update?b_p_bno="+boardDTO.getB_p_bno();
	}
	
	// 글 삭제
	@RequestMapping(value="board_dto/fr_delete",method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("b_p_bno") int b_p_bno, RedirectAttributes rttr) throws Exception {
		int r = service.delete(b_p_bno);
		// 삭제에 성공하면 게시판 목록보기로 이동
		if(r>0) {
			rttr.addFlashAttribute("msg", "삭제에 성공하였습니다.");
			return "redirect:freelist";
		}
		// 삭제에 실패하면 기존상세보기 화면으로 이동
		return "redirect:fr_delete?b_p_bno="+b_p_bno;
	}
	
	// 댓글 쓰기 폼
	@GetMapping(value="board/ins_reply")
	public String ins_reply() {
		return "ins_reply";
	}
	   
	// 댓글 쓰기 저장
	@PostMapping(value="board/ins_reply")
	public String reply(BoardReply boardReply) throws Exception {
		int r = service.ins_reply(boardReply);
		if(r>0) {
			return "redirect:fr_detail?b_p_bno=" + boardReply.getB_p_bno();
		}
		return "ins_reply";
	}
	   
	// 댓글 수정 폼
	@GetMapping(value="board/upd_reply")
	public String replyUpdate(@RequestParam("b_r_p_reno")int b_r_p_reno, Model model) throws Exception {
		BoardReply boardReply = service.detailreply(b_r_p_reno);
		model.addAttribute("boardReply", boardReply);
		return "upd_reply";
	}
	   
	// 댓글 수정 저장
	@PostMapping(value="board/upd_reply")
	public String replyUpdate(BoardReply boardReply) throws Exception {
		
		int r = service.upd_reply(boardReply);
		if(r>0) {
			return "redirect:fr_detail?b_p_bno=" + boardReply.getB_p_bno();
		}
		return "upd_reply";
	}
	   
	// 댓글 삭제
	@RequestMapping(value="board/del_reply", method = {RequestMethod.GET, RequestMethod.POST})
	public String replyDelete(BoardReply boardReply) throws Exception {
		
		int r = service.del_reply(boardReply);
		if(r>0) {
			return "redirect:fr_detail?b_p_bno=" + boardReply.getB_p_bno();
		}
		return "upd_reply";
	}
	
	// 마이페이지
	@RequestMapping(value="mypageU/my_user", method = RequestMethod.GET)
	public ModelAndView my_user(HttpSession session, String u_p_id) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		u_p_id = (String)session.getAttribute("u_p_id");
		// 유저 개인 찜 개수
		int wish_cnt = Uservice.wish_cnt(u_p_id);
		mv.addObject("wish_cnt", wish_cnt);
		// 유저 개인 자유게시판 개수
		int user_board_count = Uservice.user_board_count(u_p_id);
		mv.addObject("user_board_count", user_board_count);
		// 유저 개인 리뷰 개수
		int my_review_count = Uservice.my_review_count(u_p_id);
		mv.addObject("my_review_count", my_review_count);
		
		mv.setViewName("my_user");
			
		return mv;
	}
	
	// 마이페이지 리뷰목록
	@RequestMapping(value="mypageU/my_review", method = RequestMethod.GET)
	public String my_review(HttpSession session, String u_p_id, ReviewDTO ReviewDTO, Model model) throws Exception {
		
		u_p_id = (String) session.getAttribute("u_p_id");
		List<ReviewDTO> reviewDTO = Uservice.my_review(u_p_id);
		model.addAttribute("review", reviewDTO);
		
		return "my_review";
	}
	/*
	// 멤버쉽 페이지
	@RequestMapping(value="mypageU/my_member", method = RequestMethod.GET)
	public String my_member() throws Exception {
			
		return "my_member";
	}
	*/
	// 찜목록
	@RequestMapping(value="mypageU/my_wish", method = RequestMethod.GET)
	public ModelAndView wish(HttpSession session, String u_p_id)throws Exception {
		
		ModelAndView mvc = new ModelAndView();
		u_p_id = (String)session.getAttribute("u_p_id");
		List<ProductDTO> wish1 = service.wishlist(u_p_id);
		mvc.addObject("wish1", wish1);
		mvc.setViewName("my_wish");
	  
		return mvc;
	}
	/*
	// ajax 찜목록에서 조회
	@ResponseBody
	@RequestMapping(value = "mypageU/wishlist", method = RequestMethod.POST)
	public List<ProductDTO> wish_check(@RequestParam("u_p_id") String u_p_id) throws Exception {
		return service.wishlist(u_p_id);
	}
	*/
	// 찜목록에서 삭제
	@RequestMapping(value = "mypageU/wishdel", method = RequestMethod.GET)
	public String wish_del(HttpSession session, String u_p_id, @RequestParam("b_p_code") String b_p_code, WishDTO WishDTO) throws Exception {
		u_p_id = (String) session.getAttribute("u_p_id");
		WishDTO.setU_p_id(u_p_id);
		Uservice.wish_un(WishDTO);
		return "redirect:my_wish";
	}
	
	// 관리자 마이페이지
	@RequestMapping(value="mypageGM/my_gm", method = RequestMethod.GET)
	public String my_gm() {
			
		return "my_gm";
	}
	
	// 장바구니
	@RequestMapping(value = "basket/sel_basket", method = RequestMethod.GET)
	public ModelAndView sel_basket(HttpSession session, String u_p_id) throws Exception {
		ModelAndView mv = new ModelAndView();
		u_p_id = (String) session.getAttribute("u_p_id");
		List<ProductDTO> basketlist = service.basket(u_p_id);
		mv.addObject("blist", basketlist);
		mv.setViewName("basket");

		return mv;
	}
	
	// ajax 장바구니 수량 수정
	@ResponseBody
	@RequestMapping(value = "basket/upd_basket", method = RequestMethod.POST)
	public int upd_basket(BasketDTO BasketDTO) throws Exception {
		return Uservice.upd_basket(BasketDTO);
	}
	
	// 장바구니 삭제
	@RequestMapping(value = "basket/del_basket", method = RequestMethod.GET)
	public String del_basket(HttpSession session, String u_p_id, @RequestParam("b_p_code") String b_p_code, BasketDTO BasketDTO) throws Exception {
		u_p_id = (String) session.getAttribute("u_p_id");
		BasketDTO.setU_p_id(u_p_id);
		Uservice.del_basket(BasketDTO);
		return "redirect:sel_basket";
	}
	/*
	// 결제 하기
	@RequestMapping(value = "pay/pay", method = RequestMethod.GET)
	public ModelAndView pay(HttpSession session, String u_p_id) throws Exception {
		ModelAndView mp = new ModelAndView();
		u_p_id = (String) session.getAttribute("u_p_id");
		List<ProductDTO> lste = service.basket(u_p_id);
		mp.addObject("bt", lste);
		mp.setViewName("payment");

		return mp;
	}
		
	// 결제 완료
	@RequestMapping(value = "pay/pay_result", method = RequestMethod.GET)
	public ModelAndView pay_result(HttpSession session, String u_p_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		u_p_id = (String) session.getAttribute("u_p_id");
		List<UserDTO> ull = Uservice.ulist(u_p_id);
		mav.addObject("ulist", ull);
		mav.setViewName("pay_result");

		return mav;
	}
	*/
	// ajax 매핑과 메소드를 구현
	// json처리를 위한 라이브러리가 필요함 => jackson-databind, jackson-core
	// result type도 json 타입이므로, map으로 보내줘야함. String 안됨
	@ResponseBody //ajax는 꼭 작성해줘야함
	@RequestMapping(value="board/test", method = RequestMethod.POST)
	public Map<String,Object> test(@RequestParam("msg") String msg) {
		logger.info("msg : "+msg);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("status","OK");
		return result;
	}
	
	//ajax 댓글에 대한 매핑과 메소드를 구현(모델에 싣지 않고 그대로 return)
	@ResponseBody
	@RequestMapping(value="board/replylist", method = RequestMethod.POST)
	public List<BoardReply> replylist(@RequestParam("b_p_bno")int b_p_bno) throws Exception {
		return service.sel_reply(b_p_bno);
	}
	
	//ajax 댓글 쓰기
	@ResponseBody
	@RequestMapping(value="board/reply2", method = RequestMethod.POST)
	public int reply2(BoardReply boardReply) throws Exception {
		return service.ins_reply(boardReply);
	}
	
	//ajax 댓글 수정
	@ResponseBody
	@RequestMapping(value="board/replyupdate2", method = RequestMethod.POST)
	public int replyupdate2(BoardReply boardReply) throws Exception {
		return service.upd_reply(boardReply);
	}
	
	//ajax 댓글 삭제
	@ResponseBody
	@RequestMapping(value="board/replydelete2", method = RequestMethod.POST)
	public int replydelete2(BoardReply boardReply) throws Exception {
		return service.del_reply(boardReply);
	}
	
	//	로그인 폼으로 가는 매핑 board/login -> login(.jsp)
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login() {
		
		return "login";
	}
	
	//	로그아웃
	@GetMapping(value="logOut")
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//	로그인 처리하기 (DAO)  : 성공하면 redirect:/ (또는 home.jsp)
	//	                           세션부여함.
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String,Object> map,
			HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println(map);
		// 서비스 호출
		Map user = service.login(map);
		
		if(user == null) {  // 로그인 실패
			rttr.addFlashAttribute("msg", "일치하는 유저 정보가 없습니다.");
			return "redirect:login";
		}else {   // 로그인 성공
			// 세션 부여
			session.setAttribute("user", user);
			// user가 Map에 들어가서 그런지 session으로 안불러와져서 따로 1개의 값만 넣어주는것
			String u_p_id = (String)map.get("u_p_id");
			session.setAttribute("u_p_id", u_p_id);
			// 찜 개수
			int wish_cnt = Uservice.wish_cnt(u_p_id);
			session.setAttribute("wish_cnt", wish_cnt);
			System.out.println("!!!!!!!!!!!!"+(String)session.getAttribute("u_p_id"));
			//System.out.println("!!!!!!!!!!!!"+map.get("u_p_id"));
			return "redirect:/";
		}		
	}
	
}