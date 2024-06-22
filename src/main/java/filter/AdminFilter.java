package filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inizializzazione del filtro se necessario
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        try {
                Object userId = session.getAttribute("id");
                Object userRole = session.getAttribute("admin");

                if (userId != null && userRole != null) {
                	boolean ruolo = (boolean)userRole;
                	if(ruolo == true) {
                    // Se è amministratore, continua con la richiesta
                		chain.doFilter(request, response);
                    	return;
                    	}
                }

            // Se non è amministratore o non è loggato, reindirizza alla pagina di login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/errore.jsp");
        } catch (Exception e) {
            throw new ServletException("Errore nel filtro AdminFilter", e);
        }
    }
    @Override
    public void destroy() {
        // Pulizia del filtro se necessario
    }
}

