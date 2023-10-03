package batis;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class webpage2 {
	private filevo fv; 
	@Resource(name="filem")
	
	private filemodule fm;
	//modile을 가져와서 써야함
	
	//database 값이 변경되면 안되개때문에
	@RequestMapping("/fileview.do")
	public String fview(Model model) {
		List<filevo> list = fm.select();
		System.out.println(list.toString());
		model.addAttribute("data", fv);
		return null;
	}
}
