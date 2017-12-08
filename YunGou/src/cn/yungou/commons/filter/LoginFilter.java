package cn.yungou.commons.filter;

import cn.yungou.commons.entity.EasybuyUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



public class LoginFilter implements Filter{
	 


	

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		EasybuyUser user = (EasybuyUser) req.getSession().getAttribute("user");
	    StringBuffer requestURL = req.getRequestURL();
	//如果是会员权利,需要跳转到login.jsp,要求用户登录
		if(requestURL.indexOf("my")>-1||requestURL.indexOf("admin")>-1){
			if (user!=null&&user.getLoginName()!=null&&!"".equals(user.getLoginName())) {
				chain.doFilter(request, response);
			}else{

				resp.sendRedirect(req.getContextPath()+"/user?action=loginUI");
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
