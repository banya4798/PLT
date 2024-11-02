package PLT.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import PLT.dao.EnrollmentDAO;
import PLT.service.EnrollmentService;
import PLT.vo.CourseVO;
import PLT.vo.EnrollmentVO;
import PLT.vo.Enrollment_registrationVO;
import PLT.vo.FileVO;

@Service("enrollmentService")
public class EnrollmentImpl implements EnrollmentService {

	@Resource(name = "enrollmentDAO")
	private EnrollmentDAO enrollmentDAO;

	@Override
	public List<CourseVO> getCrsList(EnrollmentVO enrollmentVO) throws Exception {
		return enrollmentDAO.getCrsList(enrollmentVO);
	}

	/*페이징 처리를 위한 전체의 테이블 수*/
	@Override
	public int total(EnrollmentVO enrollmentVO) throws Exception {
		return enrollmentDAO.total(enrollmentVO);
	}

	@Override
	public List<EnrollmentVO> enroll_time(int course_id) throws Exception {
		return enrollmentDAO.enroll_time(course_id);
	}

	// 시간 검색 모달창
	@Override
	public List<CourseVO> get_Time_Ttile_Professor_List(EnrollmentVO enrollVO) throws Exception {
		return enrollmentDAO.get_Time_Ttile_Professor_List(enrollVO);
	}

	@Override
	public String insert_register(EnrollmentVO enVO) throws Exception {
		return enrollmentDAO.insert_register(enVO);
	}

	@Override
	public int update_status(EnrollmentVO enVO) throws Exception {
		return enrollmentDAO.update_status(enVO);
	}

	@Override
	public int cancle_enrollStatus(EnrollmentVO evo) throws Exception {
		int i = enrollmentDAO.cancle_enrollStatus(evo);
		if (i == 1) {
			enrollmentDAO.minus_credit(evo);
			return i;
		}
		return 0;
	}

	/*수강신청 현황 리스트*/
	@Override
	public List<EnrollmentVO> enroll_ListPage(EnrollmentVO evo) throws Exception {
		return enrollmentDAO.enroll_ListPage(evo);
	}

	/*학생의 신청 목록 검색을 위한 코스 공통테이블*/
	@Override
	public int total_course_com(EnrollmentVO evo) throws Exception {
		return enrollmentDAO.total_course_com(evo);
	}

	@Override
	public List<EnrollmentVO> getSearch_1() throws Exception {
		return enrollmentDAO.getSearch_1();
	}

	@Override
	public List<EnrollmentVO> getSearch_2() throws Exception {
		return enrollmentDAO.getSearch_2();
	}

	@Override
	public List<EnrollmentVO> getSearch_3() throws Exception {
		return enrollmentDAO.getSearch_3();
	}

	@Override
	public int total_credit(EnrollmentVO enVO) throws Exception {
		return enrollmentDAO.total_credit(enVO);
	}

	@Override
	public int getCredit(String username) throws Exception {
		return enrollmentDAO.getCredit(username);
	}

	@Override
	public String file(FileVO fileVO) throws Exception {
		return enrollmentDAO.file(fileVO);

	}

	@Override
	public List<FileVO> show_files(FileVO fvo) throws Exception {
		return enrollmentDAO.show_files(fvo);
	}

	@Override
	public List<Enrollment_registrationVO> getEnrollMentList(Enrollment_registrationVO ervo) throws Exception {
		List<Enrollment_registrationVO> list_result = enrollmentDAO.getEnrollMentList(ervo);
		System.out.println("여기됨?? : " + list_result);
		return list_result;
	}

	@Override
	public List<FileVO> getEnrollMentFileList(Enrollment_registrationVO ervo) throws Exception {
		return enrollmentDAO.getEnrollMentFileList(ervo);
	}

	@Override
	public FileVO getFileById(FileVO fileVO) throws Exception {
		return enrollmentDAO.getFileById(fileVO);
	}
}
