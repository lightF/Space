package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.board;

@Controller
public class boardController {

	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		List<board> boardList = getBoardList();
		model.addAttribute("boardList", boardList);
		return "boardList";
	}
	private List<board> getBoardList() {
		// TODO Auto-generated method stub
		 // 가상의 게시글 리스트 생성 (가정)
        List<board> boardList = new ArrayList<>();
		// 실제로는 DB나 다른 방법으로 게시글 리스트를 가져와야 합니다.
		// 여기서는 가상의 데이터로 예시를 보여드립니다.
		board vo1 = new board();
		vo1.setContent("하이");
		vo1.setIdx(0);
		vo1.setIndate("dd");
		vo1.setWriter("작성자");
		vo1.setTitle("ㅇㅇ");
		
	    board vo2 = new board();
	    vo2.setContent("안녕하세요");
	    vo2.setIdx(1);
	    vo2.setIndate("2023-09-10");
	    vo2.setWriter("user123");
	    vo2.setTitle("첫 번째 글입니다.");
	    boardList.add(vo1);
	    boardList.add(vo2);
		return boardList;
	}
	@RequestMapping("/boardInsert.do") // request로 객체 바인딩
	public String boardInsert(Model model) { // model 바인딩
		return "boardList";
	}
	@GetMapping("/boardForm.do")
	public String boarForm() {
		return "boardForm"; // WEB-INF/views/boardForm.jsp -> forward
	}
}