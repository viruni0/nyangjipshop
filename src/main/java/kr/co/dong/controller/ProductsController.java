package kr.co.dong.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.board.BasketDTO;
import kr.co.dong.board.BoardDTO;
import kr.co.dong.board.BoardReply;
import kr.co.dong.board.BoardService;
import kr.co.dong.board.InquiryDTO;
import kr.co.dong.board.ProductDTO;
import kr.co.dong.board.ReviewDTO;
import kr.co.dong.board.UserService;
import kr.co.dong.board.WishDTO;

@Controller
public class ProductsController {
	private static final Logger logger = LoggerFactory.getLogger(ProductsController.class);

	@Autowired
	BoardService service;
	@Autowired
	UserService Uservice;

	// 상품 전체 리스트(ALL)
	@RequestMapping(value = "board_product/shop_list", method = RequestMethod.GET)
	public ModelAndView shop_list() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> shop_list = service.shop_list();
		mav.addObject("shop_list", shop_list);
		mav.setViewName("shop_list");
		return mav;
	}

	// 상품 전체 리스트(F)
	@RequestMapping(value = "board_product/shop_list_F", method = RequestMethod.GET)
	public ModelAndView shop_list_F() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<ProductDTO> shop_list_F = service.shop_list_F();
		mav.addObject("shop_list_F", shop_list_F);
		mav.setViewName("shop_list_F");

		return mav;
	}

	// 상품 전체 리스트(B)
	@RequestMapping(value = "board_product/shop_list_B", method = RequestMethod.GET)
	public ModelAndView shop_list_B() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<ProductDTO> shop_list_B = service.shop_list_B();
		mav.addObject("shop_list_B", shop_list_B);
		mav.setViewName("shop_list_B");

		return mav;
	}

	// 상품 전체 리스트(H)
	@RequestMapping(value = "board_product/shop_list_H", method = RequestMethod.GET)
	public ModelAndView shop_list_H() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<ProductDTO> shop_list_H = service.shop_list_H();
		mav.addObject("shop_list_H", shop_list_H);
		mav.setViewName("shop_list_H");

		return mav;
	}

	// 상품 전체 리스트(J)
	@RequestMapping(value = "board_product/shop_list_J", method = RequestMethod.GET)
	public ModelAndView shop_list_J() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<ProductDTO> shop_list_J = service.shop_list_J();
		mav.addObject("shop_list_J", shop_list_J);
		mav.setViewName("shop_list_J");

		return mav;
	}

	// 상품 상세 조회
	@RequestMapping(value = "board_product/shop_detail", method = RequestMethod.GET)
	public ModelAndView shop_detail(@RequestParam("b_p_code") String b_p_code, WishDTO WishDTO, String u_p_id,
			HttpSession session, BasketDTO BasketDTO) throws Exception {

		ModelAndView mav = new ModelAndView();
		ProductDTO product = service.shop_detail(b_p_code);
		mav.addObject("product", product);

		// 상품 후기 조회
		List<ReviewDTO> shop_review = service.shop_review(b_p_code);
		mav.addObject("shop_review", shop_review);
		int shop_review_cnt = service.shop_review_cnt(b_p_code);
		mav.addObject("shop_review_cnt", shop_review_cnt);

		// 상품 문의 조회
		List<InquiryDTO> shop_inquiry = service.shop_inquiry(b_p_code);
		mav.addObject("shop_inquiry", shop_inquiry);
		int shop_inquiry_cnt = service.shop_inquiry_cnt(b_p_code);
		mav.addObject("shop_inquiry_cnt", shop_inquiry_cnt);
		
		// 찜기능
		u_p_id = (String) session.getAttribute("u_p_id");
		WishDTO.setU_p_id(u_p_id);
		WishDTO wish = Uservice.wish(WishDTO);
		mav.addObject("wish", wish);
		
		// 장바구니 담겨있는지 조회
		BasketDTO.setU_p_id(u_p_id);
		BasketDTO detail_basket = Uservice.detail_basket(BasketDTO);
		mav.addObject("basket", detail_basket);
		
		mav.setViewName("shop_detail");

		return mav;
	}

	// 상품 후기 폼
	@RequestMapping(value = "shop_detail_review/review", method = RequestMethod.GET)
	public String shop_detail_review() throws Exception {
		return "shop_detail_review";
	}
	
	// 상품 후기 저장
	@RequestMapping(value = "shop_detail_review/review", method = RequestMethod.POST)
	public String shop_detail_review(ReviewDTO reviewDTO, HttpServletRequest request) throws Exception {
		System.out.println("!!!!shop_detail_review");

		request.setCharacterEncoding("utf-8");
		int r = service.shop_detail_review(reviewDTO);

		return "my_outclose";
	}
	
	// 상품 문의 폼
	@RequestMapping(value = "shop_detail_inquiry/inquiry", method = RequestMethod.GET)
	public String shop_detail_inquiry() throws Exception {
		return "shop_detail_inquiry";
	}
	
	// 상품 문의 저장
	@RequestMapping(value = "shop_detail_inquiry/inquiry", method = RequestMethod.POST)
	public String shop_detail_inquiry(InquiryDTO inquiryDTO, HttpServletRequest request) throws Exception {
		System.out.println("!!!!shop_detail_inquiry");

		request.setCharacterEncoding("utf-8");
		int r = service.shop_detail_inquiry(inquiryDTO);

		return "my_outclose";
	}
	
	// 상품 검색
	@RequestMapping(value = "nyangjipshop/search", method = RequestMethod.GET)
	public ModelAndView search(String keyWord, RedirectAttributes rttr) throws Exception {

		ModelAndView mav = new ModelAndView();
		List<ProductDTO> search = service.search(keyWord);
	
		System.out.println("!!!!!!!!!!"+search.size());
		
		if(search.size() == 0) {
			mav.addObject("search", "E");
		} else {
			mav.addObject("search", search);
		}
		mav.setViewName("search");

		return mav;
	}

	// ajax 찜 조회
	@ResponseBody
	@RequestMapping(value = "shop_detail/wish_check", method = RequestMethod.POST)
	public WishDTO wish_check(WishDTO WishDTO) throws Exception {
		return Uservice.wish(WishDTO);
	}

	// ajax 찜 추가
	@ResponseBody
	@RequestMapping(value = "shop_detail/wish_like", method = RequestMethod.POST)
	public int wish_like(WishDTO WishDTO) throws Exception {
		return Uservice.wish_like(WishDTO);
	}

	// ajax 찜 삭제
	@ResponseBody
	@RequestMapping(value = "shop_detail/wish_un", method = RequestMethod.POST)
	public int wish_un(WishDTO WishDTO) throws Exception {
		return Uservice.wish_un(WishDTO);
	}
	
	// ajax 디테일서 장바구니 재조회
	@ResponseBody
	@RequestMapping(value = "basket/detailsel_basket", method = RequestMethod.POST)
	public BasketDTO detailsel_basket(BasketDTO BasketDTO) throws Exception {
		return Uservice.detail_basket(BasketDTO);
	}
	
	// ajax 디테일서 장바구니 담기 
	@ResponseBody
	@RequestMapping(value = "basket/ins_basket", method = RequestMethod.POST)
	public int ins_basket(BasketDTO BasketDTO) throws Exception {
		return Uservice.ins_basket(BasketDTO);
	}

}