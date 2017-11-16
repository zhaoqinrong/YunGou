package bdqn.filter;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



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
		Object username = req.getSession().getAttribute("username");
	StringBuffer requestURL = req.getRequestURL();
	//如果是会员权利,需要跳转到login.jsp,要求用户登录
		if(requestURL.indexOf("my")>-1||requestURL.indexOf("back")>-1){
			if (username!=null&&!"".equals(username)) {
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
