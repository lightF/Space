package ak.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ak.app.entity.userInfo;
import ak.app.mapper.mapper;

//@RequestMapping("/biew")
//@RestController // @ResponseBody(JSON)응답
@Controller
public class akJsoncontroller {
	@Autowired
	mapper mapper;

	// @ResponseBody->jackson-databind(객체를->JSON 데이터포멧으로 변환)
	@RequestMapping("/가입.do")
	public String Join() {
		return "join.jsp"; // join.jsp
	}

	@GetMapping("/all")
	public List<userInfo> AkList() {
		System.out.println("!!!!!!!!!!!!!!");
		System.out.println("userInfo");
		List<userInfo> list = mapper.selectMemberList();
		System.out.println("list");
		System.out.println(list);
		return list; // JSON 데이터 형식으로 변환(API)해서 리턴(응답)하겠다.
	}

	// 회원등록
	@PostMapping("/new")
	public String Registers(userInfo userInfo) {
		System.out.println("!!!!!!!!!!!!!!");
		System.out.println("userInfo");
		System.out.println(userInfo);
		mapper.insertMember(userInfo); // 등록성공
		// System.out.println(vo.getIdx());
		System.out.println("등록 성공!!!");
		return "index.jsp";
	}

	@RequestMapping("/Registercheck.do")
	public @ResponseBody int RegisterCheckm(@RequestParam("Id") String Id) {
		userInfo u = mapper.registerCheck(Id);
		if (u != null || Id.equals("")) {
			return 0; // 이미 존재하는 회원, 입력불가
		}
		return 1; // 사용가능한 아이디
	}

	@RequestMapping("/Register.do")
	public String Register(userInfo u, String password1, String password2, RedirectAttributes rttr,HttpSession session) {
		if (u.getId() == null || u.getId().equals("") || password1 == null || password2.equals("") || password2 == null
				|| password2.equals("") || u.getName() == null || u.getName().equals("") || u.getEmail() == null
				|| u.getEmail().equals("")) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "모든 내용을 입력하세요.");
			return "admin_ship";
		}
		if (!password1.equals(password2)) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "비밀번호가 서로 다릅니다.");
			return "admin_ship";
		}
		int result = mapper.register(u);

		if (result == 1) { // 회원가입 성공 메세지
			// 추가: 권한테이블에 회원의 권한을 저장하기
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");

			return "redirect:/Login.do";
		} else {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "이미 존재하는 회원입니다.");
			return "redirect:/admin_ship";
		}
	}

	// 로그인 기능 구현
	@RequestMapping("/Login.do")
	public String memLogin(userInfo u, RedirectAttributes rttr, HttpSession session) {
		if (u.getId() == null || u.getId().equals("") || u.getPassword() == null || u.getPassword().equals("")) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "모든 내용을 입력해주세요.");
			return "config_main";
		}
		userInfo us = mapper.Login(u);
		if (us != null) { // 로그인에 성공
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "로그인에 성공했습니다.");
			session.setAttribute("us", us); // ${!empty mvo}
			return "admin_main"; // 메인
		} else { // 로그인에 실패
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "다시 로그인 해주세요.");
			return "admin_main";
		}
	}
	//검색 기능 출력
	//@RequestMapping(value="/Search.do", method=RequestMethod.POST)
	//@ResponseBody
	//public List<userInfo> searchUsers(@RequestParam String type, @RequestParam String text) {
	   // 검색 로직 수행 및 결과 데이터 반환
	 //  List<userInfo> userList = userService.searchUsers(type, text); 

	 //  return userList;
//	}
	}
