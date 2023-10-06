package ak.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class akController {
	@RequestMapping("/")
	public String main() {
		return "main";
	}
}
