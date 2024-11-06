package PLT.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PLT.vo.NotificationVO;
import PLT.vo.UserVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("userDAO")
public class UserDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<UserVO> getUserList(UserVO uservo) {
		return (List<UserVO>) list("getUserList", uservo);
	}

	/*회원가입 수행*/
	public String join(UserVO uservo) throws Exception {
		/*ibatis에서 insert는 성공했을 때 nul 반환 / 실패했을 때 에러*/
		return (String) insert("join", uservo);

	}

	// 아이디 중복확인
	public String duplicate_id(String username) {
		return (String) select("duplicate_id", username);
	}

	/*로그인 수행*/
	public UserVO login(UserVO uservo) {
		return (UserVO) select("login", uservo);
	}

	/*아이디 찾기*/
	public String find_id(String email) {
		return (String) select("find_id", email);
	}

	/*비밀번호 찾기*/
	public String find_pw(UserVO uv) {
		return (String) select("find_pw", uv);
	}

	/*해당 계정으로 가입 당시, 최초로 생성되었던 Salt 값*/
	public String getSalt(String username) {
		return (String) select("getSalt", username);
	}

	// 사용자 역할(학생 or 강사) 가져오기
	public int getRole_id(String username) {
		return (int) select("getRole_id", username);
	}

	/*todo 외래키 사용자 아이디*/
	public int getUser_id(String username_for_user_id) {
		return (int) select("getUser_id", username_for_user_id);
	}

	public void insert_total_credit(UserVO uservo) {
		insert("insert_total_credit", uservo);
	}

	public List<NotificationVO> getMessage(String username) {
		return (List<NotificationVO>) list("getMessage", username);
	}

	public int update_read(NotificationVO nvo) {
		return update("update_read", nvo);
	}

	public String select_is_read(NotificationVO nvo) {
		String bl = (String) select("select_is_read", nvo);
		if (bl == null) {
			System.out.println(bl);
		}
		return bl;
	}

	public int deleteMessage(int notification_id) {
		return delete("deleteMessage", notification_id);
	}

	public void insert_sub_status_student(String username) {
		insert("insert_sub_status_student", username);
	}

}
