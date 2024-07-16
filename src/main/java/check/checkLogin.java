package check;

import javax.servlet.http.HttpSession;

public class checkLogin {
	public static boolean check(HttpSession sessione) {
		return sessione.getAttribute("id")==null ? false : true;
	}
}
