package PLT.service;

import PLT.vo.NotificationVO;

public interface NotificationService {

	String sendNotification(NotificationVO nvo) throws Exception;

}
