package springboard.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;

@Service
public class DeleteActionExecute implements IBoardService{

	@Autowired
	JDBCTemplateDAO dao;
	
	@Override
	public void execute(Model model) {
		//모든 요청을 한꺼번에 받아온다.
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = 
				(HttpServletRequest)paramMap.get("req");
		
		//일련번호와 패스워드를 파라미터로 받아온다.
		String idx = req.getParameter("idx");
		String pass = req.getParameter("pass");
		
		//DAO의 delete() 메서드를 호출한다.
		//JDBCTemplateDAO dao = new JDBCTemplateDAO();
	
		//답변글이 있는지 확인한다.
		boolean isDelete = dao.deleteConfirm(idx);
		if(isDelete==true)
			//답변글이 없다면 즉시 삭제한다.
			dao.delete(idx, pass);
		else {
			//답변글이 있다면 삭제하지 않는다.
			System.out.println("삭제할 수 없습니다.");
		}
	}
}
