package kr.or.ddit.globalexception;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

public class CustomExceptionResolver extends SimpleMappingExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
										 HttpServletResponse response, 
										 Object handler,
										 Exception ex) {
		// 클라이언트 서버 대상 요청시 서버 내 경량화된 쓰레드 생성(응답 전송시 GC)
		String cuurentThread = Thread.currentThread().getName();
		
		// 익셉션 발생 메서드와 해당 메서드를 포함하는 클래스명 추출
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		String exceptionOccurendClazz = handlerMethod.getBean().getClass().getName();
		String exceptionOccurendMethod = handlerMethod.getMethod().getName();
		
		//클래스 내의 익샙션 발생한 코드라인
		int lineNumber = ex.getStackTrace()[0].getLineNumber();
		String exceptionType = ex.getClass().getName();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYY/MM/DD kk:mm:ss");
		System.out.println("에러 발생 : "+ cuurentThread +
						   "| 클래스 : " + exceptionOccurendClazz +
						   "| 메서드 : " + exceptionOccurendMethod +
						   "| 라인 : " + lineNumber +
						   "|익셉션 타입 : " + exceptionType +
						   "|발생 시간 : " + dateFormat.format(new Date()));
		
		return super.resolveException(request, response, handler, ex);
	}

	
}











