package kr.or.ddit.projectsearch;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/projectsearch/")
public class projectsearchcontroller {

	@Autowired
	private ObjectMapper Mapper;
	
	 @RequestMapping("projectsearch")
	  public void projectsearch(){}
}
