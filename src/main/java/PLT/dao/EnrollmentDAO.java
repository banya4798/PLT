package PLT.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PLT.vo.CourseVO;
import PLT.vo.EnrollmentVO;
import PLT.vo.Enrollment_registrationVO;
import PLT.vo.FileVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("enrollmentDAO")
public class EnrollmentDAO extends EgovAbstractDAO {

	public List<CourseVO> getCrsList(EnrollmentVO enrollmentVO) {
		return (List<CourseVO>) list("getCrsList", enrollmentVO);
	}

	/*페이징 처리를 위한 전체의 테이블 수*/
	public int total(EnrollmentVO enrollmentVO) {
		return (int) select("total", enrollmentVO);
	}

	/*수강신청 시, 해당 코스의 시간표를 알기 위한 코스 아이디*/
	public List<EnrollmentVO> enroll_time(int course_id) {
		return (List<EnrollmentVO>) list("enroll_time", course_id);
	}

	// 시간 검색 모달창
	public List<CourseVO> get_Time_Ttile_Professor_List(EnrollmentVO enrollVO) {
		return (List<CourseVO>) list("get_Time_Ttile_Professor_List", enrollVO);
	}

	public String insert_register(EnrollmentVO enVO) {
		return (String) insert("insert_register", enVO);
	}

	public int update_status(EnrollmentVO enVO) {
		return update("update_status", enVO);
	}

	/*수강신청 취소*/
	public int cancle_enrollStatus(EnrollmentVO evo) {
		return delete("cancle_enrollStatus", evo);
	}

	/*수강신청 현황 리스트*/
	public List<EnrollmentVO> enroll_ListPage(EnrollmentVO evo) {
		return (List<EnrollmentVO>) list("enroll_ListPage", evo);
	}

	/*학생의 신청 목록 검색을 위한 코스 공통테이블*/
	public int total_course_com(EnrollmentVO evo) {
		return (int) select("total_course_com", evo);
	}

	public List<EnrollmentVO> getSearch_1() {
		return (List<EnrollmentVO>) list("getSearch_1");
	}

	public List<EnrollmentVO> getSearch_2() {
		return (List<EnrollmentVO>) list("getSearch_2");
	}

	public List<EnrollmentVO> getSearch_3() {
		return (List<EnrollmentVO>) list("getSearch_3");
	}

	public int total_credit(EnrollmentVO enVO) {
		return update("total_credit", enVO);
	}

	public void minus_credit(EnrollmentVO evo) {
		update("minus_credit", evo);
	}

	public int getCredit(String username) {
		return (int) select("getCredit", username);
	}

	public String file(FileVO fileVO) {
		return (String) insert("file", fileVO);

	}

	public List<FileVO> show_files(FileVO fvo) {
		return (List<FileVO>) list("show_files", fvo);
	}

	public List<Enrollment_registrationVO> getEnrollMentList(Enrollment_registrationVO ervo) {
		return (List<Enrollment_registrationVO>) list("getEnrollMentList", ervo);
	}

	public List<FileVO> getEnrollMentFileList(Enrollment_registrationVO ervo) {
		return (List<FileVO>) list("getEnrollMentFileList", ervo);
	}

	public FileVO getFileById(FileVO fileVO) {
		return (FileVO) select("getFileById", fileVO);
	}

}
