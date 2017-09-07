package ytu.limpid.util;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ResponseUtil {
	public static void setResponseStr(HttpServletResponse response, String msg) throws IOException{
		response.setCharacterEncoding("utf-8");
        response.getWriter().print(msg);
        response.getWriter().close();
	}
	
	public static void setResponseJson(HttpServletResponse response, Map<String, Object> map) throws IOException{
		JSONObject jsonObj = JSONObject.fromObject(map);
		response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonObj);
        response.getWriter().close();
	}
	
	public static void setResponseList(HttpServletResponse response, List<?> resList) throws IOException{
		JSONArray listJson = JSONArray.fromObject(resList);
		response.setCharacterEncoding("utf-8");
        response.getWriter().print(listJson);
        response.getWriter().close();
	}
}
