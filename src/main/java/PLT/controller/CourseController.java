package PLT.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import PLT.service.CourseService;
import PLT.service.EnrollmentService;
import PLT.service.UserService;
import PLT.vo.CourseVO;
import PLT.vo.Enrollment_registrationVO;

@Controller
@RequestMapping(value = "/PLT")
public class CourseController {

	/************************참고************************/
	private static Logger log = LoggerFactory.getLogger(UserController.class);

	@Resource(name = "courseService")
	private CourseService courseService;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "enrollmentService")
	private EnrollmentService enrollmentService;

	/****************************************************/

	/*코스 추가하기*/
	@RequestMapping("/course_add.do")
	@ResponseBody
	public String course_add(CourseVO courseVO, @RequestParam(value = "title") String title, @RequestParam(value = "description") String description, @RequestParam(value = "username") String username) throws Exception {

		log.debug("코스 제목 : " + title);
		log.debug("코스 설명 : " + description);
		log.debug("사용자 유형 아이디 - 강사전용 : " + username);

		courseVO.setTitle(title);
		courseVO.setDescription(description);
		courseVO.setUsername(username);

		String result = courseService.course_add(courseVO);
		log.debug("코스 추가 결과 : " + result);
		if ("ok".equals(result)) {
			return "ok";
		} else {
			return "fail";
		}
	}

	/*강사전용 - 강의 등록페이지*/
	@RequestMapping(value = "/enrollment_registerPage.do")
	public String enrollment_register(CourseVO cv, HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		int user_id = userService.getUser_id(username);

		List<CourseVO> courseVO = courseService.getCourseList(user_id);

		/*List<Enrollment_registrationVO> erVO = courseService.getErList(user_id);*/

		/*코스의 학사정보 가져오기*/
		/*학기*/
		List<CourseVO> getCourse_common_semester = courseService.getCourse_common_semester();
		log.debug("학기 : " + getCourse_common_semester);

		/*학점*/
		List<CourseVO> getCourse_common_credit = courseService.getCourse_common_credit();
		log.debug("학점 : " + getCourse_common_credit);

		/*전공*/
		/*List<CourseVO> getCourse_common_classification = courseService.getCourse_common_classification(department);
		log.debug("전공 : " + getCourse_common_classification);*/

		/*학과(부)*/
		List<CourseVO> getCourse_common_department = courseService.getCourse_common_department();
		log.debug("학번 : " + getCourse_common_department);

		model.addAttribute("course_list", courseVO);
		/*model.addAttribute("erList", erVO);*/
		model.addAttribute("getCourse_common_semester", getCourse_common_semester);
		model.addAttribute("getCourse_common_credit", getCourse_common_credit);
		/*model.addAttribute("getCourse_common_classification", getCourse_common_classification);*/
		model.addAttribute("getCourse_common_department", getCourse_common_department);

		return "views/enrollment/enrollment_register";
	}

	/*각 코스에 대한 정보 보여주기*/
	@RequestMapping(value = "/course_id_info.do")
	@ResponseBody
	public Map<String, Object> course_id_info(@RequestParam(value = "course_id", defaultValue = "0") int course_id) throws Exception {
		Map<String, Object> response = new HashMap<>();

		// 해당 코스에 대한 학사정보 가져오기
		List<CourseVO> Course_Info = courseService.getCourse_Info(course_id);

		if (Course_Info == null || Course_Info.isEmpty()) {
			response.put("status", "fail");
		} else {
			response.put("status", "ok");
			CourseVO course = Course_Info.get(0); // 첫 번째 코스 정보 가져오기
			response.put("description", course.getDescription());
			response.put("semester", course.getSemester());
			response.put("credit", course.getCredit());
			response.put("classification", course.getClassification());
			response.put("department", course.getDepartment());
		}
		return response; // JSON 형식으로 반환
	}

	/*	코스에 해당하는 강의자료 보여주기*/
	@RequestMapping(value = "/enroll_show.do")
	@ResponseBody
	public Map<String, Object> enroll_show(CourseVO cvo, HttpServletRequest request, Model model, @RequestParam(value = "course_id", defaultValue = "0") int course_id) throws Exception {
		log.debug("course_id : " + course_id);

		Map<String, Object> response = new HashMap<String, Object>();

		List<Enrollment_registrationVO> getEnroll_data = courseService.enroll_show(course_id);

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		cvo.setUsername(username);
		cvo.setCourse_id(course_id);

		model.addAttribute("getEnroll_data", getEnroll_data);
		System.out.println(getEnroll_data.size());
		if (getEnroll_data == null || getEnroll_data.isEmpty()) {
			response.put("status", "fail");
		} else {
			response.put("status", "ok");
			response.put("data", getEnroll_data);

			for (int i = 0; i < getEnroll_data.size(); i++) {
				log.debug("해당 강의의 아이디 : " + getEnroll_data.get(i).getRegistration_id());
			}
			/*	for (int i = 0; i < getEnroll_data.size(); i++) {
					response.put("instructor_name", getEnroll_data.get(i).getInstructor_name());
					response.put("instruct_title", getEnroll_data.get(i).getInstruct_title());
					response.put("i_description", getEnroll_data.get(i).getI_description());
					response.put("enroll_start_time", getEnroll_data.get(i).getEnroll_start_time());
					response.put("enroll_end_time", getEnroll_data.get(i).getEnroll_end_time());
				}*/
			log.debug("==>>" + response);
		}
		return response;
	}

	/*코스에 해당하는 각각의 강의 삭제*/
	@RequestMapping(value = "/element_enroll_delete.do")
	@ResponseBody
	public String element_enroll_delete(@RequestParam(value = "registration_id") int registration_id) throws Exception {
		int result = courseService.element_enroll_delete(registration_id);
		if (result == 1) {
			return "ok";
		} else {
			return "fail";
		}

	}

	/*해당 코스 삭제*/
	@RequestMapping(value = "/course_delete.do")
	@ResponseBody
	public String course_delete(@RequestParam("course_id") int course_id) throws Exception {
		int result = courseService.course_delete(course_id);
		if (result == 1) {
			return "ok";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "/instruct_add.do")
	@ResponseBody
	public String instruct_add(Enrollment_registrationVO erVO, @RequestParam(value = "username") String username, @RequestParam(value = "course_id") int course_id, @RequestParam(value = "instructor_name") String instructor_name, @RequestParam(value = "instruct_title") String instruct_title, @RequestParam(value = "i_description") String i_description, @RequestParam(value = "enroll_start_time") String enroll_start_time, @RequestParam(value = "enroll_end_time") String enroll_end_time) throws Exception {

		int user_id = userService.getUser_id(username);

		erVO.setUser_id(user_id);
		erVO.setCourse_id(course_id);
		erVO.setInstructor_name(instructor_name);
		erVO.setInstruct_title(instruct_title);
		erVO.setI_description(i_description);
		erVO.setEnroll_start_time(enroll_start_time);
		erVO.setEnroll_end_time(enroll_end_time);
		String result = courseService.instruct_add(erVO);

		if ("ok".equals(result)) {
			return "ok";
		} else {
			return "fail";
		}

	}

	@RequestMapping(value = "/instruct_delete.do")
	@ResponseBody
	public String instruct_delete(@RequestParam("course_id") int course_id) throws Exception {

		String result = courseService.instruct_delete(course_id);
		log.debug("찌거보좌 : " + result);
		if ("ok".equals(result)) {
			return "ok";
		} else {
			return "fail";
		}

	}

	@RequestMapping(value = "/course_com_add.do")
	@ResponseBody
	public String course_com_add(CourseVO courseVO, @RequestParam(value = "com_course_id") int com_course_id, @RequestParam(value = "semester") int semester, @RequestParam(value = "credit") int credit, @RequestParam(value = "department") String department, @RequestParam(value = "classification") String classification) throws Exception {
		log.debug("semester_학기 : " + semester);
		log.debug("credit_학점 : " + credit);
		log.debug("department_학부(과) : " + department);
		log.debug("classification_전공  : " + classification);
		log.debug("course_id : " + com_course_id);

		courseVO.setSemester((semester));
		courseVO.setCredit((credit));
		courseVO.setDepartment(department);
		courseVO.setClassification(classification);
		courseVO.setCourse_id(com_course_id);

		int result = courseService.update_courseInfo(courseVO);
		if (result == 1) {
			return "ok";
		} else {
			return "fail";
		}
	}

}
