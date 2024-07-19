package controller;

import org.apache.commons.text.StringEscapeUtils;

public class InputSanitizer {
    
    // Metodo per sanitizzare il testo
    public static String sanitize(String input) {
        if (input == null) {
            return null;
        }
        
        // Usa Apache Commons Text per evitare XSS
        String sanitizedInput = StringEscapeUtils.escapeHtml4(input);
        
        return sanitizedInput;
    }
}
