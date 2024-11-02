package PLT.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import PLT.FileManager;
import PLT.service.CourseService;
import PLT.service.EnrollmentService;
import PLT.vo.CourseVO;
import PLT.vo.EnrollmentVO;
import PLT.vo.Enrollment_registrationVO;
import PLT.vo.FileVO;

@Controller
@RequestMapping(value = "/PLT")
public class EnrollmentController {
	/************************참고************************/
	private static Logger log = LoggerFactory.getLogger(UserController.class);

	@Resource(name = "enrollmentService")
	private EnrollmentService enrollmentService;

	@Resource(name = "courseService")
	private CourseService courseService;

	/****************************************************/

	/*수강신청 페이지*/
	@RequestMapping(value = "/enrollmentPage.do")
	public String enrollmentPage(HttpServletRequest request, EnrollmentVO enrollVO, Model model, @RequestParam(value = "semester", defaultValue = "") Integer semester, @RequestParam(value = "credit", defaultValue = "") Integer credit, @RequestParam(value = "department", defaultValue = "") String department, @RequestParam(value = "classification", defaultValue = "") String classification, @RequestParam(value = "title", required = false) String title, @RequestParam(value = "professor", required = false) String professor, @RequestParam(value = "search", required = false) String search) throws Exception {
		log.debug("semester : " + semester);
		log.debug("credit : " + credit);
		log.debug("classification : " + classification);
		log.debug("department : " + department);
		log.debug("title : " + title);
		log.debug("professor : " + professor);
		log.debug("search : " + search);

		enrollVO.setSemester(semester);
		enrollVO.setCredit(credit);
		enrollVO.setClassification(classification);
		enrollVO.setDepartment(department);
		enrollVO.setTitle(title);
		enrollVO.setProfessor(professor);
		enrollVO.setSearch(search);

		/* 페이징 */
		// 페이징 처리를 위한 전체의 테이블 수
		int total = enrollmentService.total(enrollVO);

		// 전체 페이지 수
		int totalPage = (int) Math.ceil((double) total / 3);

		// 페이징
		int viewPage = enrollVO.getViewPage();
		// 현재 페이지의 번호가 1페이지아래로 가거나, 전체 페이지보다 크면 첫 번째 페이지로 set
		if (viewPage > totalPage || viewPage < 1) {
			viewPage = 1;
		}

		int startIndex = (viewPage - 1) * 3;
		enrollVO.setStartIndex(startIndex);
		log.debug("startIndex : " + enrollVO.getStartIndex());
		/* !페이징 */

		// 조건들을 거친 목록 가져오기
		List<CourseVO> enroll_List = enrollmentService.getCrsList(enrollVO);

		/*코스의 학사정보 가져오기*/
		/*학기*/
		List<CourseVO> getCourse_common_semester = courseService.getCourse_common_semester();
		log.debug("학기 : " + getCourse_common_semester);

		/*학점*/
		List<CourseVO> getCourse_common_credit = courseService.getCourse_common_credit();
		log.debug("학점 : " + getCourse_common_credit);

		/*학과(부)*/
		List<CourseVO> getCourse_common_department = courseService.getCourse_common_department();
		log.debug("학번 : " + getCourse_common_department);

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		int getCredit = enrollmentService.getCredit(username);

		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("viewPage", viewPage);
		model.addAttribute("enroll_List", enroll_List);
		model.addAttribute("getCourse_common_semester", getCourse_common_semester);
		model.addAttribute("getCourse_common_credit", getCourse_common_credit);
		model.addAttribute("getCourse_common_department", getCourse_common_department);

		model.addAttribute("semester", semester);
		model.addAttribute("credit", credit);
		model.addAttribute("classification", classification);
		model.addAttribute("department", department);
		model.addAttribute("title", title);
		model.addAttribute("title_placeholder", "강좌명을 입력하세요.");
		model.addAttribute("professor", professor);
		model.addAttribute("professor_placeholder", "교수명을 입력하세요.");
		model.addAttribute("search", search);
		model.addAttribute("getCredit", getCredit);

		return "views/enrollment/enrollmentpage";
	}

	/*수강신청 시, 해당 코스의 시간표를 알기 위한 코스 아이디*/
	@RequestMapping(value = "/enroll_time.do")
	@ResponseBody
	public Map<String, String> enroll_time(Model model, @RequestParam(value = "course_id") int course_id) throws Exception {
		log.debug("수강신청의 시간을 알기위해 가져온 해당 코스 아이디 : " + course_id);

		Map<String, String> response = new HashMap<String, String>();
		List<EnrollmentVO> enroll_times = enrollmentService.enroll_time(course_id);
		if (enroll_times == null || enroll_times.isEmpty()) {
			response.put("status", "fail");
		} else {
			log.debug("찌거방 1: " + enroll_times.get(0).getEnroll_start_time());
			log.debug("찌거방2 : " + enroll_times.get(0).getEnroll_end_time());
			response.put("status", "ok");
			response.put("start_time", enroll_times.get(0).getEnroll_start_time());
			response.put("end_time", enroll_times.get(0).getEnroll_end_time());
		}
		return response;
	}

	// 시간 검색 모달창
	@RequestMapping(value = "time_title_professor.do")
	@ResponseBody
	public List<CourseVO> time_title_professor(EnrollmentVO enrollVO, @RequestParam(value = "course_id") int course_id, @RequestParam(value = "enroll_start_time") String enroll_start_time, @RequestParam(value = "enroll_end_time") String enroll_end_time) throws Exception {
		log.debug("코스코스아디 : " + course_id);
		log.debug("시작 시간 : " + enroll_start_time);
		log.debug("시작 시간 : " + enroll_end_time);

		enrollVO.setCourse_id(course_id);
		enrollVO.setEnroll_start_time(enroll_start_time);
		enrollVO.setEnroll_end_time(enroll_end_time);

		// 조건들을 거친 목록 가져오기
		List<CourseVO> enroll_List = enrollmentService.get_Time_Ttile_Professor_List(enrollVO);

		return enroll_List;
	}

	int total_enroll_credit = 0;

	/*수강신청 시, 수강신청 테이블에 저장*/
	@RequestMapping(value = "/selected_register.do")
	@ResponseBody
	public Map<String, String> selected_register(Model model, @RequestParam(value = "title") String title, @RequestParam(value = "department") String department, @RequestParam(value = "semester") String semester, @RequestParam(value = "credit") String credit, @RequestParam(value = "classification") String classification, @RequestParam(value = "professor") String professor, @RequestParam(value = "course_id") int course_id, @RequestParam(value = "username") String username, @RequestParam(value = "instructor_id") int instructor_id, EnrollmentVO enVO) throws Exception {
		Map<String, String> response = new HashMap<>();
		log.debug("학기 1 : " + semester);

		log.debug("학기 2 : " + semester);
		if (title == null || title.isEmpty() || title.equals("X") || department == null || department.isEmpty() || department.equals("X") || classification == null || classification.isEmpty() || classification.equals("X") || professor == null || professor.isEmpty() || professor.equals("X") || username == null || username.isEmpty() || username.equals("X") || semester == null || semester.isEmpty() || credit == null || credit.isEmpty()) {
			log.debug("학기 3 : " + semester);
			response.put("status", "invalid");
			return response;
		} else {
			List<EnrollmentVO> timeData = enrollmentService.enroll_time(course_id);
			if (timeData == null || timeData.isEmpty()) {
				response.put("status", "time_invalid");
				return response;
			}
			String start_time = timeData.get(0).getEnroll_start_time();
			String end_time = timeData.get(0).getEnroll_end_time();

			enVO.setTitle(title);
			enVO.setDepartment(department);
			enVO.setSemester(Integer.parseInt(semester));
			enVO.setCredit(Integer.parseInt(credit));
			enVO.setClassification(classification);
			enVO.setProfessor(professor);
			enVO.setCourse_id(course_id);
			enVO.setUsername(username);
			enVO.setInstructor_id(instructor_id);
			enVO.setEnroll_start_time(start_time);
			enVO.setEnroll_end_time(end_time);
			/*신청학점(21학점이하로 신청가능)*/
			int now_credit = enrollmentService.getCredit(username);
			if (now_credit + Integer.parseInt(credit) > 21) {
				response.put("status", "21down");
				return response;
			}

			String select_check = enrollmentService.insert_register(enVO);
			if (select_check == null) {

				int total_credit_result = enrollmentService.total_credit(enVO);
				if (total_credit_result == 1) {
					response.put("status", "ok");
				} else {
					response.put("status", "total_update_NOresult");
				}

			} else {
				response.put("status", "fail");
			}
			return response;
		}
	}

	/*수강신청 취소*/
	@RequestMapping(value = "/cancle_enrollStatus.do")
	@ResponseBody
	public String cancle_enrollStatus(EnrollmentVO evo, @RequestParam(value = "course_id") int course_id, @RequestParam(value = "username") String username, @RequestParam(value = "credit") int credit) throws Exception {
		evo.setCourse_id(course_id);
		evo.setUsername(username);
		evo.setCredit(credit);

		int result = enrollmentService.cancle_enrollStatus(evo);
		if (result == 1) {
			return "ok";
		} else {
			return "fail";
		}

	}

	// 수강신청 목록 페이지
	@RequestMapping(value = "/enroll_ListPage.do")
	public String enroll_ListPage(HttpServletRequest request, EnrollmentVO evo, Model model, @RequestParam(value = "search_1", defaultValue = "") Integer semester, @RequestParam(value = "search_2", defaultValue = "") Integer credit, @RequestParam(value = "search_3", defaultValue = "") String classification, @RequestParam(value = "searchText", required = false) String searchText) throws Exception {
		evo.setSemester(semester);
		evo.setCredit(credit);
		evo.setClassification(classification);
		evo.setSearchText(searchText);

		List<EnrollmentVO> gs1 = enrollmentService.getSearch_1();
		List<EnrollmentVO> gs2 = enrollmentService.getSearch_2();
		List<EnrollmentVO> gs3 = enrollmentService.getSearch_3();

		List<EnrollmentVO> getEnrollments_List = enrollmentService.enroll_ListPage(evo);

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		int getCredit = enrollmentService.getCredit(username);
		log.debug("ㅇㄻㄴㅇㄻㄴㅇㄹ : " + getCredit);

		model.addAttribute("getEnrollments_List", getEnrollments_List);
		model.addAttribute("gs1", gs1);
		model.addAttribute("gs2", gs2);
		model.addAttribute("gs3", gs3);
		model.addAttribute("semester", semester);
		model.addAttribute("credit", credit);
		model.addAttribute("classification", classification);
		model.addAttribute("searchText", searchText);
		model.addAttribute("getCredit", getCredit);

		return "views/enrollment/enroll_ListPage";
	}

	/*강의 자료 업로드*/
	@RequestMapping(value = "/enroll_material.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> enroll_material(HttpServletRequest request, @RequestParam(value = "instruct_title") String instruct_title, @RequestParam(value = "file_course_id") int course_id, @RequestParam(value = "files") List<MultipartFile> files) throws Exception {
		log.debug("강의자료 업로드를 위한 코스아이디(다른거 더 받아와야 할 수 도?) : " + course_id);
		// 파일 저장 경로 설정
		String uploadDir = "C:\\upload\\";

		Map<String, String> response = new HashMap<String, String>();
		// 파일 업로드 처리
		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				try {
					FileManager fileM = new FileManager();
					// 파일 유효성 검사
					if (!fileM.validateFile(file)) {
						log.error("유효하지 않은 파일: " + file.getOriginalFilename());
						continue; // 유효하지 않은 파일은 건너뜀
					}

					// 파일 저장
					String savedFileName = fileM.saveFile(file, uploadDir);
					log.debug("파일 업로드 성공: " + savedFileName);

					// 파일 정보를 FileVO 객체에 저장 (필요시 사용)
					FileVO fileVO = new FileVO();

					HttpSession session = request.getSession();
					String username = (String) session.getAttribute("username");

					fileVO.setF_origin_name(file.getOriginalFilename());
					fileVO.setF_path(uploadDir + savedFileName);
					fileVO.setCourse_id(course_id);
					fileVO.setF_name(file.getName());
					fileVO.setF_size(file.getSize());
					fileVO.setUsername(username);
					fileVO.setInstruct_title(instruct_title);

					log.debug("파일 경로(uuid적용) : " + savedFileName);
					log.debug("해당 파일을 올리는 강의의 코스아이디 : " + course_id);
					log.debug("파일 파일이름 : " + file.getName());
					log.debug("파일 사이즈 : " + file.getSize());
					log.debug("파일 등록자 : " + username);
					log.debug("파일등록하는 강의제목 : " + instruct_title);

					String file_result = enrollmentService.file(fileVO);
					if (file_result == null) {
						response.put("status", "ok");
					} else {
						response.put("status", "fail");
					}

				} catch (IOException e) {
					log.error("파일 업로드 실패: " + file.getOriginalFilename(), e);
					throw e; // 예외 발생시 다시 던짐
				}
			}
		}

		return response;
	}

	@RequestMapping(value = "show_files")
	@ResponseBody
	public Map<String, Object> show_files(HttpServletRequest request, FileVO fvo, @RequestParam(value = "course_id") int course_id, @RequestParam(value = "registration_id") int registration_id) throws Exception {
		Map<String, Object> response = new HashMap<>();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		fvo.setCourse_id(course_id);
		fvo.setRegistration_id(registration_id);
		fvo.setUsername(username);

		List<FileVO> getShow_files = enrollmentService.show_files(fvo);

		// 리스트가 비어있지 않은지 확인
		if (getShow_files.isEmpty() || getShow_files.get(0).getInstruct_title().length() < 1) {
			response.put("status", "file_list_invalid");
			return response;
		} else {
			response.put("status", "ok");
			response.put("file_data", getShow_files);
			response.put("file_data_title", getShow_files.get(0).getInstruct_title());
		}

		return response;
	}

	@RequestMapping(value = "/download_material.do", method = RequestMethod.GET)
	@ResponseBody
	public void downloadMaterial(@RequestParam(value = "registration_id") int registration_id, @RequestParam(value = "f_id") int f_id, HttpServletResponse response) throws Exception {
		FileVO fileVO = new FileVO();
		fileVO.setF_id(f_id);
		fileVO.setRegistration_id(registration_id);

		FileVO fvo = enrollmentService.getFileById(fileVO);

		if (fvo != null) {
			// 파일 경로 설정
			File file = new File(fvo.getF_path());
			if (!file.exists()) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}

			// MIME 타입 설정
			String mimeType = Files.probeContentType(file.toPath());
			response.setContentType(mimeType != null ? mimeType : "application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fvo.getF_origin_name(), "UTF-8") + "\"");
			response.setContentLengthLong(file.length());

			try (FileInputStream in = new FileInputStream(file); OutputStream out = response.getOutputStream()) {
				byte[] buffer = new byte[4096];
				int bytesRead;

				while ((bytesRead = in.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
			} catch (IOException e) {
				log.error("파일 다운로드 실패: " + fvo.getF_origin_name(), e);
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "파일 다운로드 중 오류가 발생했습니다.");
			}
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일 정보를 찾을 수 없습니다.");
		}
	}

	// 강의 페이지 (학생 or 강사)
	@RequestMapping(value = "/enroll_start.do")
	public String enroll_start(Enrollment_registrationVO ervo, Model model, @RequestParam(value = "course_id") int course_id, @RequestParam(value = "instructor_id") int instructor_id) throws Exception {
		log.debug("수강신청한 강의에 해당하는 아이디 : " + course_id);

		ervo.setCourse_id(course_id);
		ervo.setInstructor_id(instructor_id);

		// 모든 등록 정보를 가져옵니다. registration_id는 쿼리에서 자동으로 할당됩니다.
		List<Enrollment_registrationVO> getEnrollMentList = enrollmentService.getEnrollMentList(ervo);
		List<FileVO> files = new ArrayList<>();
		// 각 등록 정보에 대해 파일 정보 가져오기
		for (int i = 0; i < getEnrollMentList.size(); i++) {
			// 각 등록 정보에서 registration_id를 추출
			int registrationId = getEnrollMentList.get(i).getRegistration_id();
			ervo.setCourse_id(course_id);
			ervo.setInstructor_id(instructor_id);
			ervo.setRegistration_id(registrationId);
			// 파일 정보를 가져오기 위해 registration_id를 설정
			List<FileVO> fileList = enrollmentService.getEnrollMentFileList(ervo);
			files.addAll(fileList);
		}

		log.debug("아우 : " + getEnrollMentList);
		model.addAttribute("getEnrollList", getEnrollMentList);
		model.addAttribute("files", files);
		return "views/enrollment/강의페이지";
	}

	/*수강신청 페이지로 리다이렉션*/
	@RequestMapping(value = "/redirect_enrollmentPage.do", method = RequestMethod.GET)
	public String redirect_enrollmentPage() throws Exception {

		return "redirect:/PLT/enrollmentPage.do";
	}

	/*수강신청 목록으로 리다이렉션*/
	@RequestMapping(value = "/redirect_enroll_ListPage.do", method = RequestMethod.GET)
	public String redirect_enroll_ListPage() throws Exception {

		return "redirect:/PLT/redirect_enroll_ListPage.do";
	}
}
