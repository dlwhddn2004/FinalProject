package kr.or.ddit.utiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class IPCheckInterceptor extends HandlerInterceptorAdapter {

	private static Map<String, String> ipMap;

	static{
		ipMap = new HashMap<String, String>();
		ipMap.put("127.0.0.1", "A");
		ipMap.put("0:0:0:0:0:0:0:1", "A");
		ipMap.put("192.168.206.8", "A");
		ipMap.put("192.168.206.56", "F");
	}
	
	
	

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String clientIP = request.getRemoteAddr();
		
		boolean flag = true;
		// intern() -> 모든 문자열이 동일한 메모리를 공유   // IP주소를 얻어냈다면 If절 수행
		if (StringUtils.isNotEmpty(clientIP) && ipMap.containsKey(clientIP)) {
			if ("A".intern() == ipMap.get(clientIP).intern()) {
			} else {
				flag = false;
			}
		} else {
			flag = false;
		}
		if (!flag) {
			//HttpServletResponse response = (HttpServletResponse) servletResponse;
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<body>");
			out.println("<font color='red'>졸리다</font>");
			out.println("</body>");
			out.println("</html>");
	}
		return flag;	
	}

}
