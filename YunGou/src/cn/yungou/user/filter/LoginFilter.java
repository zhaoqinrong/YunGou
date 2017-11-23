package cn.yungou.user.filter;

import cn.yungou.commons.entity.EasybuyUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;



public class LoginFilter implements Filter{
	 
	Pattern compile;

	

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		EasybuyUser user = (EasybuyUser) req.getSession().getAttribute("user");
	String requestURI = req.getRequestURI();
	//如果是会员权利,需要跳转到login.jsp,要求用户登录
		if(requestURI.indexOf("my")>-1||requestURI.indexOf("back")>-1){
			if (user!=null&&user.getLoginName()!=null&&!"".equals(user.getLoginName())) {
				chain.doFilter(request, response);
			}else{

				resp.sendRedirect(req.getContextPath()+"/login.jsp");
			}
			
			
			//公共页面,不需要验证,直接放行
		}else{
			chain.doFilter(request, response);
			//用户登录
			
		}
		
	}
	
	@Override
	public void destroy() {
		
	}

}
