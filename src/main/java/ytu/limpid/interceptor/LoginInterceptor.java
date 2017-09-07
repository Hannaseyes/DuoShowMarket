package ytu.limpid.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * ��¼�����������ڵ�¼У��
 */
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {	
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
        //��ȡSession  
        HttpSession session = request.getSession();  
        Object users = session.getAttribute("users");  
        // �ж��Ƿ�����û�
        if(users != null){  
            return true;  
        }  
        //�����������ģ���ת����¼����  
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response); 
        return false;  
	}

}
