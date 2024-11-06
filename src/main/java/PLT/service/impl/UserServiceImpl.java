package PLT.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import PLT.dao.UserDAO;
import PLT.service.UserService;
import PLT.vo.NotificationVO;
import PLT.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	/*참고*/
	@Resource(name = "userDAO")
	UserDAO userDAO;

	/*@Override
	public List<UserVO> getUserList(UserVO uservo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}*/

	/*회원가입 수행*/
	@Override
	@Transactional
	public String join(UserVO uservo) throws Exception {

		try {
			String s = userDAO.join(uservo);
			if (s == null) {
				userDAO.insert_total_credit(uservo);
				return "ok";
			} else {
				return "fail";
			}
		} catch (DataIntegrityViolationException ex) {
			return "duplicate_email";
		} catch (Exception e) {
			return "error";
		}
	}

	// 아이디 중복확인
	@Override
	public String duplicate_id(String username) throws Exception {
		String s = userDAO.duplicate_id(username);
		if (s == null) {
			return "fail";
		} else {
			return "ok";
		}
	}

	/*로그인 수행*/
	@Override
	public String login(UserVO uservo) throws Exception {
		UserVO uv = userDAO.login(uservo);

		if (uv == null) {
			return "fail"; // 저장된 아이디 및 비밀번호가 없다면
		} else {
			System.out.println("저장된 아이디 : " + uv.getUsername());
			System.out.println("저장된 해시비밀번호 : " + uv.getHash_pw());
			System.out.println("비교할 해시비밀번호 : " + uservo.getHash_pw());
			if (uv.getUsername().equals(uservo.getUsername()) && uv.getHash_pw().equals(uservo.getHash_pw())) {
				// 저장된 아이디 및 해시비밀번호가 존재하고, 
				// 입력된 아이디와 비밀번호가 해시비밀번호와 일치하면

				return "ok";
			} else if (uv.getPassword() == null || !uv.getPassword().equals(uservo.getPassword())) {
				return "valied_pw";
			}
		}
		return "error";
	}

	/*아이디 찾기*/
	@Override
	public String find_id(String email) throws Exception {
		return userDAO.find_id(email);
	}

	/*비밀번호 찾기*/
	@Override
	public String find_pw(UserVO uv) throws Exception {
		return userDAO.find_pw(uv);
	}

	/*해당 계정으로 가입 당시, 최초로 생성되었던 Salt 값*/
	@Override
	public String getSalt(String username) throws Exception {
		return userDAO.getSalt(username);
	}

	// 사용자 역할(학생 or 강사) 가져오기
	@Override
	public int getRole_id(String username) throws Exception {
		return userDAO.getRole_id(username);
	}

	/*todo 외래키 사용자 아이디*/
	@Override
	public int getUser_id(String username_for_user_id) throws Exception {
		int i = userDAO.getUser_id(username_for_user_id);
		String result = String.valueOf(i);
		if (result == null) {
			return 0;
		} else {
			return i;
		}
	}

	@Override
	public List<NotificationVO> getMessage(String username) throws Exception {
		return userDAO.getMessage(username);
	}

	@Override
	public int update_read(NotificationVO nvo) throws Exception {
		return userDAO.update_read(nvo);
	}

	@Override
	public String select_is_read(NotificationVO nvo) throws Exception {
		return userDAO.select_is_read(nvo);
	}

	@Override
	public int deleteMessage(int notification_id) throws Exception {
		return userDAO.deleteMessage(notification_id);
	}

	@Override
	public void insert_sub_status_student(String username) throws Exception {
		userDAO.insert_sub_status_student(username);
	}

}
