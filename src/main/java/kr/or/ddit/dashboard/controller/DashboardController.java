package kr.or.ddit.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/dashboard/")
public class DashboardController {

	@RequestMapping("dashboard")
	public void dashboardView() {
	}
	
}
