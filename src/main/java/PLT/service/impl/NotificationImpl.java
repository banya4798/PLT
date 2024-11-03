package PLT.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import PLT.dao.CourseDAO;
import PLT.service.NotificationService;
import PLT.vo.NotificationVO;

@Service
public class NotificationImpl implements NotificationService {

	@Resource(name = "courseDAO")
	private CourseDAO courseDAO;

	@Override
	public String sendNotification(NotificationVO nvo) throws Exception {
		return courseDAO.sendNotification(nvo);
	}

}
