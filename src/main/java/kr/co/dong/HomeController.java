package kr.co.dong;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.board.BoardService;
import kr.co.dong.board.ProductDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		List<ProductDTO> main = service.main();
	    model.addAttribute("main", main);

		
		return "main";
	}
	
	@RequestMapping(value= "/main", method= RequestMethod.GET)
	public ModelAndView main() throws Exception {
		//정보를 전송하는 model과 view 페이지를 설정하는 클래스
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> main = service.main();
		mav.addObject("main", main);
		mav.setViewName("main");		//view
		return mav;
		
	}
	
}
