package ak.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ak.app.entity.회원;
import ak.app.mapper.Akmapper;

@RestController // @ResponseBody(JSON)응답
public class akMainController {
	@Autowired
	Akmapper mapper;
	
	// 글쓰기 화면만 리턴해주면된다.
		// 글쓰기 화면만 출력해주면됨
		@GetMapping("/boardForm.do")
		public String boarForm() {
			return "boardForm"; // WEB-INF/views/boardForm.jsp -> forward
		}

		@PostMapping("/boardInsert.do")
		public String boardInsert(회원 vo) { // paramerter(board) title,content, writer
			mapper.Insert(vo); // 등록
			return "redirect:/admin_ship.jsp";// redirect
		}
	
	// 회원가입 처리
		@RequestMapping("/memRegister.do")
		public String memRegister(회원 m, String 패스워드1, String 패스워드2,
				                  RedirectAttributes rttr, HttpSession session) {
			if(m.get아이디()==null || m.get아이디().equals("") ||
					패스워드1==null || 패스워드1.equals("") ||
							패스워드2==null || 패스워드2.equals("") ||
			   m.get이름()==null || m.get이름().equals("") ||	
			   m.get이메일()==null || m.get이메일().equals("")) {
			   // 누락메세지를 가지고 가기? =>객체바인딩(Model, HttpServletRequest, HttpSession)
			   rttr.addFlashAttribute("msgType", "실패 메세지");
			   rttr.addFlashAttribute("msg", "모든 내용을 입력하세요.");
			   return "redirect:/memJoin.do";  // ${msgType} , ${msg}
			}
			if(!패스워드1.equals(패스워드2)) {
			   rttr.addFlashAttribute("msgType", "실패 메세지");
			   rttr.addFlashAttribute("msg", "비밀번호가 서로 다릅니다.");
			   return "redirect:/memJoin.do";  // ${msgType} , ${msg}
			}		
			int result=mapper.register(m);
			if(result==1) { // 회원가입 성공 메세지
			   rttr.addFlashAttribute("msgType", "성공 메세지");
			   rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
			   // 회원가입이 성공하면=>로그인처리하기
			   session.setAttribute("mvo", m); // ${!empty mvo}
			   return "redirect:/";
			}else {
			   rttr.addFlashAttribute("msgType", "실패 메세지");
			   rttr.addFlashAttribute("msg", "이미 존재하는 회원입니다.");
			   return "redirect:/admin_ship.jsp";
			}		
		}

	@RequestMapping("/RegisterCheck.do")
	public @ResponseBody int 중복체크(@RequestParam("아이디") 회원 아이디) {
		회원 Id = mapper.중복체크(아이디);
		if (Id != null || 아이디.equals("")) {
			return 0; // 이미 존재하는 회원, 입력불가
		}
		return 1; // 사용가능한 아이디
	}

}
