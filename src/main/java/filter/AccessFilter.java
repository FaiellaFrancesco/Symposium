package filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/restricted/*") // Applica il filtro a tutte le risorse sotto /restricted/
public class AccessFilter implements Filter {
    public void init(FilterConfig fConfig) throws ServletException {
        // Inizializzazione del filtro, se necessaria
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Ottieni il percorso della risorsa richiesta
        String path = req.getRequestURI().substring(req.getContextPath().length());

        // Controlla se la richiesta è per una risorsa statica
        boolean isStaticResource = path.startsWith("/utilities/css/") || path.startsWith("/utilities/js/");

        if (!isStaticResource) {
            // Verifica se la richiesta è un'inclusione JSP o una richiesta AJAX
            boolean isIncludeRequest = req.getAttribute("javax.servlet.include.request_uri") != null;
            boolean isAjaxRequest = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));

            if (!isIncludeRequest && !isAjaxRequest) {
                // Accesso diretto, reindirizza o mostra un errore
                res.sendError(HttpServletResponse.SC_FORBIDDEN, "Accesso diretto non consentito");
                return;
            }
        }

        // Permette l'accesso per inclusioni JSP, richieste AJAX e risorse statiche
        chain.doFilter(request, response);
    }

    public void destroy() {
        // Pulizia del filtro, se necessaria
    }
}