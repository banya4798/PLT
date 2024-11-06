package PLT.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

import PLT.FileManager;
import PLT.service.AssignmentService;
import PLT.vo.AssignmentVO;
import PLT.vo.FeedbackVO;
import PLT.vo.Submission_FileVO;
import PLT.vo.SubmissionsVO;

@Controller
@RequestMapping(value = "/PLT")
public class AssignmentController {
	private static Logger log = LoggerFactory.getLogger(AssignmentController.class);

	@Resource(name = "assignmentService")
	private AssignmentService assignmentService;

	/****************************************************/
	/*홈페이지 화면*/
	@RequestMapping(value = "/plt_homepage.do")
	public String plt_homepage(HttpServletRequest request, Model model, @RequestParam(value = "assignment_id", defaultValue = "0") int assignment_id, @RequestParam(value = "status", defaultValue = "") String status) throws Exception {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		log.debug("쿠키에 저장된 과제아이디 값 : " + assignment_id);
		log.debug("쿠키에 저장된 과제상태 값 : " + status);
		// 학생용 과제 보여주기 위한 강사아이디
		// 수강신청한 코스에 대하여 강사가 등록한 과제 보기위함
		AssignmentVO avo = new AssignmentVO();
		avo.setUsername(username);
		avo.setAssignment_id(assignment_id);

		List<AssignmentVO> getAssignMentList = assignmentService.getAssignMentList(avo);
		List<SubmissionsVO> getSubmissionsList = assignmentService.getSubmissionsList(username);
		/*List<FeedbackVO> getFeedBackRating = assignmentService.getFeedBackRating(avo);*/

		/*String getSubStatus = assignmentService.getSubStatus(username);*/

		model.addAttribute("getAssignMentList", getAssignMentList);
		model.addAttribute("getSubmissionsList", getSubmissionsList);
		/*	model.addAttribute("getFeedBackRating", getFeedBackRating);*/
		return "views/homepage";
	}

	/****************************************************/

	/*과제 등록 페이지*/
	@RequestMapping(value = "/assginmentPage.do")
	public String assignmentPage() throws Exception {

		return "views/assignment/과제등록";
	}

	/*과제 등록*/
	@RequestMapping(value = "/assignmentRegistration.do")
	@ResponseBody
	public String assignmentRegistration(HttpServletRequest request, AssignmentVO avo, @RequestParam(value = "title") String title, @RequestParam(value = "description") String description, @RequestParam(value = "due_date") String due_date, @RequestParam(value = "maxGrade") int max_grade) throws Exception {

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		log.debug("과제 제목 : " + title);
		log.debug("과제 설명 : " + description);
		log.debug("과제 마감일 : " + due_date);
		log.debug("최대 점수 : " + max_grade);

		avo.setTitle(title);
		avo.setDescription(description);
		avo.setDue_date(due_date);
		avo.setMax_grade(max_grade);
		avo.setUsername(username);

		String result = assignmentService.assignmentRegistration(avo);
		if (result == null) {
			return "ok";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "/submission.do")
	@ResponseBody
	public Map<String, Object> submission(HttpServletRequest request, @RequestParam(value = "instructor_id") int instructor_id, @RequestParam(value = "assignment_id") int assignment_id, @RequestParam(value = "assignmentTitle") String title, @RequestParam(value = "assignmentDescription") String content, @RequestParam(value = "assignmentFile", required = false) MultipartFile file) throws Exception {
		Map<String, Object> response = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		// 파일 저장 경로 설정
		String uploadDir = "C:\\submission_file\\";
		SubmissionsVO smv = new SubmissionsVO();
		if (file != null) {
			smv.setF_origin_name(file.getOriginalFilename());
			smv.setTitle(title);
			smv.setContent(content);
			smv.setAssignment_id(assignment_id);
			smv.setInstructor_id(instructor_id);
			smv.setUsername(username);
		} else {
			smv.setTitle(title);
			smv.setContent(content);
			smv.setAssignment_id(assignment_id);
			smv.setUsername(username);
		}

		String sub_result = assignmentService.insert_sub(smv);

		if (sub_result == null) {
			assignmentService.update_assignments_status(smv);
			response.put("status", "sub_ok"); // 과제 제출 성공
			// 파일 업로드 처리
			if (file != null) {
				try {
					FileManager fileM = new FileManager();
					// 파일 유효성 검사
					if (!fileM.validateFile(file)) {
						log.error("유효하지 않은 파일: " + file.getOriginalFilename());
						response.put("file_valid", "validError"); // 확장자 및 파일 크기 검사
						return response;
					}

					// 파일 저장(중복되지않은 이름으로 저장)
					String savedFileName = fileM.saveFile(file, uploadDir);
					log.debug("파일 업로드 성공: " + savedFileName);

					// 파일 정보를 FileVO 객체에 저장 (필요시 사용)
					Submission_FileVO fileVO = new Submission_FileVO();

					fileVO.setF_origin_name(file.getOriginalFilename());
					fileVO.setF_path(uploadDir + savedFileName);
					fileVO.setF_name(file.getName());
					fileVO.setF_size(file.getSize());
					fileVO.setUsername(username);

					log.debug("파일 경로(uuid적용) : " + savedFileName);
					log.debug("파일 파일이름 : " + file.getName());
					log.debug("파일 사이즈 : " + file.getSize());
					log.debug("파일 등록자 : " + username);

					SubmissionsVO sub = assignmentService.getSubmissions(smv);
					smv.setStatus(sub.getStatus());
					fileVO.setSubmissions_id(sub.getSubmissions_id());
					String file_result = assignmentService.sub_file(fileVO);
					if (file_result == null) {
						response.put("file", "completed");
						// json 변환
						ObjectMapper objectMapper = new ObjectMapper();
						String jsonString = objectMapper.writeValueAsString(smv);

						// url형식의 json을 인코딩
						String encodedJsonString = URLEncoder.encode(jsonString, StandardCharsets.UTF_8.toString());
						System.out.println("json : " + jsonString);
						response.put("sub_status", encodedJsonString);
					} else {
						response.put("file", "fail");
					}

				} catch (IOException e) {
					log.error("파일 업로드 실패: " + file.getOriginalFilename(), e);
					throw e; // 예외 발생시 다시 던짐
				}
			}
		} else {
			response.put("status", "submission_fail");
		}

		return response;
	}

	/*강사의 과제 채점*/
	@RequestMapping(value = "/give_score.do")
	@ResponseBody
	public Map<String, String> give_score(HttpServletRequest request, @RequestParam(value = "assignment_id") int assignment_id, @RequestParam(value = "student_id") int student_id, @RequestParam(value = "submissions_id") int submissions_id, @RequestParam(value = "rating") int rating, @RequestParam(value = "s_feedback") String common) throws Exception {
		Map<String, String> response = new HashMap<String, String>();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		log.debug("student_id : " + student_id);
		log.debug("submissions_id : " + submissions_id);
		log.debug("rating : " + rating);
		log.debug("common : " + common);

		FeedbackVO fvo = new FeedbackVO();
		fvo.setAssignment_id(assignment_id);
		fvo.setStudent_id(student_id);
		fvo.setSubmissions_id(submissions_id);
		fvo.setUsername(username);
		fvo.setCommon(common);
		fvo.setRating(rating);

		// 채점한 내용 피드백 테이블에 삽입
		String give_score_result = assignmentService.give_score(fvo);
		if (give_score_result == null) {
			int update_submissions_grade = assignmentService.update_submissions_grade(fvo);
			if (update_submissions_grade == 1) {
				response.put("status", "allOk");
			} else {
				response.put("status", "student_score_fail");
				return response;
			}
		} else {
			response.put("status", "noGiveScore");
		}
		return response;
	}

	@RequestMapping(value = "/student_submiision_delete_from_instructor.do")
	@ResponseBody
	public String student_submiision_delete_from_instructor(SubmissionsVO svo, @RequestParam(value = "submissions_id") int submissions_id) throws Exception {
		int delete_result = assignmentService.student_submiision_delete_from_instructor(submissions_id);
		if (delete_result != 0) {
			return "ok";
		} else {
			return "fail";
		}
	}

}
