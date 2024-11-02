package PLT.service;

import PLT.vo.UserVO;

public interface UserService {

	/*DB테스트용 사용자 리스트*/
	/*	public List<UserVO> getUserList(UserVO uservo) throws Exception;
	*/

	/*회원가입 수행*/
	public String join(UserVO uservo) throws Exception;

	//아이디 중복확인
	public String duplicate_id(String username) throws Exception;

	/*로그인 수행*/
	public String login(UserVO uservo) throws Exception;

	/*아이디 찾기*/
	public String find_id(String email) throws Exception;

	/*비밀번호 찾기*/
	public String find_pw(UserVO uv) throws Exception;

	/*해당 계정으로 가입 당시, 최초로 생성되었던 Salt 값*/
	public String getSalt(String username) throws Exception;

	/*사용자 역할(학생 or 강사) 가져오기*/
	public int getRole_id(String username) throws Exception;

	/*todo 외래키 사용자 아이디*/
	public int getUser_id(String username_for_user_id) throws Exception;

}
