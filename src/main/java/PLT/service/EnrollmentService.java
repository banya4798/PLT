package PLT.service;

import java.util.List;

import PLT.vo.CourseVO;
import PLT.vo.EnrollmentVO;
import PLT.vo.Enrollment_registrationVO;
import PLT.vo.FileVO;

public interface EnrollmentService {

	/*학생 수강신청용*/
	List<CourseVO> getCrsList(EnrollmentVO enrollVO) throws Exception;

	/*페이징 처리를 위한 전체의 테이블 수*/
	int total(EnrollmentVO enrollmentVO) throws Exception;

	/*수강신청 시, 해당 코스의 시간표를 알기 위한 코스 아이디*/
	List<EnrollmentVO> enroll_time(int course_id) throws Exception;

	// 시간 검색 모달창
	List<CourseVO> get_Time_Ttile_Professor_List(EnrollmentVO enrollVO) throws Exception;

	/*수강신청 DB저장*/
	String insert_register(EnrollmentVO enVO) throws Exception;

	/*수강신청 상태 (수강 or 미수강)*/
	int update_status(EnrollmentVO enVO) throws Exception;

	/*수강신청 취소*/
	int cancle_enrollStatus(EnrollmentVO evo) throws Exception;

	/*수강신청 현황 리스트*/
	List<EnrollmentVO> enroll_ListPage(EnrollmentVO evo) throws Exception;

	/*학생의 신청 목록 검색을 위한 코스 공통테이블*/
	int total_course_com(EnrollmentVO evo) throws Exception;

	List<EnrollmentVO> getSearch_1() throws Exception;

	List<EnrollmentVO> getSearch_2() throws Exception;

	List<EnrollmentVO> getSearch_3() throws Exception;

	int total_credit(EnrollmentVO enVO) throws Exception;

	int getCredit(String username) throws Exception;

	String file(FileVO fileVO) throws Exception;

	List<FileVO> show_files(FileVO fvo) throws Exception;

	List<Enrollment_registrationVO> getEnrollMentList(Enrollment_registrationVO ervo) throws Exception;

	List<FileVO> getEnrollMentFileList(Enrollment_registrationVO ervo) throws Exception;
}
