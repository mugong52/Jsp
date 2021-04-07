package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.jboard2.dao.UserDao;
import kr.co.jboard2.service.CommonService;

public class CheckEmailService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String email = req.getParameter("email");
		
		int count = 0;
		
		try {
			count = UserDao.getInstance().selectCountEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// Json 데이터 생성;
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		return "json:"+json.toString();
	}

}
