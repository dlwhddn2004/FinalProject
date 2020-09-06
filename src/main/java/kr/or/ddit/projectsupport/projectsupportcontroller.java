package kr.or.ddit.projectsupport;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/projectsupport/")
public class projectsupportcontroller {

	@Autowired
	private ObjectMapper Mapper;
	
	
	@RequestMapping("projectsupport")
	public void projectsupport() {}
}
