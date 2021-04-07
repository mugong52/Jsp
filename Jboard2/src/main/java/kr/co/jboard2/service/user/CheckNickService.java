package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.jboard2.dao.UserDao;
import kr.co.jboard2.service.CommonService;

public class CheckNickService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String nick = req.getParameter("nick");
		
		int count = 0;
		
		try {
			count = UserDao.getInstance().selectCountNick(nick);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// Json ������ ����;
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		return "json:"+json.toString();
	}

}
