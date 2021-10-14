package kr.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		logger.debug("<<LoginCheckIntercepter 진입>>");
		
		//로그인 여부 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_num")==null) {
			//로그인이 되지 않은 상태
			response.sendRedirect(request.getContextPath() + "/login/loginForm.do");
			return false;
		}
		
		//로그인이 된 상태
		return true;
	}
}
