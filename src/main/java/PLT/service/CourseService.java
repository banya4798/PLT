package PLT.service;

import java.util.List;

import PLT.vo.CourseVO;
import PLT.vo.Enrollment_registrationVO;

public interface CourseService {

	/*코스 추가하기*/
	String course_add(CourseVO courseVO) throws Exception;

	/*코스 데이터 가져오기*/
	List<CourseVO> getCourseList(int user_id) throws Exception;

	/*코스 삭제*/
	int course_delete(int course_id) throws Exception;

	/*강의 추가하기*/
	String instruct_add(Enrollment_registrationVO erVO) throws Exception;

	/*강의 데이터 가져오기*/
	List<Enrollment_registrationVO> getErList(int user_id) throws Exception;

	/*강사 아이디에 해당되는 코스 아이디 가져오기*/
	List<Integer> getCourse_id(int user_id) throws Exception;

	/*강의 삭제*/
	String instruct_delete(int course_id) throws Exception;

	/*코스의 학사정보 가져오기*/
	/*학기*/
	List<CourseVO> getCourse_common_semester() throws Exception;

	/*학점*/
	List<CourseVO> getCourse_common_credit() throws Exception;

	/*전공*/
	/*List<CourseVO> getCourse_common_classification(String department) throws Exception;*/

	/*학부(과)*/
	List<CourseVO> getCourse_common_department() throws Exception;

	/*해당 코스에 대한 학사정보 업데이트*/
	int update_courseInfo(CourseVO courseVO) throws Exception;

	/*해당 코스에 대한 학사정보 가져오기*/
	List<CourseVO> getCourse_Info(int course_id) throws Exception;

	/*	코스에 해당하는 강의자료 보여주기*/
	List<Enrollment_registrationVO> enroll_show(int course_id) throws Exception;

	/*코스에 해당하는 각각의 강의 삭제*/
	int element_enroll_delete(int registration_id) throws Exception;

	String insert_total_credit(CourseVO cvo) throws Exception;

	int getC_id(String username) throws Exception;

	int registration_id(CourseVO cvo) throws Exception;

}
