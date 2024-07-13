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

@WebFilter("/utilities/*") // Applica il filtro a tutte le pagine sotto /restricted/
public class AccessFilter implements Filter {
    public void init(FilterConfig fConfig) throws ServletException {
        // Inizializzazione del filtro, se necessaria
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Verifica se la richiesta è un'inclusione o un accesso diretto
        if (req.getAttribute("javax.servlet.include.request_uri") == null) {
            // Accesso diretto, reindirizza o mostra un errore
            res.sendError(HttpServletResponse.SC_FORBIDDEN, "Accesso diretto non consentito");
        } else {
            // Inclusione, permette l'accesso
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
        // Pulizia del filtro, se necessaria
    }
}
