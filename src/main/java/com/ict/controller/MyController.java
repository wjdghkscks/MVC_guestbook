package com.ict.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.DAO;
import com.ict.db.VO;

@Controller
public class MyController {

// @Autowired (by Spring) 와 @Inject (by Java) 는 같은 역할(DI) 을 함
	@Inject
	private DAO dao;

	public void setDao(DAO dao) {
		this.dao = dao;
	}

	// list
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public ModelAndView getList() {

		ModelAndView mv = new ModelAndView("list");

		List<VO> list = dao.getList();
		mv.addObject("list", list);

		return mv;
	}

	// write 이동
	@RequestMapping(value = "write.do")
	public ModelAndView writeCommand() {
		return new ModelAndView("write");
	}

	// write_ok GET 오류 처리
	@RequestMapping(value = "write_ok.do", method = RequestMethod.GET)
	public ModelAndView writeNoOkCommand() {
		return new ModelAndView("write");
	}

	// write_ok 실행
	@RequestMapping(value = "write_ok.do", method = RequestMethod.POST)
	public ModelAndView writeOkCommand(VO vo) {

		int result = dao.getInsert(vo);

		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.setViewName("redirect:list.do");
		} else {
			mv.setViewName("redirect:write.do");
		}

		return mv;
	}

	// onelist 이동
	@RequestMapping(value = "onelist.do")
	public ModelAndView oneListCommand(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("onelist");

		String idx = request.getParameter("idx");
		VO vo = dao.getOneList(idx);

		// session 저장
		request.getSession().setAttribute("vo", vo);

		return mv;
	}

	// update 이동
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public ModelAndView updateCommand() {
		return new ModelAndView("update");
	}

	// update_ok GET 오류 처리
	@RequestMapping(value = "update_ok.do", method = RequestMethod.GET)
	public ModelAndView updateNoOkCommand() {
		return new ModelAndView("update");
	}

	// update 실행
	@RequestMapping(value = "update_ok.do", method = RequestMethod.POST)
	public ModelAndView updateOkCommand(VO vo) {

		int result = dao.getUpdate(vo);

		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.setViewName("redirect:onelist.do?idx="+vo.getIdx());
		} else {
			mv.setViewName("redirect:update.do");
		}

		return mv;
	}

	// delete 이동
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public ModelAndView deleteCommand() {
		return new ModelAndView("delete");
	}

	// delete_ok GET 오류 처리
	@RequestMapping(value = "delete_ok.do", method = RequestMethod.GET)
	public ModelAndView deleteNoOkCommand() {
		return new ModelAndView("delete");
	}

	// delete 실행
	@RequestMapping(value = "delete_ok.do", method = RequestMethod.POST)
	public ModelAndView deleteOkCommand(HttpServletRequest request) {
		
		VO vo = (VO)request.getSession().getAttribute("vo");
		
		int result = dao.getDelete(vo.getIdx());
		
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.setViewName("redirect:list.do");
		} else {
			mv.setViewName("redirect:onelist.do?idx=" + vo.getIdx());
		}
		
		return mv;
	}
	
}
