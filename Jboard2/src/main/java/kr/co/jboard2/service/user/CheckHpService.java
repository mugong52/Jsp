package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.jboard2.dao.UserDao;
import kr.co.jboard2.service.CommonService;

public class CheckHpService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String hp = req.getParameter("hp");
		
		int count = 0;
		
		try {
			count = UserDao.getInstance().selectCountHp(hp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// Json ������ ����;
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		return "json:"+json.toString();
	}

}
