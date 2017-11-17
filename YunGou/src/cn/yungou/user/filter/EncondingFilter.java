package cn.yungou.user.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncondingFilter implements Filter {
    private String encoding=null;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding="UTF-8";
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest httpServletRequest= (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse=(HttpServletResponse) servletResponse;
        httpServletRequest.setCharacterEncoding("UTF-8");
        if(this.encoding==null||"".equals(this.encoding)){
            httpServletRequest.setCharacterEncoding("UTF-8");
            httpServletResponse.setCharacterEncoding("UTF-8");
        }else{
            httpServletRequest.setCharacterEncoding(this.encoding);
            httpServletResponse.setCharacterEncoding(this.encoding);
        }
        filterChain.doFilter(httpServletRequest,httpServletResponse);

    }

    @Override
    public void destroy() {

    }
}
