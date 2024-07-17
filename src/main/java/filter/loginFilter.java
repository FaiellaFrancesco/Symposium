package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import check.checkLogin;

/**
 * Servlet Filter implementation class loginFilter
 */

public class loginFilter implements Filter {
       
	private List<String> excludedServlets;
	
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 	HttpServletRequest req = (HttpServletRequest) request;
	        HttpServletResponse res = (HttpServletResponse) response;
	        HttpSession sessione = req.getSession();

	        // Controllare se l'URI è nella lista delle servlet escluse
	        String uri = req.getRequestURI();
	        uri=uri.substring(11,uri.length());
	        boolean isExcluded = excludedServlets.stream().anyMatch(uri::contains);

	        if (isExcluded) {
	            // Se l'URI è nella lista, continuare senza filtrare
	            chain.doFilter(request, response);
	        } else {
	            if(checkLogin.check(sessione)) {
	            	chain.doFilter(request, response);
	            }
	            else {
	            	res.sendRedirect("/Symposium/login.jsp");
	            }
	        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		String excludedServletsParam = fConfig.getInitParameter("excludedServlets");
        excludedServlets =  Arrays.asList(excludedServletsParam.split(","));
	}

}
