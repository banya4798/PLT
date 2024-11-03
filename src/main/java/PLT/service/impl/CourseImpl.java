package PLT.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import PLT.dao.CourseDAO;
import PLT.service.CourseService;
import PLT.vo.CourseVO;
import PLT.vo.Enrollment_registrationVO;
import PLT.vo.UserVO;

@Service("courseService")
public class CourseImpl implements CourseService {

	@Resource(name = "courseDAO")
	CourseDAO courseDAO;

	@Override
	public String course_add(CourseVO courseVO) throws Exception {
		String result = courseDAO.course_add(courseVO);
		if (result == null) {
			return "ok";
		} else {
			return "fail";
		}
	}

	/*코스 데이터 가져오기*/
	@Override
	public List<CourseVO> getCourseList(int user_id) throws Exception {
		return courseDAO.getCourseList(user_id);
	}

	/*코스 삭제*/
	@Override
	public int course_delete(int course_id) throws Exception {
		return courseDAO.course_delete(course_id);
	}

	/*강의 추가하기*/
	@Override
	public String instruct_add(Enrollment_registrationVO erVO) throws Exception {
		String result = courseDAO.instruct_add(erVO);
		System.out.println(result);
		if (result == null) {
			return "ok";
		} else {
			return "fail";
		}
	}

	/*강의 데이터 가져오기*/
	@Override
	public List<Enrollment_registrationVO> getErList(int user_id) throws Exception {
		return courseDAO.getErList(user_id);
	}

	/*강사 아이디에 해당되는 코스 아이디 가져오기*/
	@Override
	public List<Integer> getCourse_id(int user_id) throws Exception {
		return courseDAO.getCourse_id(user_id);
	}

	/*강의 삭제*/
	@Override
	public String instruct_delete(int course_id) throws Exception {
		int result = courseDAO.instruct_delete(course_id);
		System.out.println(result);
		if (result <= 5) {
			return "ok";
		} else {
			return "fail";
		}

	}

	/*코스의 학사정보 가져오기*/
	/*학기*/
	@Override
	public List<CourseVO> getCourse_common_semester() throws Exception {
		return courseDAO.getCourse_common_semester();
	}

	/*학점*/
	@Override
	public List<CourseVO> getCourse_common_credit() throws Exception {
		return courseDAO.getCourse_common_credit();
	}

	/*전공*/
	/*@Override
	public List<CourseVO> getCourse_common_classification(String department) throws Exception {
		return courseDAO.getCourse_common_classification(department);
	}*/

	@Override
	public List<CourseVO> getCourse_common_department() throws Exception {
		return courseDAO.getCourse_common_department();
	}

	/*해당 코스에 대한 학사정보 업데이트*/
	@Override
	public int update_courseInfo(CourseVO courseVO) throws Exception {
		return courseDAO.update_courseInfo(courseVO);
	}

	/*해당 코스에 대한 학사정보 가져오기*/
	@Override
	public List<CourseVO> getCourse_Info(int course_id) throws Exception {
		return courseDAO.getCourse_Info(course_id);
	}

	/*	코스에 해당하는 강의자료 보여주기*/
	@Override
	public List<Enrollment_registrationVO> enroll_show(int course_id) throws Exception {
		return courseDAO.enroll_show(course_id);
	}

	/*코스에 해당하는 각각의 강의 삭제*/
	@Override
	public int element_enroll_delete(int registration_id) throws Exception {
		return courseDAO.element_enroll_delete(registration_id);
	}

	@Override
	public String insert_total_credit(CourseVO cvo) throws Exception {
		return courseDAO.insert_total_credit(cvo);
	}

	@Override
	public int getC_id(String username) throws Exception {
		return courseDAO.getC_id(username);
	}

	@Override
	public int registration_id(CourseVO cvo) throws Exception {
		return courseDAO.registration_id(cvo);
	}

	@Override
	public List<UserVO> getEnrollment_student(int course_id) throws Exception {
		return courseDAO.getEnrollment_student(course_id);
	}
}
