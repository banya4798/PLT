package PLT.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PLT.vo.CourseVO;
import PLT.vo.Enrollment_registrationVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("courseDAO")
public class CourseDAO extends EgovAbstractDAO {

	public String course_add(CourseVO courseVO) {
		return (String) insert("course_add", courseVO);
	}

	/*코스 데이터 가져오기*/
	public List<CourseVO> getCourseList(int user_id) {
		return (List<CourseVO>) list("getCourseList", user_id);
	}

	/*코스 삭제*/
	public int course_delete(int course_id) {
		return delete("course_delete", course_id);
	}

	/*강의 추가하기*/
	public String instruct_add(Enrollment_registrationVO erVO) {
		return (String) insert("instruct_add", erVO);
	}

	/*강의 데이터 가져오기*/
	public List<Enrollment_registrationVO> getErList(int user_id) {
		return (List<Enrollment_registrationVO>) list("getErList", user_id);
	}

	/*강사 아이디에 해당되는 코스 아이디 가져오기*/
	public List<Integer> getCourse_id(int user_id) {
		return (List<Integer>) list("getCourse_id", user_id);
	}

	/*강의 삭제*/
	public int instruct_delete(int course_id) {
		return delete("instruct_delete", course_id);
	}

	/*코스의 학사정보 가져오기*/
	/*학기*/
	public List<CourseVO> getCourse_common_semester() {
		return (List<CourseVO>) list("getCourse_common_semester");
	}

	/*학점*/
	public List<CourseVO> getCourse_common_credit() {
		return (List<CourseVO>) list("getCourse_common_credit");
	}

	/*전공*/
	/*	public List<CourseVO> getCourse_common_classification(String department) {
			return (List<CourseVO>) list("getCourse_common_classification", department);
		}
	*/
	/*학부(과)*/
	public List<CourseVO> getCourse_common_department() {
		return (List<CourseVO>) list("getCourse_common_department");
	}

	/*해당 코스에 대한 학사정보 업데이트*/
	public int update_courseInfo(CourseVO courseVO) {
		return update("update_courseInfo", courseVO);
	}

	/*해당 코스에 대한 학사정보 가져오기*/
	public List<CourseVO> getCourse_Info(int course_id) {
		return (List<CourseVO>) list("getCourse_Info", course_id);
	}

	/*	코스에 해당하는 강의자료 보여주기*/
	public List<Enrollment_registrationVO> enroll_show(int course_id) {
		return (List<Enrollment_registrationVO>) list("enroll_show", course_id);
	}

	/*코스에 해당하는 각각의 강의 삭제*/
	public int element_enroll_delete(int registration_id) {
		return delete("element_enroll_delete", registration_id);
	}

	public String insert_total_credit(CourseVO cvo) {
		return (String) insert("insert_total_credit", cvo);
	}

	public int getC_id(String username) {
		return (int) select("getC_id", username);
	}

	public int registration_id(CourseVO cvo) {
		return (int) select("registration_id", cvo);
	}

}
