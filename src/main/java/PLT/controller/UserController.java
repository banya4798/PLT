package PLT.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import PLT.MailSendService;
import PLT.SHA256;
import PLT.service.UserService;
import PLT.vo.NotificationVO;
import PLT.vo.UserVO;

@Controller
@RequestMapping(value = "/PLT")
public class UserController {
	/************************참고************************/
	private static Logger log = LoggerFactory.getLogger(UserController.class);

	@Resource(name = "userService")
	private UserService userService;

	@Autowired
	private MailSendService mailService;

	@Autowired
	private SHA256 sha256;

	/****************************************************/

	/****************************************************/
	/*홈페이지 화면*/
	@RequestMapping(value = "/plt_homepage.do")
	public String plt_homepage() throws Exception {
		int i = 5;
		log.debug("로그기능 쳌" + i);
		return "views/homepage";
	}

	/****************************************************/

	/****************************************************/
	/*로그인 실행*/
	@RequestMapping(value = "/login.do")
	@ResponseBody
	public String Login(UserVO uservo, HttpServletRequest request, @RequestParam(value = "username", required = false) String username, @RequestParam(value = "password", required = false) String password) throws Exception {
		log.debug("입력한 아이디 : " + username);
		log.debug("입력한 비밀번호 : " + password);

		// 만약, 입력한 아이디와 비밀번호가 null이라면(입력하지 않았다면)
		if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
			return "valied_Id_Pw";
		} else {
			// 해당 계정으로 가입 시, 최초로 생성되었던 Salt값 DB에서 가져오기
			String salt = userService.getSalt(username);
			log.debug("가져온 최초의 Salt값 : " + salt);

			String hash_pw = sha256.getEncrypt(password, salt);
			log.debug("SHA256 적용 PW : " + hash_pw);

			uservo.setUsername(username);
			uservo.setHash_pw(hash_pw);

			String result = userService.login(uservo);
			if ("ok".equals(result)) {
				// 사용자 역할(학생 or 강사) 가져오기
				int role_id = userService.getRole_id(uservo.getUsername());
				log.debug("가져온 사용자 역할(1은 학생 or 2는 강사) : " + role_id);
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("role_id", role_id);
				session.setMaxInactiveInterval(60 * 60); // 일반 사용자 세션 타임아웃: 10분 -> 빡쳐서 1시간으로 늘렸음
				log.debug("세션에 저장한 사용자계정 아이디 : " + session.getAttribute("username"));
				log.debug("세션에 저장한 사용자 역할 : " + session.getAttribute("role_id"));

				//만약, 관리자까지 추가한다면 관리자와 다른 사용자들은 세션 시간을 다르게 설정해야할 듯.
				/*if (isAdmin(username)) {
				    session.setMaxInactiveInterval(60 * 60); // 관리자 세션 타임아웃: 1시간
				} else {
				    session.setMaxInactiveInterval(30 * 60); // 일반 사용자 세션 타임아웃: 30분
				}*/

				return "ok"; //아이디와 비밀번호 일치.
			} else if ("valied_pw".equals(result)) {
				return "valied_pw"; // 비밀번호 불일치.
			} else if ("fail".equals(result)) {
				return "fail"; // 로그인 실패.
			} else {
				return "error";
			}
		}
	}

	/****************************************************/

	/****************************************************/
	/*로그아웃*/
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/PLT/plt_homepage.do";
	}

	/****************************************************/

	/****************************************************/
	/*아이디 중복 확인*/
	@RequestMapping(value = "duplicate_id.do")
	@ResponseBody
	public String duplication_id(@RequestParam("username") String username) throws Exception {
		log.debug("중복확인 요청이 들어온 아이디 : " + username);

		String result = userService.duplicate_id(username);
		log.debug("결과는 ?? :  " + result);
		if (result.equals("ok") && result != null) {
			log.debug("결과는 '중복된 아이디입니다.'");
			return "ok";
		} else {
			log.debug("결과는 '사용가능한 아이디입니다.'");
			return "fail";
		}
	}

	/****************************************************/

	/****************************************************/

	/*회원가입 실행*/
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	@ResponseBody
	public String join(UserVO uservo, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("confirmPassword") String confirmPassword, @RequestParam("email") String email, @RequestParam("role_name") String role_name, @RequestParam("verificationCode") String verificationCode) throws Exception {

		log.debug("사용자 정보들 : " + username + "\n" + password + "\n" + confirmPassword + "\n" + email + "\n" + role_name + "\n" + verificationCode);

		if (role_name.equals("student") && !role_name.equals(null)) {
			uservo.setRole_id(1);
		} else if (role_name.equals("instructor") && !role_name.equals(null)) {
			uservo.setRole_id(2);
		}

		// 입력된 비밀번호에 Salt 추가후, SHA256 알고리즘 적용
		String salt = sha256.getSalt();

		String sha256_hash_pw = sha256.getEncrypt(password, salt);

		uservo.setUsername(username);
		uservo.setPassword(password);
		uservo.setHash_pw(sha256_hash_pw);
		uservo.setSalt(salt);
		uservo.setEmail(email);

		log.debug("최초의 Salt값 : " + salt);
		log.debug("SHA256 적용 전 비밀번호 : " + password);
		log.debug("Salt값 추가 및 SHA256 적용 후 비밀번호 : " + sha256_hash_pw);

		String result = userService.join(uservo);
		log.debug(result);

		if (result.equals("ok")) {
			return "ok";
		} else if (result.equals("duplicate_email")) {
			return "duplicate_email";
		} else if (result.equals("error")) {
			return "error";
		} else {
			return "fail";
		}
	}

	/****************************************************/

	/****************************************************/
	/*회원가입 및 로그인 및 비밀번호 초기화 화면*/
	@RequestMapping(value = "/LoginJoin.do")
	public String Join() throws Exception {

		return "views/user/LoginJoin";
	}

	/****************************************************/

	/****************************************************/

	/* 회원가입 시, 이메일 인증번호 발송*/
	@RequestMapping(value = "/join_email_certification.do")
	@ResponseBody
	public Map<String, String> join_email_certification(@RequestParam("email") String email) throws Exception {
		Map<String, String> response = new HashMap<>();

		// null체크를 위한 조건문
		if (email == null || !isValidEmail(email)) {
			// 아이디 혹은 이메일 불일치
			log.debug("이메일이 불일치 합니다.");
			response.put("status", "invalid");
		} else {
			// 아이디 및 이메일의 동일한 사용자 확인 후, 인증코드 발송
			log.debug("이메일");

			//인증번호 발송 메소드
			String certification_Code = mailService.certificationCode(email);
			//인증번호 발송 성공 시
			if (certification_Code != null && !certification_Code.isEmpty()) {
				response.put("certification_Code", certification_Code);
				response.put("status", "ok");
			} else {
				// 인증번호 발송 실패
				response.put("status", "fail");
			}
		}
		return response;
	}

	/*이메일 규정*/
	public boolean isValidEmail(String email) {
		String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
		return email.matches(emailRegex);
	}

	/****************************************************/

	/****************************************************/
	/*아이디 찾기*/
	@RequestMapping(value = "find_id.do")
	@ResponseBody
	public Map<String, String> find_id(@RequestParam(value = "email", required = false) String email) throws Exception {
		log.debug("아이디 찾기위해 입력한 이메일 : " + email);
		Map<String, String> response = new HashMap<>();
		if (email == null || email.isEmpty()) {
			response.put("status", "email_invalid");
			return response;
		} else {
			String result = userService.find_id(email);
			if (result == null || result.isEmpty()) {
				log.debug("찾은 아이디 : " + result);
				response.put("status", "fail"); // 아이디 찾기 실패
			} else {
				log.debug("찾은 아이디 : " + result);
				response.put("status", "ok"); // 아이디 찾기 성공
				response.put("username", result);
			}
			return response;
		}

	}

	/****************************************************/
	/****************************************************/

	/*비밀번호 찾기*/
	@RequestMapping(value = "find_pw.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> find_pw(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "email", required = false) String email) throws Exception {
		log.debug("비밀번호 찾기 위해 입력받은 아이디 : " + username);
		log.debug("비밀번호 찾기 위해 입력받은 이메일 : " + email);

		Map<String, String> response = new HashMap<>();

		if (username == null || username.isEmpty() || email == null || email.isEmpty()) {
			response.put("status", "invalid_id_email");
			return response;
		} else {
			UserVO uv = new UserVO();
			uv.setUsername(username);
			uv.setEmail(email);
			String result = userService.find_pw(uv);
			if (result == null) {
				response.put("status", "fail"); // 비밀번호 찾기 실패
			} else {
				response.put("password", result);
				response.put("status", "ok"); // 비밀번호 찾기 성공
			}
			return response;

		}

	}

	/*알람메시지 표시*/
	@RequestMapping(value = "/getMessage.do")
	@ResponseBody
	public Map<String, Object> getMessage(Model model, @RequestParam(value = "username") String username) throws Exception {
		Map<String, Object> response = new HashMap<>();
		List<NotificationVO> getMessage = userService.getMessage(username);
		try {
			if (getMessage == null || getMessage.isEmpty()) {
				response.put("status", "noM");
				response.put("message", "NotMesseage");
				return response;
			} else {
				response.put("status", "ok");
				response.put("data", getMessage);
			}
		} catch (DataAccessException e) {
			// sql 예외 처리
			response.put("status", "sqlError");
			response.put("message", "Database error: " + e.getMessage());
		}
		return response;
	}

	/*알람 메시지 읽음 표시*/
	@RequestMapping(value = "/is_read.do")
	@ResponseBody
	public Map<String, Object> is_read(HttpServletRequest request, NotificationVO nvo, @RequestParam(value = "notification_id") int notification_id) throws Exception {

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		Map<String, Object> response = new HashMap<>();

		System.out.println(notification_id);
		System.out.println(username);

		nvo.setNotification_id(notification_id);
		nvo.setUsername(username);
		int update_read = userService.update_read(nvo);
		System.out.println("콰악씨 : " + update_read);
		if (update_read == 1) {
			String is_read = userService.select_is_read(nvo);
			System.out.println("귀야양 : " + is_read);
			if ("t".equals(is_read)) {
				response.put("status", "get_read_t");
				response.put("TF", is_read);
			} else if ("f".equals(is_read)) {
				response.put("status", "get_read_f");
				response.put("TF", is_read);
			}
		} else {
			response.put("status", "update_fail");
		}
		return response;
	}

	@RequestMapping(value = "/deleteMessage.do")
	@ResponseBody
	public String deleteMessage(@RequestParam(value = "notification_id") int notification_id) throws Exception {
		int result = userService.deleteMessage(notification_id);
		if (result == 1) {
			return "ok";
		} else {
			return "fail";
		}
	}

}
